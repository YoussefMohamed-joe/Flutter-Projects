import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final IconData prefix;
  final IconData? suffix;
  final Function(String)? onChanged;
  final Function()? suffixOnPress;
  final bool? obsecure;
  const CustomTextField({
    super.key,
    required this.label,
    required this.prefix,
    this.suffix,
    this.suffixOnPress,
    this.obsecure,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged ?? (value) {},
      obscureText: obsecure ?? false,
      decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          suffixIcon: suffix != null
              ? IconButton(
                  onPressed: suffixOnPress,
                  color: AppColors.grey,
                  icon: Icon(suffix),
                )
              : const SizedBox(),
          prefixIcon: Icon(
            prefix,
            color: AppColors.grey,
          ),
          label: Text(
            label,
            style: getbody(color: AppColors.dgrey),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.white))),
    );
  }
}
