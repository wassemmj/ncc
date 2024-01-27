import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotifyServices {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future initNotify() async {
    AndroidInitializationSettings androidInitializationSettings =
        const AndroidInitializationSettings('logo');
    var initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: (id, title, body, payload) async {},
    );

    var initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: initializationSettingsIOS,
    );
    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) async {},
    );
  }

  notificationDetails() {
    return const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName',importance: Importance.max),
      iOS: DarwinNotificationDetails(),
    );
  }

  Future showNotification({int id = 0,String? title,String? body,String? payload}) async {
    await initNotify();
    return flutterLocalNotificationsPlugin.show(id, title, body, await notificationDetails());
  }
}
