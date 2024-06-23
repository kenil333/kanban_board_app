import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/repositories/pref_repository.dart';
import '../../../utils/enums/onboarding_page.dart';
import '../../modules/home/screens/home_screen.dart';

class OnboardingController extends GetxController {
  final PrefRepository prefRepo = PrefRepository();
  final List<OnboardingPage> pages = OnboardingPage.values;
  final PageController pageController = PageController();
  final RxInt currentPage = 0.obs;

  void onChangeCurrentPage(int pageIndex) {
    currentPage.value = pageIndex;
  }

  void animateToPage(int index) {
    if (index > 2) {
      navigateToHome();
    } else {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 200),
        curve: Curves.linearToEaseOut,
      );
    }
  }

  void navigateToHome() async {
    await prefRepo.setOnBoardingCompleted(true);
    Get.offAllNamed(HomeScreen.id);
  }

  @override
  void onClose() {
    pageController.dispose();
    currentPage.close();
    super.onClose();
  }
}
