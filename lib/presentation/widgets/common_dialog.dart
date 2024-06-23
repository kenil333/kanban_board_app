// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_image.dart';
import '../../../utils/app_size.dart';
import '../../utils/app_style.dart';
import 'app_button.dart';

/// A customizable dialog widget used throughout the app.
///
/// The [CommonDialog] widget provides a standard dialog with a description,
/// an icon, and an optional close button callback. It is typically used
/// to display important information or alerts to the user.
///
/// Required parameters:
/// - [description]: The text to be displayed as the description of the dialog.
/// - [language]: The language code to be used for localizing the dialog content.
///
/// Optional parameters:
/// - [icon]: The icon to be displayed in the dialog. Defaults to [AppImage.alertErrorIcon].
/// - [onClose]: A callback function that is executed when the close button is pressed. If not provided, no specific action is taken on close.
class CommonDialog extends StatelessWidget {
  final String description;
  final String icon;
  final Function? onClose;

  const CommonDialog({
    super.key,
    required this.description,
    this.icon = AppImage.alertErrorIcon,
    this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColor.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: AppSize.size24,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppColor.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SvgPicture.asset(
              icon,
              height: 75,
            ),
            const SizedBox(height: 24),
            Text(
              description,
              style: AppStyle.font16500.copyWith(
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                SizedBox(width: AppSize.size48),
                Expanded(
                  child: AppButton(
                    height: 48,
                    title: context.l10n.close,
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (onClose != null) {
                        onClose!();
                      }
                    },
                  ),
                ),
                SizedBox(width: AppSize.size48),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
