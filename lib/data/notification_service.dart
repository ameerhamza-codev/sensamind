import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class ReceivedNotification {
  ReceivedNotification({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.payload,
  });

  final int id;
  final String title;
  final String body;
  final String payload;
}

class NotificationService {
  factory NotificationService() {
    _instance ??= NotificationService._();
    return _instance;
  }

  NotificationService._();

  static NotificationService _instance;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final BehaviorSubject<ReceivedNotification>
      didReceiveLocalNotificationSubject =
      BehaviorSubject<ReceivedNotification>();

  final BehaviorSubject<String> selectNotificationSubject =
      BehaviorSubject<String>();

  static const MethodChannel platform =
      MethodChannel('sensamind/notifications');

  Future<void> init() async {
    await _configureLocalTimeZone();

    // final NotificationAppLaunchDetails notificationAppLaunchDetails =
    //     await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/launcher_icon');

    /// Note: permissions aren't requested here just to demonstrate that can be
    /// done later
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
            requestAlertPermission: false,
            requestBadgePermission: false,
            requestSoundPermission: false,
            onDidReceiveLocalNotification:
                (int id, String title, String body, String payload) async {
              didReceiveLocalNotificationSubject.add(ReceivedNotification(
                  id: id, title: title, body: body, payload: payload));
            });

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
      if (payload != null) {
        debugPrint('notification payload: $payload');
      }
      selectNotificationSubject.add(payload);
    });
  }

  Future<void> _configureLocalTimeZone() async {
    tz.initializeTimeZones();

    try {
      final String timeZoneName =
          await platform.invokeMethod('getTimeZoneName');
      tz.setLocalLocation(tz.getLocation(timeZoneName));
    } catch (e) {
      tz.setLocalLocation(tz.getLocation('America/Detroit'));
    }
  }

  void requestPermissions() {
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
    flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            MacOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  // void configureDidReceiveLocalNotificationSubject() {
  //   NotificationService()
  //       .didReceiveLocalNotificationSubject
  //       .stream
  //       .listen((ReceivedNotification receivedNotification) async {
  //     await showDialog<Widget>(
  //       context: context,
  //       builder: (BuildContext context) => CupertinoAlertDialog(
  //         title: receivedNotification.title != null
  //             ? Text(receivedNotification.title)
  //             : null,
  //         content: receivedNotification.body != null
  //             ? Text(receivedNotification.body)
  //             : null,
  //         actions: <Widget>[
  //           CupertinoDialogAction(
  //             isDefaultAction: true,
  //             onPressed: () async {
  //               Navigator.of(context, rootNavigator: true).pop();
  //               // await Navigator.push(
  //               //   context,
  //               //   MaterialPageRoute<void>(
  //               //     builder: (BuildContext context) =>
  //               //         SecondScreen(receivedNotification.payload),
  //               //   ),
  //               // );
  //             },
  //             child: const Text('Ok'),
  //           )
  //         ],
  //       ),
  //     );
  //   });
  // }

  // void configureSelectNotificationSubject() {
  //   selectNotificationSubject.stream.listen((String payload) async {
  //     // await Navigator.push(
  //     //   context,
  //     //   MaterialPageRoute<void>(
  //     //       builder: (BuildContext context) => SecondScreen(payload)),
  //     // );
  //   });
  // }

  static const AndroidNotificationDetails androidChannelSpecifics =
      AndroidNotificationDetails(
    'Sensamind',
    'Sensamind test',
    'Test Description',
    importance: Importance.max,
    priority: Priority.high,
    icon: '@mipmap/ic_launcher',
    playSound: true,
    timeoutAfter: 5000,
    styleInformation: DefaultStyleInformation(true, true),
  );
  static const IOSNotificationDetails iosChannelSpecifics =
      IOSNotificationDetails();
  static const NotificationDetails platformChannelSpecifics =
      NotificationDetails(
          android: androidChannelSpecifics, iOS: iosChannelSpecifics);

  Future<void> showNotification(String title, String body) async {
    await flutterLocalNotificationsPlugin.periodicallyShow(
      DateTime.now().millisecondsSinceEpoch % 10000,
      'repeating title',
      'repeating body',
      RepeatInterval.everyMinute,
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
    );
  }

  Future<void> scheduleDailyNotification() async {
    await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'daily scheduled notification title',
        'daily scheduled notification body',
        _nextInstanceOfTenAM(),
        platformChannelSpecifics,
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time);
  }

