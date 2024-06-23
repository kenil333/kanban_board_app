import 'package:get/get.dart';

import '../presentation/controllers/board/board_binding.dart';
import '../presentation/controllers/create_board/create_board_binding.dart';
import '../presentation/controllers/create_edit_task/create_edit_task_binding.dart';
import '../presentation/controllers/home/home_binding.dart';
import '../presentation/controllers/onboarding/onboarding_binding.dart';
import '../presentation/controllers/task_detail/task_detail_binding.dart';
import '../presentation/modules/board/screens/board_view_screen.dart';
import '../presentation/modules/board/screens/create_edit_task_screen.dart';
import '../presentation/modules/board/screens/task_detail_screen.dart';
import '../presentation/modules/home/screens/create_board_screen.dart';
import '../presentation/modules/home/screens/home_screen.dart';
import '../presentation/modules/onboarding/screens/onboarding_screen.dart';
import '../presentation/modules/settings/settings_screen.dart';
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
      GetPage(
        name: CreateBoardScreen.id,
        page: () => const CreateBoardScreen(),
        binding: CreateBoardBinding(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: BoardViewScreen.id,
        page: () => const BoardViewScreen(),
        binding: BoardBinding(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: CreateEditTaskScreen.id,
        page: () => const CreateEditTaskScreen(),
        binding: CreateEditTaskBinding(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: TaskDetailScreen.id,
        page: () => const TaskDetailScreen(),
        binding: TaskDetailBinding(),
        transition: Transition.rightToLeft,
      ),
      GetPage(
        name: SettingsScreen.id,
        page: () => const SettingsScreen(),
        transition: Transition.rightToLeft,
      ),
    ];
  }
}
