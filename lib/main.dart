import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kisaan_station/notificationservices/local_notifications_service.dart';
import 'package:kisaan_station/src/model/social/post/post_model.dart';
import 'package:kisaan_station/src/model/user/media_model.dart';
import 'package:kisaan_station/src/util/services/shared_preferences.dart';

import 'src/app/app.dart';
import 'src/infrastructure/http/http_override.dart';
import 'src/util/platform_type.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint(message.data.toString());
  debugPrint(message.notification!.title);
}

// ignore: avoid_void_async
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(PostAdapter());
  Hive.registerAdapter(MediaAdapter());
  await Hive.openBox<Post>('postsBox');

  GestureBinding.instance.resamplingEnabled = true;

  await UserPreferences.init();
  HttpOverrides.global = MyHttpOverrides();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  final platformType = detectPlatformType();  

  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();

  // FirebaseMessaging.instance
  //     .getToken()
  //     .then((value) => {debugPrint("fcm_token $value")});

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.top,
    SystemUiOverlay.bottom,
  ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    statusBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
  ));

  runApp(
    ProviderScope(
      overrides: [
        platformTypeProvider.overrideWithValue(platformType),
      ],
      child: App(),
    ),
  );
}
