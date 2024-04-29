import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class DonateView extends StatefulWidget {
  const DonateView({super.key});

  @override
  State<DonateView> createState() => _DonateViewState();
}

class _DonateViewState extends State<DonateView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
        child: Text('إحسان',style: getehsan()),
      ),
    );
  }
}