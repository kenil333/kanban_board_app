import 'package:get/get.dart';

import '../../../data/models/board_model.dart';
import '../../../data/models/task_model.dart';
import '../../../domain/repositories/board_repository.dart';
import '../../modules/board/screens/board_view_screen.dart';
import '../../modules/home/screens/create_board_screen.dart';
import '../../modules/settings/settings_screen.dart';

class HomeController extends GetxController {
  final BoardRepository boardRepo = BoardRepository();
  final RxList<BoardModel> boards = <BoardModel>[].obs;
  final RxBool fetchingProjects = true.obs;

  Future<void> getAllBoards() async {
    boards.value = await boardRepo.getBoards();
    fetchingProjects.value = false;
  }

  void onNavigateCreateBoard() {
    Get.toNamed(CreateBoardScreen.id);
  }

  void onNavigateBoardView(BoardModel board) {
    Get.toNamed(BoardViewScreen.id, arguments: board);
  }

  Future<BoardModel?> updateBoardData(
      int boardid, List<TaskModel> taskList) async {
    await boardRepo.updateBoard(boardid, taskList);
    await getAllBoards();
    final int index = boards.indexWhere((e) => e.id == boardid);
    if (index != -1) {
      return boards[index];
    } else {
      return null;
    }
  }

  void onSettingsPressed() {
    Get.toNamed(SettingsScreen.id);
  }

  @override
  void onInit() {
    getAllBoards();
    super.onInit();
  }

  @override
  void onClose() {
    boards.close();
    fetchingProjects.close();
    super.onClose();
  }
}
