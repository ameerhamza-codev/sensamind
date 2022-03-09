import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'package:mindwatch/models/bt_click_data.dart';

class BLEService {
  static const int button1 = 48;
  static const int button2 = 49;
  static final FlutterBlue _ble = FlutterBlue.instance;

  Stream<BluetoothState> getState() => _ble.state;

  Stream<List<BluetoothDevice>> getConnectedDevices() {
    return Stream<void>.periodic(const Duration(seconds: 2))
        .asyncMap((_) => _ble.connectedDevices)
        .map((List<BluetoothDevice> event) => event
            .where((BluetoothDevice element) => _filterByName(element.name))
            .toList());
  }

  bool _filterByName(String name) => kDebugMode || name == 'MindWatch';
  StreamSubscription<List<BluetoothService>> _sub;
  StreamSubscription<List<int>> _char;

  Stream<List<ScanResult>> getScanResults() =>
      _ble.scanResults.map((List<ScanResult> event) => event
          .where((ScanResult element) =>
              _filterByName(element.advertisementData.localName))
          .toList());

  Stream<bool> isScanning() => _ble.isScanning;

  Future<bool> isOn() => _ble.isOn;

  Future<bool> isAvailable() => _ble.isAvailable;

  Future<void> stopScan() => _ble.stopScan();

  Future<void> connectAndListen(
    BluetoothDevice d,
    Function(BtClickData) sendBTButtonClick,
  ) async {
    await d.connect();
    _sub?.cancel();
    final List<BluetoothService> event = await d.discoverServices();

    try {
      final BluetoothService d = event.firstWhere((BluetoothService element) =>
          element.uuid.toString().startsWith('0000ffe0'));
      print(d);
      final BluetoothCharacteristic characteristic = d.characteristics
          .firstWhere((BluetoothCharacteristic element) =>
              element.uuid.toString().startsWith('0000ffe1'));
      print(characteristic.isNotifying);
      if (!characteristic.isNotifying)
        await characteristic.setNotifyValue(true);
      _char?.cancel();
      _char = characteristic.value.listen((List<int> event) {
        if (event?.isNotEmpty ?? false) {
          final BtClickData d = BtClickData((BtClickDataBuilder b) {
            b
              ..button = event.first == BLEService.button1
                  ? 1
                  : event.first == BLEService.button2
                      ? 2
                      : null
              ..clickedAt = DateTime.now().toUtc();
          });
          sendBTButtonClick(d);
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
