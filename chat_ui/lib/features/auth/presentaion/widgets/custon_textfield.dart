import 'package:chat_ui/core/colors.dart';
import 'package:chat_ui/core/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData prefix;
  final IconData? suffix;
  final Function()? suffixOnPress;
   final bool? obsecure ;
    const CustomTextField({
    super.key, required this.label, required this.prefix, this.suffix, this.suffixOnPress,  this.obsecure,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obsecure ?? false,
      decoration: InputDecoration(
        suffixIcon: suffix != null ? IconButton(onPressed: suffixOnPress,color: AppColors.grey,icon: Icon(suffix),) : const SizedBox(),
        prefixIcon: Icon(prefix,color: AppColors.grey,),
        label: Text(label,style: getTextStyle(color: AppColors.grey),),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.lb)
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: AppColors.lb)
        )
      ),
    );
  }
}
