import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';

TextStyle getTitleStyle(context,
  {Color? color, double? fontSize, FontWeight? fontWeight}
){
return TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,
  color: color ?? Theme.of(context).colorScheme.onSurface,
  fontSize: fontSize?? 18,
  fontWeight: fontWeight ?? FontWeight.bold,

);
}

TextStyle getBodyStyle(context,
  {Color? color, double? fontSize, FontWeight? fontWeight}
){
return TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,
  color: color ?? Theme.of(context).colorScheme.onSurface,
  fontSize: fontSize?? 16,
  fontWeight: fontWeight ?? FontWeight.normal,
);
}

TextStyle getSmallStyle(
  {Color? color, double? fontSize, FontWeight? fontWeight}
){
return TextStyle(
  fontFamily: GoogleFonts.poppins().fontFamily,
  color: color ?? (AppLocalStorage.getcasUserhData('theme')?? false ? AppColors.black : AppColors.white),
  fontSize: fontSize?? 14,
  fontWeight: fontWeight ?? FontWeight.normal,
);
}