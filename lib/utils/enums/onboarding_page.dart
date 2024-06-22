import 'package:flutter/material.dart';
import 'package:kanban_board_app/utils/extensions/local_extemnsion.dart';

import '../app_image.dart';

enum OnboardingPage {
  welcome,
  addBoard,
  dragDrope,
}

extension OnboardingPageExtention on OnboardingPage {
  String title(BuildContext context) {
    switch (this) {
      case OnboardingPage.welcome:
        return context.l10n.welcomeToOur;
      case OnboardingPage.addBoard:
        return context.l10n.addBoard;
      case OnboardingPage.dragDrope:
        return context.l10n.dragDrope;
    }
  }

  String description(BuildContext context) {
    switch (this) {
      case OnboardingPage.welcome:
        return context.l10n.welcomeToOurNote;
      case OnboardingPage.addBoard:
        return context.l10n.addBoardNote;
      case OnboardingPage.dragDrope:
        return context.l10n.dragDropeNote;
    }
  }

  String get imagePath {
    switch (this) {
      case OnboardingPage.welcome:
        return AppImage.welcomeToApp;
      case OnboardingPage.addBoard:
        return AppImage.addBoard;
      case OnboardingPage.dragDrope:
        return AppImage.dragDrop;
    }
  }
}
