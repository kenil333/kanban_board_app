import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';
import 'package:time_picker_spinner_pop_up/time_picker_spinner_pop_up.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/app_text.dart';
import '../../../controllers/task_detail/task_detail_controller.dart';
import '../../../widgets/general_appbar.dart';
import '../widgets/comment_stemp.dart';

class TaskDetailScreen extends GetView<TaskDetailController> {
  static const String id = "/TaskDetailScreen";
  const TaskDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: GeneralAppBar(title: context.l10n.task),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                controller: controller.screenScroll,
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.size16,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSize.size16,
                            vertical: 16,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: AppColor.primary.withOpacity(0.05),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(context.l10n.title,
                                  style: AppStyle.font12400),
                              const SizedBox(height: 2),
                              Text(
                                controller.task.title,
                                style: AppStyle.font16500,
                              ),
                              const SizedBox(height: 16),
                              Text(context.l10n.createdAt,
                                  style: AppStyle.font12400),
                              const SizedBox(height: 2),
                              Text(
                                DateFormat("hh:mm a, dd-MM-yyyy").format(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      controller.task.id),
                                ),
                                style: AppStyle.font16500,
                              ),
                              const SizedBox(height: 16),
                              Text(context.l10n.description,
                                  style: AppStyle.font12400),
                              const SizedBox(height: 2),
                              Text(
                                controller.task.description,
                                style: AppStyle.font14500,
                              ),
                              if (controller.task.column ==
                                      AppText.inProgress ||
                                  controller.task.timelog.isNotEmpty)
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 16),
                                    Text(context.l10n.timeLog,
                                        style: AppStyle.font12400),
                                    SizedBox(
                                      height: controller.task.column ==
                                              AppText.inProgress
                                          ? 4
                                          : 2,
                                    ),
                                    Obx(
                                      () => (controller.allowComment.value ||
                                              !controller.allowComment.value)
                                          ? Row(
                                              children: [
                                                if (controller
                                                    .task.timelog.isNotEmpty)
                                                  Row(
                                                    children: [
                                                      Text(
                                                        controller.task.timelog,
                                                        style: AppStyle
                                                            .font20700
                                                            .copyWith(
                                                          color:
                                                              AppColor.primary,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              AppSize.size16),
                                                    ],
                                                  ),
                                                if (controller.task.column ==
                                                    AppText.inProgress)
                                                  TimePickerSpinnerPopUp(
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .time,
                                                    initTime: DateTime(
                                                      DateTime.now().year,
                                                      DateTime.now().month,
                                                      DateTime.now().day,
                                                      controller.task.timelog
                                                              .isNotEmpty
                                                          ? int.parse(
                                                              "${controller.task.timelog[0]}${controller.task.timelog[1]}")
                                                          : 0,
                                                      controller.task.timelog
                                                              .isNotEmpty
                                                          ? int.parse(
                                                              "${controller.task.timelog[3]}${controller.task.timelog[4]}")
                                                          : 0,
                                                    ),
                                                    onChange: (dateTime) {
                                                      controller.onTimeLog(
                                                          dateTime.hour,
                                                          dateTime.minute);
                                                    },
                                                    timeWidgetBuilder:
                                                        (DateTime date) {
                                                      return Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                          horizontal:
                                                              AppSize.size12,
                                                          vertical: 8,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      100),
                                                          color:
                                                              AppColor.primary,
                                                        ),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Icon(
                                                              Icons
                                                                  .timer_outlined,
                                                              color: AppColor
                                                                  .white,
                                                              size: AppSize
                                                                  .size16,
                                                            ),
                                                            SizedBox(
                                                                width: AppSize
                                                                    .size8),
                                                            Text(
                                                              controller
                                                                      .task
                                                                      .timelog
                                                                      .isNotEmpty
                                                                  ? context.l10n
                                                                      .updateTime
                                                                  : context.l10n
                                                                      .addTime,
                                                              style: AppStyle
                                                                  .font12400
                                                                  .copyWith(
                                                                color: AppColor
                                                                    .white,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    },
                                                  ),
                                              ],
                                            )
                                          : Container(),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 8,
                          right: AppSize.size8,
                          child: GestureDetector(
                            onTap: () {
                              controller.onTaskEdit();
                            },
                            child: Container(
                              width: AppSize.size32,
                              height: AppSize.size32,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: AppColor.primary.withOpacity(0.6),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.edit_rounded,
                                  color: AppColor.white,
                                  size: AppSize.size20,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Obx(
                      () => controller.comments.isNotEmpty
                          ? ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: controller.comments.length,
                              itemBuilder: (context, i) => CommentStemp(
                                comment: controller.comments[i],
                              ),
                            )
                          : Container(),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 16,
                bottom: 16 + AppSize.bottomPadding,
                left: AppSize.size16,
                right: AppSize.size16,
              ),
              decoration: BoxDecoration(
                color: AppColor.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.textPrimary.withOpacity(0.1),
                    offset: const Offset(0, -4),
                    blurRadius: 48,
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: AppColor.primary.withOpacity(0.2),
                        ),
                      ),
                      child: TextField(
                        style: AppStyle.font16500,
                        controller: controller.commentTc,
                        maxLines: 4,
                        minLines: 1,
                        onChanged: (String value) {
                          controller.checkCommentAllow();
                        },
                        decoration: InputDecoration(
                          hintText: context.l10n.writeHere,
                          hintStyle: AppStyle.font14500.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColor.textPrimary.withOpacity(0.8),
                          ),
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                          isDense: true,
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: AppSize.size16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppSize.size8),
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                      controller.onAddComment();
                    },
                    child: Obx(
                      () => Container(
                        width: AppSize.size48,
                        height: AppSize.size48,
                        padding: EdgeInsets.only(left: AppSize.size4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: controller.allowComment.value
                              ? AppColor.primary
                              : AppColor.textPrimary.withOpacity(0.1),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.send_rounded,
                            color: controller.allowComment.value
                                ? AppColor.white
                                : AppColor.textPrimary.withOpacity(0.5),
                            size: AppSize.size24,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
