import 'package:get/get.dart';

import '../presentation/controllers/home/home_binding.dart';
import '../presentation/controllers/onboarding/onboarding_binding.dart';
import '../presentation/modules/home/screens/home_screen.dart';
import '../presentation/modules/onboarding/screens/onboarding_screen.dart';
import '../presentation/modules/splash/screens/splash_screen.dart';

class AppRouter {
  static List<GetPage<dynamic>> getRoutes() {
    return [
      GetPage(
        name: SplashScreen.id,
        page: () => const SplashScreen(),
        transition: Transition.fade,
      ),
      GetPage(
        name: OnBoardingScreen.id,
        page: () => const OnBoardingScreen(),
        binding: OnboardingBinding(),
        transition: Transition.fade,
      ),
      GetPage(
        name: HomeScreen.id,
        page: () => const HomeScreen(),
        binding: HomeBinding(),
        transition: Transition.fade,
      ),
    ];
  }
}
