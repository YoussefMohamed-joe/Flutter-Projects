import 'package:charity_app/core/constants/assets_images.dart';
import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'splash1.dart';

class Splash0 extends StatefulWidget {
  const Splash0({super.key});

  @override
  State<Splash0> createState() => _Splash0State();
}

class _Splash0State extends State<Splash0> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5),(){
      navigateTowithReplacment(context, const Splash1());
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: const Center(
        child: Column(
            children: [
              
          ]
        ),
      ),
    );
  }
}