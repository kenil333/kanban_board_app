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

  Future<String?> getAppLocal() async {
    try {
      return await PrefHelper.getString(PrefConfig.appLocal);
    } catch (e) {
      debugPrint("=======>   PREF REPO CATCH ERROR:=> $e");
      return null;
    }
  }

  Future<bool> setApplocal(String value) async {
    try {
      return await PrefHelper.setString(PrefConfig.appLocal, value);
    } catch (e) {
      debugPrint("=======>   PREF REPO CATCH ERROR:=> $e");
      return false;
    }
  }

  Future<int?> getAppTheme() async {
    try {
      return await PrefHelper.getInt(PrefConfig.appTheme);
    } catch (e) {
      debugPrint("=======>   PREF REPO CATCH ERROR:=> $e");
      return null;
    }
  }

  Future<bool> setAppTheme(int value) async {
    try {
      return await PrefHelper.setInt(PrefConfig.appLocal, value);
    } catch (e) {
      debugPrint("=======>   PREF REPO CATCH ERROR:=> $e");
      return false;
    }
  }
}
