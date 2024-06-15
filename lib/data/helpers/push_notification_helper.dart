import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../firebase_options.dart';
import '../../utils/app_data.dart';
import 'local_notification_helper.dart';

Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message,
) async {
  await Firebase.initializeApp();
  debugPrint('=====>    A bg message just showed up :  ${message.data}');
}

class PushNotificationHelper {
  // static void addCrashlytics() {
  //   try {
  //     FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  //     FlutterError.onError =
  //         FirebaseCrashlytics.instance.recordFlutterFatalError;
  //     PlatformDispatcher.instance.onError = (error, stack) {
  //       FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
  //       return true;
  //     };
  //   } catch (e) {
  //     debugPrint("=======>  Crash Catch Error $e");
  //   }
  // }

  static Future<void> initialise() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint("=======>  Message recived  =====   ${message.data}");
      if (message.notification != null) {
        debugPrint(
            "=======>  NOTIFICATION:\nTITLE: ${message.notification!.title}\nBODY: ${message.notification!.body}");
        LocalNotificationHelper.showNotification(
          message.hashCode,
          message.notification!.title ?? "Title",
          message.notification!.body ?? "Message",
          payload: jsonEncode(message.data),
        );
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("=======>  Message recived  =====   ${message.data}");
      if (message.notification != null) {
        debugPrint(
            "=======>  NOTIFICATION:\nTITLE: ${message.notification!.title}\nBODY: ${message.notification!.body}");
      }
    });

    FirebaseMessaging.instance.onTokenRefresh.listen((String newToken) {
      debugPrint("=====>  Token Refresh Log ===>   $newToken");
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      debugPrint("=====>  Remote Message Log ===>   ${message.data}");
    });

    await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    await LocalNotificationHelper.initnotification();

    try {
      AppData.deviceToken = await FirebaseMessaging.instance.getToken() ?? "";
      debugPrint("======>  FCM Token  =====   ${AppData.deviceToken}");
    } catch (e) {
      debugPrint("========>  ERROR PUSH NOTIFICATION   :::   $e");
    }

    // addCrashlytics();
  }
}
