import 'package:charity_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle getheadline(
    {Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    bool? decoration}) {
  return TextStyle(
    decorationColor: color ?? AppColors.black,
    decoration:
        decoration ?? false ? TextDecoration.underline : TextDecoration.none,
    fontFamily: GoogleFonts.sourceSans3().fontFamily,
    color: color ?? AppColors.black,
    fontSize: fontSize ?? 24,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getsubheadline(
    {Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    bool? decoration}) {
  return TextStyle(
    decorationColor: color ?? AppColors.black,
    decoration:
        decoration ?? false ? TextDecoration.underline : TextDecoration.none,
    fontFamily: GoogleFonts.sourceSans3().fontFamily,
    color: color ?? AppColors.black,
    fontSize: fontSize ?? 20,
    fontWeight: fontWeight ?? FontWeight.w500,
  );
}

TextStyle getbody(
    {Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    bool? decoration}) {
  return TextStyle(
    decorationColor: color ?? AppColors.black,
    decoration:
        decoration ?? false ? TextDecoration.underline : TextDecoration.none,
    fontFamily: GoogleFonts.sourceSans3().fontFamily,
    color: color ?? AppColors.black,
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle getbodysmall(
    {Color? color,
    double? fontSize,
    FontWeight? fontWeight,
    bool? decoration}) {
  return TextStyle(
    decoration:
        decoration ?? false ? TextDecoration.underline : TextDecoration.none,
    fontFamily: GoogleFonts.sourceSans3().fontFamily,
    color: color ?? AppColors.black,
    fontSize: fontSize ?? 12,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}

TextStyle getehsan({Color? color, double? fontSize, FontWeight? fontWeight}) {
  return TextStyle(
    fontFamily: 'arslan',
    color: color ?? AppColors.white,
    fontSize: fontSize ?? 60,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
