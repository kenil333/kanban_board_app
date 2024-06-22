import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/enums/onboarding_page.dart';
import '../../../controllers/onboarding/onboarding_controller.dart';
import '../../../widgets/app_button.dart';

class OnBoardingScreen extends GetView<OnboardingController> {
  static const String id = "/OnBoardingScreen";
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          PageView.builder(
            controller: controller.pageController,
            onPageChanged: (int pageIndex) {
              controller.onChangeCurrentPage(pageIndex);
            },
            itemCount: controller.pages.length,
            itemBuilder: (context, i) => Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: AppSize.size24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: AppSize.topPadding),
                  Expanded(child: Container()),
                  SvgPicture.asset(
                    controller.pages[i].imagePath,
                    height: AppSize.size.height * 0.3,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    controller.pages[i].title(context),
                    style: AppStyle.font20700,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    controller.pages[i].description(context),
                    style: AppStyle.font14500,
                    textAlign: TextAlign.center,
                  ),
                  Expanded(child: Container()),
                  Expanded(child: Container()),
                  SizedBox(height: AppSize.bottomPadding),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Expanded(child: Container()),
              Row(
                children: [
                  SizedBox(width: AppSize.size24),
                  Obx(
                    () => controller.currentPage.value != 0
                        ? SizedBox(
                            width: 56,
                            child: AppButton(
                              title: context.l10n.back,
                              onPressed: () {
                                controller.animateToPage(
                                    controller.currentPage.value - 1);
                              },
                              height: 56,
                              backgroundColor:
                                  AppColor.primary.withOpacity(0.9),
                              child: const Icon(Icons.arrow_back_ios_rounded),
                            ),
                          )
                        : Container(),
                  ),
                  Expanded(child: Container()),
                  SizedBox(
                    width: 56,
                    child: AppButton(
                      title: context.l10n.next,
                      onPressed: () {
                        controller
                            .animateToPage(controller.currentPage.value + 1);
                      },
                      height: 56,
                      child: const RotatedBox(
                        quarterTurns: 2,
                        child: Icon(
                          Icons.arrow_back_ios_rounded,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: AppSize.size24),
                ],
              ),
              SizedBox(height: AppSize.bottomPadding + 24),
            ],
          ),
        ],
      ),
    );
  }
}
