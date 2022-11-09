import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pocadot_client/app.dart';
import 'package:rxdart/subjects.dart';

final localNotifications = FlutterLocalNotificationsPlugin();

final notificationSubject = BehaviorSubject<NotificationResponse>();

void main() async {
  // load env variables?
  // pub dotenv

  // get App Launch Details
  final NotificationAppLaunchDetails? launchDetails =
      await localNotifications.getNotificationAppLaunchDetails();

  // set initial route based on cold start or not
  String initialRoute = launchDetails?.didNotificationLaunchApp ?? false
      ? 'alert route'
      : 'login route';

  // initialize platform-specific notification settings
  const AndroidInitializationSettings androidSettings =
      AndroidInitializationSettings("app_icon");
  const DarwinInitializationSettings iosSettings = DarwinInitializationSettings(
    requestAlertPermission: false,
    requestBadgePermission: false,
    requestSoundPermission: false,
  );
  const InitializationSettings initializationSettings = InitializationSettings(
    android: androidSettings,
    iOS: iosSettings,
  );
  await localNotifications.initialize(
    initializationSettings,
    // case when app is opened by notification
    onDidReceiveNotificationResponse: (response) async {
      initialRoute = 'login route';
      notificationSubject.add(response);
    },
  );
  await localNotifications.cancelAll();

  // Using HiveStore for persistence
  await initHiveForFlutter();

  // Login with existing token or show logged-out view
  runApp(const App(
      initialRoute: initialRoute,
      notificationSubject: notificationSubject,
      eventId: launchDetails?.payload));
}
