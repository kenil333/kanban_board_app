import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_style.dart';
import '../../../controllers/create_board/create_board_controller.dart';
import '../../../widgets/app_input_view.dart';
import '../../../widgets/general_appbar.dart';

class CreateBoardScreen extends GetView<CreateBoardController> {
  static const String id = "/CreateBoardScreen";
  const CreateBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: GeneralAppBar(title: context.l10n.createBoard),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSize.size24),
          child: Obx(
            () => Column(
              children: [
                const SizedBox(height: 24),
                AppInputView(
                  controller: controller.nameTc,
                  title: context.l10n.boardName,
                  maxLength: 20,
                  suffix: Padding(
                    padding: EdgeInsets.only(left: AppSize.size8),
                    child: Text(
                      controller.allowToCreate.value
                          ? "${20 - controller.nameTc.text.trim().length}"
                          : "${20 - controller.nameTc.text.trim().length}",
                      style: AppStyle.font14500,
                    ),
                  ),
                  onChanged: (String value) {
                    controller.checkAllowToCreate();
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\n')),
                  ],
                ),
                const SizedBox(height: 24),
                AppInputView(
                  controller: controller.descriptionTc,
                  title: context.l10n.description,
                  maxLength: 90,
                  suffix: Padding(
                    padding: EdgeInsets.only(left: AppSize.size8),
                    child: Text(
                      controller.allowToCreate.value
                          ? "${90 - controller.descriptionTc.text.trim().length}"
                          : "${90 - controller.descriptionTc.text.trim().length}",
                      style: AppStyle.font14500,
                    ),
                  ),
                  onChanged: (String value) {
                    controller.checkAllowToCreate();
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'\n')),
                  ],
                  maxLines: 6,
                  minLines: 1,
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: Obx(
          () => FloatingActionButton.extended(
            backgroundColor: controller.allowToCreate.value
                ? null
                : AppColor.textPrimary.withOpacity(0.1),
            foregroundColor: controller.allowToCreate.value
                ? null
                : AppColor.textPrimary.withOpacity(0.5),
            elevation: controller.allowToCreate.value ? null : 0,
            onPressed: () {
              FocusScope.of(context).unfocus();
              controller.onCreateBoard();
            },
            label: Text(context.l10n.create),
            icon: const Icon(Icons.add_rounded),
          ),
        ),
      ),
    );
  }
}
