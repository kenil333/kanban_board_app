import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/app_style.dart';

class GeneralAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? action;

  const GeneralAppBar({
    super.key,
    required this.title,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: AppStyle.font20700.copyWith(
          fontWeight: FontWeight.w500,
          color: AppColor.white,
        ),
      ),
      actions: action,
      elevation: 0.5,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
