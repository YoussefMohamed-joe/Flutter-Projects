import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati/core/utils/colors.dart';

TextStyle getTitleStyle(
  {Color? color, double? fontSize, FontWeight? fontWeight}
){
return TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,
  color: color ?? AppColors.black,
  fontSize: fontSize?? 18,
  fontWeight: fontWeight ?? FontWeight.bold,

);
}

TextStyle getBodyStyle(
  {Color? color, double? fontSize, FontWeight? fontWeight}
){
return TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,
  color: color ?? AppColors.black,
  fontSize: fontSize?? 16,
  fontWeight: fontWeight ?? FontWeight.normal,
);
}

TextStyle getSmallStyle(
  {Color? color, double? fontSize, FontWeight? fontWeight}
){
return TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,
  color: color ?? AppColors.black,
  fontSize: fontSize?? 14,
  fontWeight: fontWeight ?? FontWeight.normal,
);
}