//
// Future<void> _showNotificationCustomSound() async {
//   const AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails(
//     'your other channel id',
//     'your other channel name',
//     'your other channel description',
//     sound: RawResourceAndroidNotificationSound('slow_spring_board'),
//   );
//   const IOSNotificationDetails iOSPlatformChannelSpecifics =
//       IOSNotificationDetails(sound: 'slow_spring_board.aiff');
//   const MacOSNotificationDetails macOSPlatformChannelSpecifics =
//       MacOSNotificationDetails(sound: 'slow_spring_board.aiff');
//   const NotificationDetails platformChannelSpecifics = NotificationDetails(
//       android: androidPlatformChannelSpecifics,
//       iOS: iOSPlatformChannelSpecifics,
//       macOS: macOSPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.show(
//       0,
//       'custom sound notification title',
//       'custom sound notification body',
//       platformChannelSpecifics);
// }
//
// Future<void> _showNotificationCustomVibrationIconLed() async {
//   final Int64List vibrationPattern = Int64List(4);
//   vibrationPattern[0] = 0;
//   vibrationPattern[1] = 1000;
//   vibrationPattern[2] = 5000;
//   vibrationPattern[3] = 2000;
//
//   final AndroidNotificationDetails androidPlatformChannelSpecifics =
//       AndroidNotificationDetails('other custom channel id',
//           'other custom channel name', 'other custom channel description',
//           icon: 'secondary_icon',
//           largeIcon: const DrawableResourceAndroidBitmap('sample_large_icon'),
//           vibrationPattern: vibrationPattern,
//           enableLights: true,
//           color: const Color.fromARGB(255, 255, 0, 0),
//           ledColor: const Color.fromARGB(255, 255, 0, 0),
//           ledOnMs: 1000,
//           ledOffMs: 500);
//
//   final NotificationDetails platformChannelSpecifics =
//       NotificationDetails(android: androidPlatformChannelSpecifics);
//   await flutterLocalNotificationsPlugin.show(
//       0,
//       'title of notification with custom vibration pattern, LED and icon',
//       'body of notification with custom vibration pattern, LED and icon',
//       platformChannelSpecifics);
// }
//
//
// Future<void> _scheduleWeeklyTenAMNotification() async {
//   await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'weekly scheduled notification title',
//       'weekly scheduled notification body',
//       _nextInstanceOfTenAM(),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//             'weekly notification channel id',
//             'weekly notification channel name',
//             'weekly notificationdescription'),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
// }

// Future<void> _scheduleWeeklyMondayTenAMNotification() async {
//   await flutterLocalNotificationsPlugin.zonedSchedule(
//       0,
//       'weekly scheduled notification title',
//       'weekly scheduled notification body',
//       _nextInstanceOfMondayTenAM(),
//       const NotificationDetails(
//         android: AndroidNotificationDetails(
//             'weekly notification channel id',
//             'weekly notification channel name',
//             'weekly notificationdescription'),
//       ),
//       androidAllowWhileIdle: true,
//       uiLocalNotificationDateInterpretation:
//           UILocalNotificationDateInterpretation.absoluteTime,
//       matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime);
// }

  tz.TZDateTime _nextInstanceOfTenAM() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime(tz.local, now.year, now.month, now.day, 10);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

// Future<void> _createNotificationChannel() async {
//   const AndroidNotificationChannel androidNotificationChannel =
//       AndroidNotificationChannel(
//     'your channel id 2',
//     'your channel name 2',
//     'your channel description 2',
//   );
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(androidNotificationChannel);
//
//   await showDialog<void>(
//       context: context,
//       builder: (BuildContext context) => AlertDialog(
//             content:
//                 Text('Channel with name ${androidNotificationChannel.name} '
//                     'created'),
//             actions: <Widget>[
//               FlatButton(
//                 onPressed: () {
//                   Navigator.of(context).pop();
//                 },
//                 child: const Text('OK'),
//               ),
//             ],
//           ));
// }

}
