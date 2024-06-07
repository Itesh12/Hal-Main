import 'dart:async';
import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;

class LocalNotificationService {
  static StreamController<Map<String, dynamic>> streamController =
      StreamController<Map<String, dynamic>>.broadcast();

  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    // initializationSettings  for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/icon"),
    );

    _notificationsPlugin.initialize(initializationSettings,
        onDidReceiveNotificationResponse: onSelectNotification
        // (details) async {
        //   debugPrint("onSelectNotification");
        //   if (details.id.toString().isNotEmpty) {
        //     debugPrint("Router Value1234 $details");

        //     // Navigator.of(context).push(
        //     //   MaterialPageRoute(
        //     //     builder: (context) => DemoScreen(
        //     //       id: id,
        //     //     ),
        //     //   ),
        //     // );

        //   }
        // },
        );
  }

  static Future<void> createanddisplaynotification(
      RemoteMessage message) async {
    final response = await http.get(Uri.parse(
        message.notification!.android!.imageUrl ?? message.data['image']));
    final Uint8List imageData = response.bodyBytes;
    final String base64Image = base64Encode(imageData);

    final BigPictureStyleInformation bigPictureStyleInformation =
        BigPictureStyleInformation(
            ByteArrayAndroidBitmap.fromBase64String(base64Image));
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails("kisaanstation", "kisaanstation",
            importance: Importance.max,
            priority: Priority.high,
            sound: const RawResourceAndroidNotificationSound("rahul"),
            styleInformation: bigPictureStyleInformation),
      );

      await _notificationsPlugin.show(id, message.notification!.title,
          message.notification!.body, notificationDetails,
          payload: json.encode(message.data));
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> createanddisplaynotificationwithoutimage(
      RemoteMessage message) async {
    final String longdata = message.notification!.body ?? "";

    final BigTextStyleInformation bigTextStyleInformation =
        BigTextStyleInformation(longdata);
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails("kisaanstation", "kisaanStation",
              importance: Importance.max,
              priority: Priority.high,
              sound: const RawResourceAndroidNotificationSound("rahul"),
              styleInformation: bigTextStyleInformation));

      await _notificationsPlugin.show(id, message.notification!.title,
          message.notification!.body, notificationDetails,
          payload: json.encode(message.data));
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<void> onSelectNotification(
      NotificationResponse response) async {
    debugPrint(response.payload);
    final Map<String, dynamic> decodedMap =
        await json.decode(response.payload ?? "0");
    streamController.add(decodedMap);

    debugPrint(streamController.toString());
// navigate to booking screen if the payload equal BOOKING
  }
}
  

//   static Future<void> createanddisplaynotification(
//       RemoteMessage message) async {
//     try {
//       final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;
//       const AndroidNotification notificationDetails = AndroidNotification(
//         channelId: "kisaanstation",
//         priority: AndroidNotificationPriority.highPriority,
//         sound: "true",
//         // imageUrl:
//         //     "https://www.shutterstock.com/image-vector/landscape-frame-icon-web-app-1896242365"
//       );

//       await _notificationsPlugin.show(
//         id,
//         message.notification!.title,
//         message.notification!.body,
//         notificationDetails.imageUrl ?? message.data['imageUrl'],
//         payload: message.data['_id'],
//       );
//     } on Exception catch (e) {
//       debugPrint(e.toString());
//     }
//   }

