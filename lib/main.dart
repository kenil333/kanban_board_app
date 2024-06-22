// ignore_for_file: depend_on_referenced_packages

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColor.primary,
        ),
        fontFamily: AppText.poppins,
        scaffoldBackgroundColor: AppColor.white,
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColor.primary,
          foregroundColor: AppColor.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            backgroundColor: AppColor.primary,
            foregroundColor: AppColor.white,
            shadowColor: AppColor.textPrimary.withOpacity(0.25),
          ),
        ),
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
