import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'domain/repositories/firebase_repository.dart';
import 'presentation/modules/splash/screens/splash_screen.dart';
import 'utils/app_color.dart';
import 'utils/app_data.dart';
import 'utils/app_router.dart';
import 'utils/app_text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseRepository().initializeAppAndNotification();
  if (Platform.isIOS) {
    AppData.iOS = true;
  } else {
    AppData.iOS = false;
  }
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppText.kanbanBoard,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primary,
        ),
        fontFamily: AppText.poppins,
        scaffoldBackgroundColor: AppColor.white,
      ),
      initialRoute: SplashScreen.id,
      getPages: AppRouter.getRoutes(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: TextScaler.noScaling,
          ),
          child: child!,
        );
      },
    );
  }
}
