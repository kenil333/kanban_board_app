import 'package:flutter/material.dart';

class AppMethod {
  static openDialog(BuildContext context, Widget widget) {
    showDialog(
      context: context,
      builder: (context) => widget,
    );
  }
}
