import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  // Initialize Notifications
  Future<void> initNotifications() async {
    // Request permission for push notifications
    NotificationSettings settings = await _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("✅ Push Notifications Authorized");
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        _showNotification(message);
      });
    } else {
      print("❌ Push Notifications Not Authorized");
    }

    // Initialize Local Notifications
    const AndroidInitializationSettings androidInitSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    final InitializationSettings initSettings =
    InitializationSettings(android: androidInitSettings);

    await _flutterLocalNotificationsPlugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (NotificationResponse response) {
        print("📩 Notification Clicked: ${response.payload}");
      },
    );

    // Subscribe to topic (Optional: for sending notifications to all users)
    await _firebaseMessaging.subscribeToTopic("all_users");
  }

  // Show notification
  Future<void> _showNotification(RemoteMessage message) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id', 'channel_name',
      importance: Importance.high,
      priority: Priority.high,
      playSound: true,
    );

    const NotificationDetails platformDetails =
    NotificationDetails(android: androidDetails);

    await _flutterLocalNotificationsPlugin.show(
      0,
      message.notification?.title ?? 'New Notification',
      message.notification?.body ?? '',
      platformDetails,
    );
  }

  // Get FCM Token (For Debugging)
  Future<void> printFCMToken() async {
    String? token = await _firebaseMessaging.getToken();
    print("📲 FCM Token: $token");
  }
}
