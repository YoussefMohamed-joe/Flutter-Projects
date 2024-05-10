import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
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
        inputDecorationTheme:  InputDecorationTheme(
          fillColor: AppColors.textformcolor,
          filled: true,
          hintStyle: getBodyStyle(color: AppColors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: AppColors.semiwhite),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:  BorderSide(color: AppColors.semiwhite),
          ),
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const WelcomeView(),
    );
  }
}
