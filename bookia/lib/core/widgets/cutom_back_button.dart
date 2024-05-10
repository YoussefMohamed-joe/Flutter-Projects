import 'package:bookia/core/functions/routing.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:flutter/material.dart';

class CutomArrowBack extends StatelessWidget {
  const CutomArrowBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        navigatepop(context);
      },
      child: Container(
        height: 45,
        width: 45,
        margin: const EdgeInsets.only(top:10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.semiwhite),
        ),
        padding: const EdgeInsets.all(8),
        child: const Icon(Icons.arrow_back_ios_new_outlined)
      ),
    );
  }
}