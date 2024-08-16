import 'package:dep_task_two/services/api_helper.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin
      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> onNotificationReceieved(
      NotificationResponse notificationResponse) async {}

  static Future<void> init() async {
    //Andriod initilization
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("ic_launcher");

    //Initialization
    const InitializationSettings initializationSettings =
        InitializationSettings(android: androidInitializationSettings);

    //Plugin Initialize
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onNotificationReceieved,
        onDidReceiveBackgroundNotificationResponse: onNotificationReceieved);

    await _flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

// Show Notification
  static Future<void> showNotification() async {
    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
      "channelId",
      "channelName",
      icon: 'ic_launcher',
      priority: Priority.high,
      importance: Importance.high,
    ));
    String temp = await getTemp();

    await _flutterLocalNotificationsPlugin.show(
        0, "Weather Alert", temp, notificationDetails);
  }

  // Periodic Notification
  static Future<void> periodicNotification() async {
    const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
      "channelId",
      "channelName",
      icon: 'ic_launcher',
      priority: Priority.high,
      importance: Importance.high,
    ));
    String temp = await getTemp();

    await _flutterLocalNotificationsPlugin.periodicallyShow(0, "Weather Alert",
        temp, RepeatInterval.everyMinute, notificationDetails);
  }

  // get Temprature from Api
  static Future<String> getTemp() async {
    double val = await ApiHelper.getTemprature();
    return val.toString();
  }
}
