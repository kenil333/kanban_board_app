import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';

import '../../../data/models/board_model.dart';
import '../../../data/models/task_model.dart';
import '../../../domain/repositories/task_repository.dart';
import '../../../utils/app_method.dart';
import '../../../utils/app_text.dart';
import '../../modules/board/screens/create_edit_task_screen.dart';
import '../../modules/board/screens/task_detail_screen.dart';
import '../../widgets/common_dialog.dart';
import '../home/home_controller.dart';

class BoardController extends GetxController {
  final HomeController homeController = Get.find();
  final TaskRepository taskRepo = TaskRepository();
  BoardModel board = Get.arguments as BoardModel;
  final RxList<TaskModel> taskList = <TaskModel>[].obs;
  late AppFlowyBoardController appFlowyBoardController;

  void initilizeTheBoardData() {
    appFlowyBoardController.clear();
    for (int i = 0; i < board.columns.length; i++) {
      List<TaskModel> childrens = [];
      for (int ti = 0; ti < taskList.length; ti++) {
        if (taskList[ti].column == board.columns[i].name) {
          childrens.add(taskList[ti]);
        }
      }
      appFlowyBoardController.addGroup(
        AppFlowyGroupData(
          id: board.columns[i].name,
          name: board.columns[i].name,
          customData: childrens,
          items: List<AppFlowyGroupItem>.from(
              childrens.map((e) => TextItem(e.id.toString())).toList()),
        ),
      );
    }
  }

  void onPressedNew() {
    Get.toNamed(CreateEditTaskScreen.id);
  }

  Future<void> fetchTasks() async {
    taskList.value = await taskRepo.getTasks(board.id);
    if (taskList.isNotEmpty) {
      final BoardModel? updatedBoard =
          await homeController.updateBoardData(board.id, taskList);
      if (updatedBoard != null) {
        board = updatedBoard;
      }
    }
    initilizeTheBoardData();
  }

  void onMoveGroup(
    String fromGroupId,
    int fromIndex,
    String toGroupId,
    int toIndex,
  ) {
    debugPrint(
        "=======>  onMoveGroup:\nFrom-Groupe: $fromGroupId --- To-Groupe: $toGroupId\nFrom-Index: $fromIndex --- To-Index: $toIndex");
    initilizeTheBoardData();
    AppMethod.openDialog(
      Get.context!,
      CommonDialog(
        description: Get.context!.l10n.columnPositionChangesNote,
      ),
    );
  }

  void onMoveGroupItem(String groupId, int fromIndex, int toIndex) {
    debugPrint(
        "=======>  onMoveGroupItem:\nGroupeId: $groupId\nFrom-Index: $fromIndex --- To-Index: $toIndex");
  }

  void onMoveGroupItemToGroup(
    String fromGroupId,
    int fromIndex,
    String toGroupId,
    int toIndex,
  ) async {
    debugPrint(
        "=======>  onMoveGroupItemToGroup:\nFrom-Groupe: $fromGroupId --- To-Groupe: $toGroupId\nFrom-Index: $fromIndex --- To-Index: $toIndex");
    final AppFlowyGroupController? columnController =
        appFlowyBoardController.getGroupController(toGroupId);
    if (columnController != null && columnController.items.isNotEmpty) {
      try {
        final int index = taskList.indexWhere(
            (e) => e.id.toString() == columnController.items[toIndex].id);
        if (index != -1) {
          if (toGroupId == AppText.done && taskList[index].timelog.isEmpty) {
            initilizeTheBoardData();
            AppMethod.openDialog(
              Get.context!,
              CommonDialog(
                description: Get.context!.l10n.restrictionNoteForDone,
              ),
            );
          } else {
            final bool updated =
                await taskRepo.updateTaskColumn(taskList[index].id, toGroupId);
            if (updated) {
              fetchTasks();
            } else {
              initilizeTheBoardData();
              AppMethod.openDialog(
                Get.context!,
                CommonDialog(
                  description: Get.context!.l10n.somethingWrong,
                ),
              );
            }
          }
        }
      } catch (e) {
        debugPrint("=======>   MOVING ITEM IN GROUPE CATCH ERROR:=> $e");
        initilizeTheBoardData();
        AppMethod.openDialog(
          Get.context!,
          CommonDialog(
            description: Get.context!.l10n.somethingWrong,
          ),
        );
      }
    }
  }

  void registerBoardController() {
    appFlowyBoardController = AppFlowyBoardController(
      onMoveGroup: onMoveGroup,
      onMoveGroupItem: onMoveGroupItem,
      onMoveGroupItemToGroup: onMoveGroupItemToGroup,
    );
  }

  void onTaskPressed(TaskModel task) {
    Get.toNamed(TaskDetailScreen.id, arguments: task);
  }

  @override
  void onInit() {
    registerBoardController();
    fetchTasks();
    super.onInit();
  }

  @override
  void onClose() {
    appFlowyBoardController.dispose();
    taskList.close();
    super.onClose();
  }
}

class TextItem extends AppFlowyGroupItem {
  final String s;

  TextItem(this.s);

  @override
  String get id => s;
}
