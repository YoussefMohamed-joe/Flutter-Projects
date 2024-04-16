import 'package:charity_app/core/constants/assets_images.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Splash1 extends StatelessWidget {
  const Splash1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.boneWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              children: [
                const Gap(120),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
          
                  child:Image(image: AssetImage( AssetsImage.image3)),
                  
                ),
                const Gap(20),
                Text('Why?',style: getheadline(fontSize: 32),),
                const Gap(20),
                Text('Discover and support charities , initiatives \nthat align with your values and create a \nbetter future for all',style: getbody(fontSize: 18),),

            ]
          ),
        ),
      ),
    );
  }
}