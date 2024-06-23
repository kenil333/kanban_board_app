import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_image.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_style.dart';
import '../../../controllers/home/home_controller.dart';
import '../../../widgets/general_appbar.dart';
import '../widgets/board_stemp.dart';

class HomeScreen extends GetView<HomeController> {
  static const String id = "/HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GeneralAppBar(
        title: context.l10n.kanbanBoard,
        action: [
          IconButton(
            onPressed: () {
              controller.onSettingsPressed();
            },
            icon: const Icon(Icons.settings_rounded),
          ),
        ],
      ),
      body: Obx(
        () => controller.fetchingProjects.value
            ? Center(
                child: SpinKitThreeBounce(
                  color: AppColor.primary,
                  size: (AppSize.isTablet ? 50 : 40),
                ),
              )
            : controller.boards.isNotEmpty
                ? MasonryGridView.count(
                    crossAxisCount: 2,
                    padding: EdgeInsets.only(
                      top: 24,
                      bottom: AppSize.bottomPadding + 100,
                      right: AppSize.size16,
                      left: AppSize.size16,
                    ),
                    crossAxisSpacing: AppSize.size16,
                    mainAxisSpacing: AppSize.size16,
                    itemCount: controller.boards.length,
                    itemBuilder: (context, i) => BoardStemp(
                      board: controller.boards[i],
                      onPressed: () {
                        controller.onNavigateBoardView(controller.boards[i]);
                      },
                    ),
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AppImage.emptyBox,
                          height: AppSize.size.height * 0.15,
                          color: AppColor.primary,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          context.l10n.noBoard,
                          style: AppStyle.font20700.copyWith(
                            fontWeight: FontWeight.w600,
                            color: AppColor.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.onNavigateCreateBoard();
        },
        child: const Icon(Icons.add_rounded, size: 40),
      ),
    );
  }
}
