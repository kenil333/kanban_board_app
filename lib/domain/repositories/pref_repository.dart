import 'package:flutter/material.dart';

import '../../data/helpers/pref_helper.dart';
import '../configs/pref_config.dart';

class PrefRepository {
  Future<bool> getOnBoardingCompleted() async {
    try {
      return await PrefHelper.getBool(PrefConfig.onBoardingCompleted);
    } catch (e) {
      debugPrint("=======>   PREF REPO CATCH ERROR:=> $e");
      return false;
    }
  }

  Future<bool> setOnBoardingCompleted(bool value) async {
    try {
      return await PrefHelper.setBool(PrefConfig.onBoardingCompleted, value);
    } catch (e) {
      debugPrint("=======>   PREF REPO CATCH ERROR:=> $e");
      return false;
    }
  }
}
