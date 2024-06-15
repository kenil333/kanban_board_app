import 'package:get/get.dart';

import '../presentation/modules/splash/screens/splash_screen.dart';

class AppRouter {
  static List<GetPage<dynamic>> getRoutes() {
    return [
      GetPage(
        name: SplashScreen.id,
        page: () => const SplashScreen(),
        transition: Transition.fade,
      ),
    ];
  }
}
