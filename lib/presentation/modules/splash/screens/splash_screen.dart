import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../../utils/app_color.dart';
import '../../../../utils/app_image.dart';
import '../../../../utils/app_size.dart';
import '../../../../utils/app_style.dart';
import '../../../../utils/app_text.dart';
import '../../../controllers/splash/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "/";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController controller = Get.put(SplashController());

  @override
  void initState() {
    controller.initializeResources();
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<SplashController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppSize.setupData(MediaQuery.of(context));
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
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
