import 'package:bookia/features/presentation/home/welcome_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.dmSerifDisplay().fontFamily,
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomeView(),
    );
  }
}
