import 'dart:convert';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:motivational/src/core/theme/app_colors.dart';

/// For managing local notifications

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'event_updates', // id
  'Event Updates', // title
  description: 'This channel is used for sending updates about events.', // description
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
Map<String, dynamic> remotePayload = {};
const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings(
  '@mipmap/ic_launcher',
);
const DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings(
  onDidReceiveLocalNotification: onDidReceiveLocalNotification,
);
const InitializationSettings initializationSettings = InitializationSettings(
  android: initializationSettingsAndroid,
  iOS: initializationSettingsDarwin,
);

Future<void> onDidReceiveLocalNotification(
  int id,
  String? title,
  String? body,
  String? payload,
) async {}

void onDidReceiveLocalNotificationForeground(
  NotificationResponse details,
) {}

void onDidReceiveLocalNotificationBackground(
  NotificationResponse details,
) {}

Future<void> onRemoteMessage(RemoteMessage message) async {
  final notification = message.notification;
  final ios = message.notification!.apple;
  final payload = message.data;
  http.Response response;
  StyleInformation? bigPictureStyleInformation;
  if (message.notification!.android!.imageUrl != null) {
    response = await http.get(Uri.parse(message.notification!.android!.imageUrl ?? ''));
    bigPictureStyleInformation = BigPictureStyleInformation(
      ByteArrayAndroidBitmap.fromBase64String(
        base64Encode(response.bodyBytes),
      ),
    );
  }

  if (notification == null) {
    return;
  }
  if (ios != null) {
    /// Not necessary since FirebaseeMessaging automatically handles showing notifications
    /// in foreground
  }
  await flutterLocalNotificationsPlugin.show(
    notification.hashCode,
    notification.title,
    notification.body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        channel.id,
        channel.name,
        channelDescription: channel.description,
        color: AppColors.primary,
        styleInformation: bigPictureStyleInformation,
        priority: Priority.high,
      ),
    ),
  );
  remotePayload = payload;
}

Future<void> requestPermissions() async {
  if (Platform.isIOS) {
    await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  } else {
    if ((await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
            ?.requestNotificationsPermission()) ??
        false) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.createNotificationChannel(channel);
    }
  }
}

Future<void> initFirebaseMessaging() async {
  try {
    await requestPermissions();
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    await FirebaseMessaging.instance.subscribeToTopic('all');

    FirebaseMessaging.onMessage.listen(onRemoteMessage);
  } catch (_) {}
}

Future<String?> getFCMToken() async {
  try {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      debugPrint('FCM Token: $token');
      return token;
    } else {
      debugPrint('Failed to retrieve FCM Token');
      return null;
    }
  } catch (e) {
    debugPrint('Error getting FCM token: $e');
    return null;
  }
}
