import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';

import '../../../domain/repositories/board_repository.dart';
import '../../../utils/app_method.dart';
import '../../widgets/common_dialog.dart';
import '../home/home_controller.dart';

class CreateBoardController extends GetxController {
  final BoardRepository boardRepo = BoardRepository();
  final HomeController homeController = Get.find();
  final TextEditingController nameTc = TextEditingController();
  final TextEditingController descriptionTc = TextEditingController();
  final RxBool allowToCreate = false.obs;

  void checkAllowToCreate() {
    if (nameTc.text.trim().length > 2 && descriptionTc.text.trim().length > 2) {
      allowToCreate.value = true;
    } else {
      allowToCreate.value = false;
    }
    allowToCreate.refresh();
  }

  void onCreateBoard() async {
    if (allowToCreate.value) {
      final bool added = await boardRepo.creteBoard(
        nameTc.text.trim(),
        descriptionTc.text.trim(),
      );
      if (added) {
        await homeController.getAllBoards();
        Get.back();
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
    nameTc.dispose();
    descriptionTc.dispose();
    allowToCreate.close();
    super.onClose();
  }
}
