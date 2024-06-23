import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../data/models/comment_model.dart';
import '../../../../utils/app_color.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_style.dart';

class CommentStemp extends StatelessWidget {
  final CommentModel comment;
  const CommentStemp({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Flexible(
              flex: 1,
              child: Container(),
            ),
            Flexible(
              flex: 4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.size16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(15),
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                          bottomRight: Radius.zero,
                        ),
                        color: AppColor.primary.withOpacity(0.1),
                      ),
                      child: Text(
                        comment.message,
                        style: AppStyle.font14500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          DateFormat("hh:mm a, dd-MM-yy").format(
            DateTime.fromMillisecondsSinceEpoch(comment.id),
          ),
          style: AppStyle.font10400,
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
