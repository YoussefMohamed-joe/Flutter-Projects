import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/colors.dart';


TextStyle getTitleStyle(
  {Color? color, double? fontSize, FontWeight? fontWeight}
){
return TextStyle(
  color: color ?? Appcolors.white,
  fontSize: fontSize?? 18,
  fontWeight: fontWeight ?? FontWeight.bold,

);
}

TextStyle getBodyStyle(
  {Color? color, double? fontSize, FontWeight? fontWeight}
){
return TextStyle(
  color: color ?? Appcolors.white,
  fontSize: fontSize?? 16,
  fontWeight: fontWeight ?? FontWeight.normal,
);
}

