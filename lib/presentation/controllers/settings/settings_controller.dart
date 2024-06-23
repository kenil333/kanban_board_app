import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/repositories/pref_repository.dart';
import '../../../utils/app_color.dart';
import '../../modules/restart/restart_screen.dart';

class SettingsController extends GetxController {
  final PrefRepository prefRepo = PrefRepository();
  Rx<Locale> locale = const Locale('en').obs;

  void getCurrentLocal() async {
    locale.value = Locale((await prefRepo.getAppLocal()) ?? "en");
    AppColor.primary =
        Color((await prefRepo.getAppTheme()) ?? AppColor.pallet1);
  }

  void onLocalChange(String value) async {
    if (value != locale.value.languageCode) {
      await prefRepo.setApplocal(value);
      locale.value = Locale(value);
      RestartScreen.restartApp(Get.context!);
    }
  }

  void onChangeTheme(int pallet) async {
    if (AppColor.primary != Color(pallet)) {
      await prefRepo.setAppTheme(pallet);
      AppColor.primary = Color(pallet);
      RestartScreen.restartApp(Get.context!);
    }
  }

  @override
  void onInit() {
    getCurrentLocal();
    super.onInit();
  }
}
