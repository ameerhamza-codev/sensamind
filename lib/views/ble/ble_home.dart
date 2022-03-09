import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:mindwatch/connectors/app_connector.dart';
import 'package:mindwatch/data/ble_service.dart';
import 'package:mindwatch/views/ble/widgets.dart';
import 'package:mindwatch/views/widgets/app_bar.dart';
import 'package:mindwatch/views/widgets/app_scaffold.dart';

import '../../blocs/app_bloc/app_bloc.dart';

class BLEHome extends StatefulWidget {
  @override
  _BLEHomeState createState() => _BLEHomeState();
}

class _BLEHomeState extends State<BLEHome> {
  BLEService _getBleService(BuildContext context) =>
      AppBloc.of(context).bleService;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BluetoothState>(
      stream: _getBleService(context).getState(),
      initialData: BluetoothState.unknown,
      builder: (BuildContext c, AsyncSnapshot<BluetoothState> snapshot) {
        final BluetoothState state = snapshot.data;
        if (state == BluetoothState.on) {
          return FindDevicesScreen();
        }
        return BluetoothOffScreen(state: state);
      },
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key key, this.state}) : super(key: key);

  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text(
              'Bluetooth Adapter is ${state != null ? state.toString().substring(15) : 'not available'}.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .subtitle1
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

class FindDevicesScreen extends StatelessWidget {
  Future<void> _startScan() =>
      FlutterBlue.instance.startScan(timeout: const Duration(seconds: 10));

  BLEService _getBleService(BuildContext context) =>
      AppBloc.of(context).bleService;

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: const Text('Find Devices'),
      ),
      body: RefreshIndicator(
        onRefresh: _startScan,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              StreamBuilder<List<BluetoothDevice>>(
                stream: _getBleService(context).getConnectedDevices(),
                initialData: const <BluetoothDevice>[],
                builder: (BuildContext c,
                    AsyncSnapshot<List<BluetoothDevice>> snapshot) {
                  return Column(
                    children: snapshot.data
                        .map((BluetoothDevice d) => ListTile(
                              title: Text(d.name),
                              subtitle: Text(d.id.toString()),
                              trailing: StreamBuilder<BluetoothDeviceState>(
                                stream: d.state,
                                initialData: BluetoothDeviceState.disconnected,
                                builder: (BuildContext c,
                                    AsyncSnapshot<BluetoothDeviceState>
                                        snapshot) {
                                  if (snapshot.data ==
                                      BluetoothDeviceState.connected) {
                                    return RaisedButton(
                                      child: const Text('Disconnect'),
                                      onPressed: () async {
                                        d.disconnect();
//                                        await _connectAndListen(d);
                                      },
                                    );
                                  }
                                  return Text(snapshot.data.toString());
                                },
                              ),
                            ))
                        .toList(),
                  );
                },
              ),
              StreamBuilder<List<ScanResult>>(
                stream: _getBleService(context).getScanResults(),
                initialData: const <ScanResult>[],
                builder:
                    (BuildContext c, AsyncSnapshot<List<ScanResult>> snapshot) {
                  return Column(
                    children: snapshot.data
                        .map<Widget>(
                          (ScanResult r) => AppConnector(
                            builder:
                                (BuildContext context, AppViewModel model) {
                              return ScanResultTile(
                                result: r,
                                onTap: () async {
                                  _getBleService(context).connectAndListen(
                                    r.device,
                                    model.sendBTButtonClick,
                                  );
//                              return Navigator.of(context).push(
//                              MaterialPageRoute<void>(builder: (context) {
//                                r.device.connect();
//                                return DeviceScreen(device: r.device);
//                              }),
//                            );
                                },
                              );
                            },
                          ),
                        )
                        .toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: StreamBuilder<bool>(
        stream: _getBleService(context).isScanning(),
        initialData: false,
        builder: (BuildContext c, AsyncSnapshot<bool> snapshot) {
          if (snapshot.data) {
            return FloatingActionButton(
              child: const Icon(Icons.stop),
              onPressed: () => _getBleService(context).stopScan(),
              backgroundColor: Colors.red,
            );
          } else {
            return FloatingActionButton(
              child: const Icon(Icons.search),
              onPressed: _startScan,
            );
          }
        },
      ),
    );
  }
}

class DeviceScreen extends StatelessWidget {
  const DeviceScreen({Key key, this.device}) : super(key: key);

  final BluetoothDevice device;

  List<int> _getRandomBytes() {
    final Random math = Random();
    return <int>[
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255),
      math.nextInt(255)
    ];
  }

  List<Widget> _buildServiceTiles(List<BluetoothService> services) {
    return services.map(
      (BluetoothService s) {
        return ServiceTile(
          service: s,
          characteristicTiles: s.characteristics.map(
            (BluetoothCharacteristic c) {
              return CharacteristicTile(
                characteristic: c,
                onReadPressed: () => c.read(),
                onWritePressed: () async {
                  await c.write(_getRandomBytes(), withoutResponse: true);
                  await c.read();
                },
                onNotificationPressed: () async {
                  await c.setNotifyValue(!c.isNotifying);
                  await c.read();
                },
                descriptorTiles: c.descriptors.map(
                  (BluetoothDescriptor d) {
                    return DescriptorTile(
                      descriptor: d,
                      onReadPressed: () => d.read(),
                      onWritePressed: () => d.write(_getRandomBytes()),
                    );
                  },
                ).toList(),
              );
            },
          ).toList(),
        );
      },
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      appBar: CustomAppBar(
        title: Text(device.name),
        actions: <Widget>[
          StreamBuilder<BluetoothDeviceState>(
            stream: device.state,
            initialData: BluetoothDeviceState.connecting,
            builder:
                (BuildContext c, AsyncSnapshot<BluetoothDeviceState> snapshot) {
              VoidCallback onPressed;
              String text;
              switch (snapshot.data) {
                case BluetoothDeviceState.connected:
                  onPressed = () => device.disconnect();
                  text = 'DISCONNECT';
                  break;
                case BluetoothDeviceState.disconnected:
                  onPressed = () => device.connect();
                  text = 'CONNECT';
                  break;
                default:
                  onPressed = null;
                  text = snapshot.data.toString().substring(21).toUpperCase();
                  break;
              }
              return FlatButton(
                onPressed: onPressed,
                child: Text(
                  text,
                  style: Theme.of(context)
                      .primaryTextTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
              );
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StreamBuilder<BluetoothDeviceState>(
              stream: device.state,
              initialData: BluetoothDeviceState.connecting,
              builder: (BuildContext c,
                      AsyncSnapshot<BluetoothDeviceState> snapshot) =>
                  ListTile(
                leading: (snapshot.data == BluetoothDeviceState.connected)
                    ? const Icon(Icons.bluetooth_connected)
                    : const Icon(Icons.bluetooth_disabled),
                title: Text(
                    'Device is ${snapshot.data.toString().split('.')[1]}.'),
                subtitle: Text('${device.id}'),
                trailing: StreamBuilder<bool>(
                  stream: device.isDiscoveringServices,
                  initialData: false,
                  builder: (BuildContext c, AsyncSnapshot<bool> snapshot) =>
                      IndexedStack(
                    index: snapshot.data ? 1 : 0,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.refresh),
                        onPressed: () => device.discoverServices(),
                      ),
                      const IconButton(
                        icon: SizedBox(
                          child: CircularProgressIndicator(
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.grey),
                          ),
                          width: 18.0,
                          height: 18.0,
                        ),
                        onPressed: null,
                      )
                    ],
                  ),
                ),
              ),
            ),
            StreamBuilder<int>(
              stream: device.mtu,
              initialData: 0,
              builder: (BuildContext c, AsyncSnapshot<int> snapshot) =>
                  ListTile(
                title: const Text('MTU Size'),
                subtitle: Text('${snapshot.data} bytes'),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () => device.requestMtu(223),
                ),
              ),
            ),
            StreamBuilder<List<BluetoothService>>(
              stream: device.services,
              initialData: const <BluetoothService>[],
              builder: (BuildContext c,
                  AsyncSnapshot<List<BluetoothService>> snapshot) {
                return Column(
                  children: _buildServiceTiles(snapshot.data),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
