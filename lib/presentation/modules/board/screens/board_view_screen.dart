import 'package:appflowy_board/appflowy_board.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';

import '../../../../data/models/task_model.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/app_text.dart';
import '../../../controllers/board/board_controller.dart';
import '../../../widgets/general_appbar.dart';
import '../widgets/task_stemp.dart';

class BoardViewScreen extends GetView<BoardController> {
  static const String id = "/BoardViewScreen";
  const BoardViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(title: controller.board.name),
      body: AppFlowyBoard(
        controller: controller.appFlowyBoardController,
        groupConstraints: BoxConstraints.tightFor(width: AppSize.size260),
        leading: SizedBox(width: AppSize.size16),
        trailing: SizedBox(width: AppSize.size16),
        config: AppFlowyBoardConfig(
          boardCornerRadius: 0,
          groupCornerRadius: 12,
          groupBackgroundColor: AppColor.primary.withOpacity(0.1),
          groupMargin: EdgeInsets.only(
            left: AppSize.size8,
            right: AppSize.size8,
            top: AppSize.size16,
            bottom: AppSize.size16 + AppSize.bottomPadding,
          ),
          groupHeaderPadding: EdgeInsets.symmetric(horizontal: AppSize.size16),
          groupBodyPadding: EdgeInsets.symmetric(horizontal: AppSize.size4),
          groupFooterPadding: EdgeInsets.symmetric(horizontal: AppSize.size16),
          stretchGroupHeight: true,
          cardMargin: EdgeInsets.symmetric(
            horizontal: AppSize.size8,
            vertical: 8,
          ),
        ),
        headerBuilder: (context, columnData) {
          return Container(
            width: double.infinity,
            height: 48,
            color: AppColor.primary.withOpacity(0.4),
            padding: EdgeInsets.symmetric(
              horizontal: AppSize.size12,
            ),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColor.white.withOpacity(0.8),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.size10,
                    vertical: 2,
                  ),
                  child: Text(
                    columnData.id,
                    style: AppStyle.font14500,
                  ),
                ),
                Expanded(child: Container()),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColor.white.withOpacity(0.8),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSize.size10,
                    vertical: 2,
                  ),
                  child: Text(
                    (columnData.customData as List<TaskModel>)
                        .length
                        .toString(),
                    style: AppStyle.font14500,
                  ),
                ),
              ],
            ),
          );
        },
        cardBuilder: (context, group, groupItem) {
          return AppFlowyGroupCard(
            key: ValueKey(groupItem.id),
            margin: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.white,
            ),
            boxConstraints: const BoxConstraints(minHeight: 10),
            child: TaskStemp(
              task: controller.taskList
                  .firstWhere((e) => e.id.toString() == groupItem.id),
              onPressed: (task) {
                controller.onTaskPressed(task);
              },
            ),
          );
        },
        footerBuilder: (context, columnData) {
          if (columnData.id == AppText.todo) {
            return AppFlowyGroupFooter(
              margin: EdgeInsets.symmetric(
                horizontal: AppSize.size12,
              ),
              icon: Icon(
                Icons.add_rounded,
                size: AppSize.size24,
                color: AppColor.textPrimary,
              ),
              title: Text(context.l10n.newTxt, style: AppStyle.font16500),
              height: 45,
              onAddButtonClick: () {
                controller.onPressedNew();
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
