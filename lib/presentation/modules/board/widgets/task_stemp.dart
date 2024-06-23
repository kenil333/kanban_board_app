import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';

import '../../../../data/models/task_model.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_style.dart';

class TaskStemp extends StatelessWidget {
  final TaskModel task;
  final Function(TaskModel) onPressed;
  const TaskStemp({
    super.key,
    required this.task,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed(task);
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: AppSize.size12),
        color: AppColor.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(task.title, style: AppStyle.font14500),
            const SizedBox(height: 12),
            Text(
              context.l10n.createdAt,
              style: AppStyle.font10400.copyWith(
                color: AppColor.textPrimary.withOpacity(0.5),
              ),
            ),
            Text(
              DateFormat("hh:mm a, dd-MM-yyyy").format(
                DateTime.fromMillisecondsSinceEpoch(task.id),
              ),
              style: AppStyle.font12400,
            ),
          ],
        ),
      ),
    );
  }
}
