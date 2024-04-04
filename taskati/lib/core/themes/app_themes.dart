import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        
        datePickerTheme: DatePickerThemeData(
          backgroundColor: AppColors.white,         
          headerForegroundColor: AppColors.violet
        ),
        colorScheme: ColorScheme.fromSeed(
          primary: AppColors.violet,
          onSurface: AppColors.black,
          seedColor: AppColors.black),
        appBarTheme: AppBarTheme(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.violet,
          centerTitle: true
        ),
        inputDecorationTheme: InputDecorationTheme(
                    hintStyle: getSmallStyle(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.violet)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.violet)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.red)
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.red)
                    ),
      )
  );
  static ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColors.darkth,
    timePickerTheme: TimePickerThemeData(
      backgroundColor: AppColors.darkth,
      dialBackgroundColor: AppColors.darkth,
      hourMinuteColor: AppColors.violet,
      hourMinuteTextColor: AppColors.white,
      dayPeriodColor: AppColors.white,
    ),
    datePickerTheme: DatePickerThemeData(
          backgroundColor: AppColors.darkth,         
          headerForegroundColor: AppColors.violet
        ),
    colorScheme: ColorScheme.fromSeed(
          primary: AppColors.violet,
          onSurface: AppColors.white,
          seedColor: AppColors.white),
        appBarTheme: AppBarTheme(
          foregroundColor: AppColors.white,
          backgroundColor: AppColors.violet,
          centerTitle: true
        ),
        inputDecorationTheme: InputDecorationTheme(
                    hintStyle: getSmallStyle(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.violet)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.violet)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.red)
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.red)
                    ),
      )
  );
}