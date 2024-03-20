import 'package:chat_ui/core/colors.dart';
import 'package:flutter/material.dart';

TextStyle getTextStyle({double? size,Color? color}){
  return TextStyle(
    fontSize: size ?? 18,
    color: color ?? AppColors.white,
  );
}

TextStyle getTextStyleBold({double? size,Color? color}){
  return TextStyle(
    fontSize: size ?? 18,
    color: color ?? AppColors.white,
    fontWeight: FontWeight.bold
  );
}

TextStyle gettitleTextStyle({double? size,Color? color}){
  return TextStyle(
    fontSize: size ?? 18,
    color: color ?? AppColors.black,
  );
}

TextStyle getSmallTextStyle({double? size,Color? color}){
  return TextStyle(
    fontSize: size ?? 14,
    color: color ?? AppColors.black,
  );
}

TextStyle getSignTextStyle({double? size,Color? color}){
  return TextStyle(
    fontSize: size ?? 20,
    color: color ?? AppColors.lb,
  );
}