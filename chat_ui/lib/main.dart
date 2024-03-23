import 'package:chat_ui/features/auth/presentaion/view/login_view.dart';
import 'package:chat_ui/features/auth/presentaion/view/register_view.dart';
import 'package:chat_ui/features/chat/presentaion/view/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginView(),
    );
  }
}
