import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_image.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/app_text.dart';

class SplashScreen extends StatelessWidget {
  static const String id = "/";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSize.setupData(MediaQuery.of(context));
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImage.appIcon,
                  width: MediaQuery.of(context).size.width * 0.3,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 24),
                Text(AppText.kanbanBoard, style: AppStyle.font16500),
              ],
            ),
          ),
          Positioned(
            bottom: AppSize.bottomPadding + (AppSize.isTablet ? 60 : 35),
            child: SizedBox(
              width: AppSize.size.width,
              child: Center(
                child: SpinKitThreeBounce(
                  color: AppColor.primary,
                  size: (AppSize.isTablet ? 50 : 40),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
