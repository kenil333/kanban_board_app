import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../utils/app_color.dart';
import '../../utils/app_style.dart';

class AppInputView extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final String? hintText;
  final List<TextInputFormatter>? inputFormatters;
  final Function(String)? onChanged;
  final int? maxLength;
  final Widget? suffix;
  final int? maxLines;
  final int? minLines;

  const AppInputView({
    super.key,
    required this.controller,
    required this.title,
    this.hintText,
    this.inputFormatters,
    this.onChanged,
    this.maxLength,
    this.suffix,
    this.maxLines,
    this.minLines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyle.font14500.copyWith(
            color: AppColor.textPrimary.withOpacity(0.8),
          ),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppStyle.font14500.copyWith(
              color: AppColor.textPrimary.withOpacity(0.5),
            ),
            suffix: suffix,
            counterText: "",
          ),
          inputFormatters: inputFormatters,
          onChanged: onChanged,
          style: AppStyle.font16500,
          maxLength: maxLength,
          maxLines: maxLines,
          minLines: minLines,
        ),
      ],
    );
  }
}
