import 'package:get/get.dart';

import '../../../domain/repositories/pref_repository.dart';
import '../../modules/home/screens/home_screen.dart';
import '../../modules/onboarding/screens/onboarding_screen.dart';

class SplashController extends GetxController {
  final PrefRepository prefRepo = PrefRepository();

  void initializeResources() {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      final bool onBoardingCompleted = await prefRepo.getOnBoardingCompleted();
      if (onBoardingCompleted) {
        Get.offAllNamed(HomeScreen.id);
      } else {
        Get.offAllNamed(OnBoardingScreen.id);
      }
    });
  }
}
