import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.text, this.width, this.height, this.onpressed,
  });
  final String text;
  final double? width;
  final double? height;
  final Function()? onpressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?? 60,
      width: width ?? 270,
      child: ElevatedButton(onPressed: onpressed ?? (){}, 
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
      ),
      child: Text(text,style: getbody(color: AppColors.white,fontWeight: FontWeight.bold),)),
    );
  }
}