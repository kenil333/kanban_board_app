import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_style.dart';
import '../../../controllers/create_edit_task/create_edit_task_controller.dart';
import '../../../widgets/app_input_view.dart';
import '../../../widgets/general_appbar.dart';

class CreateEditTaskScreen extends GetView<CreateEditTaskController> {
  static const String id = "/CreateEditTaskScreen";
  const CreateEditTaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: GeneralAppBar(
          title: controller.task != null
              ? context.l10n.editTask
              : context.l10n.createNewTask,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: AppSize.size24),
          child: Obx(
            () => Column(
              children: [
                const SizedBox(height: 24),
                AppInputView(
                  controller: controller.titleTc,
                  title: context.l10n.title,
                  maxLength: 60,
                  suffix: Padding(
                    padding: EdgeInsets.only(left: AppSize.size8),
                    child: Text(
                      controller.allowToCreate.value
                          ? "${60 - controller.titleTc.text.trim().length}"
                          : "${60 - controller.titleTc.text.trim().length}",
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
                  maxLength: 500,
                  suffix: Padding(
                    padding: EdgeInsets.only(left: AppSize.size8),
                    child: Text(
                      controller.allowToCreate.value
                          ? "${500 - controller.descriptionTc.text.trim().length}"
                          : "${500 - controller.descriptionTc.text.trim().length}",
                      style: AppStyle.font14500,
                    ),
                  ),
                  onChanged: (String value) {
                    controller.checkAllowToCreate();
                  },
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
              controller.onCreateTask();
            },
            label: Text(
              controller.task != null ? context.l10n.edit : context.l10n.create,
            ),
            icon: Icon(
              controller.task != null ? Icons.edit_rounded : Icons.add_rounded,
            ),
          ),
        ),
      ),
    );
  }
}
