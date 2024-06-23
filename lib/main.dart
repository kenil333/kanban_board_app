// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'domain/repositories/firebase_repository.dart';
import 'presentation/controllers/settings/settings_controller.dart';
import 'presentation/modules/restart/restart_screen.dart';
import 'presentation/modules/splash/screens/splash_screen.dart';
import 'utils/app_color.dart';
import 'utils/app_data.dart';
import 'utils/app_router.dart';
import 'utils/app_style.dart';
import 'utils/app_text.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseRepository().initializeAppAndNotification();
  if (Platform.isIOS) {
    AppData.iOS = true;
  } else {
    AppData.iOS = false;
  }
  Get.put(SettingsController());
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  runApp(const RestartScreen(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController settingsController = Get.find();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppText.kanbanBoard,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: settingsController.locale.value,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primary,
        ),
        fontFamily: AppText.poppins,
        scaffoldBackgroundColor: AppColor.white,
        floatingActionButtonTheme: AppStyle.floatingActionButtonTheme,
        elevatedButtonTheme: AppStyle.elevatedButtonTheme,
        appBarTheme: AppStyle.appBarTheme,
        inputDecorationTheme: AppStyle.inputDecorationTheme,
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
