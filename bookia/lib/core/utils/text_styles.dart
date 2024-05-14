import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';

TextStyle getTitleStyle(
    {Color? color, double? fontSize, FontWeight? fontWeight}) {
  return TextStyle(
    color: color ?? AppColors.dark,
    fontSize: fontSize ?? 20,
    fontWeight: fontWeight ?? FontWeight.bold,
  );
}

TextStyle getBodyStyle(
    {Color? color, double? fontSize, FontWeight? fontWeight}) {
  return TextStyle(
    color: color ?? AppColors.dark,
    fontSize: fontSize ?? 16,
    fontWeight: fontWeight ?? FontWeight.normal,
  );
}
