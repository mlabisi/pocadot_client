import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:pocadot_client/app.dart';
import 'package:rxdart/subjects.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final localNotifications = FlutterLocalNotificationsPlugin();

final notificationSubject = BehaviorSubject<NotificationResponse>();

void main() async {
  // load env variables?
  await dotenv.load();

  // get App Launch Details
  final NotificationAppLaunchDetails? launchDetails =
      await localNotifications.getNotificationAppLaunchDetails();

  // set initial route if the app was opened via notification
  String? initialRoute;
  if(launchDetails!.didNotificationLaunchApp) {
    initialRoute = 'route from notification';
  }

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
  runApp(App(
      initialRoute: initialRoute,
      notificationSubject: notificationSubject,
      eventId: launchDetails.notificationResponse?.payload));
}
