import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';

import '../../../data/models/comment_model.dart';
import '../../../data/models/task_model.dart';
import '../../../domain/repositories/comment_repository.dart';
import '../../../domain/repositories/task_repository.dart';
import '../../../utils/app_method.dart';
import '../../modules/board/screens/create_edit_task_screen.dart';
import '../../widgets/common_dialog.dart';
import '../board/board_controller.dart';

class TaskDetailController extends GetxController {
  final BoardController boardController = Get.find();
  final CommentRepository commentRepo = CommentRepository();
  final TaskRepository taskRepo = TaskRepository();
  TaskModel task = Get.arguments as TaskModel;
  final ScrollController screenScroll = ScrollController();
  final TextEditingController commentTc = TextEditingController();
  final RxBool allowComment = false.obs;
  final RxList<CommentModel> comments = <CommentModel>[].obs;

  void checkCommentAllow() {
    if (commentTc.text.trim().length > 1) {
      allowComment.value = true;
    } else {
      allowComment.value = false;
    }
  }

  Future<void> getComments() async {
    comments.value = await commentRepo.getComments(task.id);
  }

  void onAddComment() async {
    if (allowComment.value) {
      final bool added = await commentRepo.addComment(
        commentTc.text.trim(),
        task.id,
      );
      if (added) {
        await getComments();
        screenScroll.jumpTo(screenScroll.position.maxScrollExtent);
        commentTc.clear();
      } else {
        AppMethod.openDialog(
          Get.context!,
          CommonDialog(
            description: Get.context!.l10n.somethingWrong,
          ),
        );
      }
    }
  }

  void onTaskEdit() {
    Get.toNamed(CreateEditTaskScreen.id, arguments: task);
  }

  void onTimeLog(int hh, int mm) async {
    final String timeLog =
        "${hh.toString().length == 1 ? "0$hh" : hh.toString()}:${mm.toString().length == 1 ? "0$mm" : mm.toString()}";
    if (timeLog != task.timelog && timeLog != "00:00") {
      final bool added = await taskRepo.updateTimeLog(task.id, timeLog);
      if (added) {
        task.timelog = timeLog;
        boardController.fetchTasks();
        allowComment.refresh();
      } else {
        AppMethod.openDialog(
          Get.context!,
          CommonDialog(
            description: Get.context!.l10n.somethingWrong,
          ),
        );
      }
    }
  }

  @override
  void onClose() {
    screenScroll.dispose();
    commentTc.dispose();
    allowComment.close();
    comments.close();
    super.onClose();
  }
}
