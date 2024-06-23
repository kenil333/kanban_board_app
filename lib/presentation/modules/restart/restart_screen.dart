import 'package:flutter/material.dart';

class RestartScreen extends StatefulWidget {
  static void restartApp(BuildContext context) {
    if (context.findAncestorStateOfType<_RestartScreenState>() != null) {
      context.findAncestorStateOfType<_RestartScreenState>()!.restartApp();
    }
  }

  final Widget child;

  const RestartScreen({super.key, required this.child});

  @override
  State<RestartScreen> createState() => _RestartScreenState();
}

class _RestartScreenState extends State<RestartScreen> {
  Key key = UniqueKey();

  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyedSubtree(
      key: key,
      child: widget.child,
    );
  }
}
