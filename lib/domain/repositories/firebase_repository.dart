import 'package:flutter/material.dart';

import '../../data/helpers/push_notification_helper.dart';

class FirebaseRepository {
  Future<void> initializeAppAndNotification() async {
    try {
      await PushNotificationHelper.initialise();
    } catch (e) {
      debugPrint("=======>   FIREBASE REPOSITORY CATCH ERROR:\n$e");
    }
  }
}
