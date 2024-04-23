import 'package:charity_app/features/splash/main_splash.dart';
import 'package:charity_app/features/splash/splach0.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainSplash(),
    );
  }
}
