import 'package:flutter/material.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

scaffoldErrorMessage(context,String text){
  ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                backgroundColor: AppColors.red,
                content: Center(child: Text(text,style: getBodyStyle(color: AppColors.white),)))
              );
}