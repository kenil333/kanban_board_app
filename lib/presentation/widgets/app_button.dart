import 'package:flutter/material.dart';
import 'package:kanban_board_app/utils/app_style.dart';

import '../../utils/app_color.dart';

class AppButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  final double height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Widget? child;

  const AppButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.height = 56,
    this.backgroundColor,
    this.foregroundColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          onPressed();
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.zero,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
        ),
        child: child ??
            Text(
              title,
              style: AppStyle.font16500.copyWith(
                color: foregroundColor ?? AppColor.white,
              ),
            ),
      ),
    );
  }
}
