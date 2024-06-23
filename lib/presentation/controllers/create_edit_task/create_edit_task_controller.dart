import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';

import '../../../data/models/task_model.dart';
import '../../../domain/repositories/task_repository.dart';
import '../../../utils/app_method.dart';
import '../../modules/board/screens/board_view_screen.dart';
import '../../widgets/common_dialog.dart';
import '../board/board_controller.dart';

class CreateEditTaskController extends GetxController {
  final TaskModel? task = Get.arguments as TaskModel?;
  final BoardController boardController = Get.find();
  final TaskRepository taskRepo = TaskRepository();
  final TextEditingController titleTc = TextEditingController();
  final TextEditingController descriptionTc = TextEditingController();
  final RxBool allowToCreate = false.obs;

  void checkAllowToCreate() {
    if (titleTc.text.trim().length > 2 &&
        descriptionTc.text.trim().length > 2) {
      allowToCreate.value = true;
    } else {
      allowToCreate.value = false;
    }
    allowToCreate.refresh();
  }

  void onCreateTask() async {
    if (allowToCreate.value) {
      if (task == null) {
        final bool added = await taskRepo.creteTask(
          titleTc.text.trim(),
          descriptionTc.text.trim(),
          boardController.board.id,
        );
        if (added) {
          await boardController.fetchTasks();
          Get.back();
        } else {
          AppMethod.openDialog(
            Get.context!,
            CommonDialog(
              description: Get.context!.l10n.somethingWrong,
            ),
          );
        }
      } else {
        final bool added = await taskRepo.updateTaskDetails(
          task!.id,
          titleTc.text.trim(),
          descriptionTc.text.trim(),
        );
        if (added) {
          await boardController.fetchTasks();
          Get.until((route) => route.settings.name == BoardViewScreen.id);
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
  }

  @override
  void onInit() {
    if (task != null) {
      titleTc.text = task!.title;
      descriptionTc.text = task!.description;
    }
    super.onInit();
  }

  @override
  void onClose() {
    titleTc.dispose();
    descriptionTc.dispose();
    allowToCreate.close();
    super.onClose();
  }
}
