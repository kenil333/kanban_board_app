import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_size.dart';
import '../../../utils/app_style.dart';
import '../../../utils/app_text.dart';
import '../../controllers/settings/settings_controller.dart';
import '../../widgets/general_appbar.dart';

class SettingsScreen extends StatefulWidget {
  static const String id = "/SettingsScreen";
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final SettingsController controller = Get.find();
  final ValueNotifier<bool> showLanguageDropDown = ValueNotifier(false);

  void onShowLanguageDropDown() {
    showLanguageDropDown.value = true;
  }

  void onHideLanguageDropDown() {
    if (showLanguageDropDown.value) {
      showLanguageDropDown.value = false;
    }
  }

  @override
  void dispose() {
    showLanguageDropDown.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onHideLanguageDropDown();
      },
      child: Scaffold(
        appBar: GeneralAppBar(title: context.l10n.settings),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: AppSize.size16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    context.l10n.appLanguage,
                    style: AppStyle.font14500,
                  ),
                  const SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      onShowLanguageDropDown();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 48,
                      padding: EdgeInsets.symmetric(
                        horizontal: AppSize.size16,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.primary.withOpacity(0.1),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              controller.locale.value.languageCode == "en"
                                  ? AppText.english
                                  : AppText.german,
                              style: AppStyle.font16500,
                            ),
                          ),
                          RotatedBox(
                            quarterTurns: 3,
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              size: AppSize.size20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 116),
                  Text(
                    context.l10n.appTheme,
                    style: AppStyle.font14500,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppColor.pallet1,
                      AppColor.pallet2,
                      AppColor.pallet3,
                      AppColor.pallet4,
                      AppColor.pallet5,
                    ]
                        .map(
                          (e) => GestureDetector(
                            onTap: () {
                              controller.onChangeTheme(e);
                              onHideLanguageDropDown();
                            },
                            child: Container(
                              width: AppSize.size.width * 0.15,
                              height: AppSize.size.width * 0.1,
                              color: Color(e),
                              child: AppColor.primary == Color(e)
                                  ? Center(
                                      child: Icon(
                                        Icons.check,
                                        color: AppColor.white,
                                        size: AppSize.size24,
                                      ),
                                    )
                                  : const Center(),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
            ValueListenableBuilder(
              valueListenable: showLanguageDropDown,
              builder: (context, show, child) => Column(
                children: [
                  SizedBox(height: AppSize.topPadding + 82),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: double.infinity,
                    height: show ? 96 : 0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColor.primary.withOpacity(0.1),
                    ),
                    margin: EdgeInsets.symmetric(horizontal: AppSize.size16),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: SizedBox(
                        width: double.infinity,
                        height: 96,
                        child: Column(
                          children: AppLocalizations.supportedLocales
                              .map(
                                (e) => GestureDetector(
                                  onTap: () {
                                    controller.onLocalChange(e.languageCode);
                                    onHideLanguageDropDown();
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: 48,
                                    color: Colors.transparent,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: AppSize.size16,
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            e.languageCode == "en"
                                                ? AppText.english
                                                : AppText.german,
                                            style: AppStyle.font16500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
