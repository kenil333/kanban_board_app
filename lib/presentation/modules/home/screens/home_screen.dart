import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "/HomeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_rounded, size: 40),
      ),
    );
  }
}
