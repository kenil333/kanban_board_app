import 'package:flutter/material.dart';

import 'app_color.dart';
import 'app_size.dart';

class AppStyle {
  static get floatingActionButtonTheme => FloatingActionButtonThemeData(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      );

  static get elevatedButtonTheme => ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.white,
          shadowColor: AppColor.textPrimary.withOpacity(0.25),
        ),
      );

  static get appBarTheme => AppBarTheme(
        backgroundColor: AppColor.primary,
        foregroundColor: AppColor.white,
      );

  static get underlinBorder => UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.textPrimary.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.zero,
      );

  static get errorUnderlineBorder => UnderlineInputBorder(
        borderSide: BorderSide(
          color: AppColor.errorColor.withOpacity(0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.zero,
      );

  static get inputDecorationTheme => InputDecorationTheme(
        // hintStyle: TextStyle(
        //   fontSize: 16,
        //   color: Pallet.blackColor.withOpacity(0.4),
        //   fontWeight: FontWeight.w400,
        // ),
        // counterStyle: TextStyle(
        //   fontSize: 13,
        //   color: Pallet.blackColor.withOpacity(0.4),
        //   fontWeight: FontWeight.w400,
        // ),
        // errorStyle: TextStyle(
        //   fontSize: 13,
        //   fontWeight: FontWeight.w400,
        //   color: Pallet.errorColor.withOpacity(0.9),
        // ),
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 8),
        border: underlinBorder,
        errorBorder: errorUnderlineBorder,
        enabledBorder: underlinBorder,
        focusedBorder: underlinBorder,
        disabledBorder: underlinBorder,
        focusedErrorBorder: errorUnderlineBorder,
      );

  static TextStyle font10400 = TextStyle(
    fontSize: AppSize.size10,
    fontWeight: FontWeight.w400,
    color: AppColor.textPrimary,
  );

  static TextStyle font12400 = TextStyle(
    fontSize: AppSize.size12,
    fontWeight: FontWeight.w400,
    color: AppColor.textPrimary,
  );

  static TextStyle font14500 = TextStyle(
    fontSize: AppSize.size14,
    fontWeight: FontWeight.w500,
    color: AppColor.textPrimary,
  );

  static TextStyle font16500 = TextStyle(
    fontSize: AppSize.size16,
    fontWeight: FontWeight.w500,
    color: AppColor.textPrimary,
  );

  static TextStyle font20700 = TextStyle(
    fontSize: AppSize.size20,
    fontWeight: FontWeight.w700,
    color: AppColor.textPrimary,
  );
}
