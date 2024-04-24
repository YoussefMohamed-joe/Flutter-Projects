import 'package:charity_app/core/constants/assets_images.dart';
import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/features/upload/uploadview.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Splash2 extends StatefulWidget {
  const Splash2({super.key});

  @override
  State<Splash2> createState() => _Splash2State();
}

class _Splash2State extends State<Splash2> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.boneWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
              children: [
                const Gap(100),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
          
                  child:Image(image: AssetImage( AssetsImage.image5)),
                  
                ),
                const Gap(20),
                Text('Why?',style: getheadline(fontSize: 32),),
                const Gap(20),
                Text('It is unlock the power of giving and make a\ndifference with our donation app.',style: getbody(fontSize: 18),),
                const Gap(110),
                Row(
                  children: [
                    const Gap(40),
                    Text('Next',style: getsubheadline(fontSize: 24),),
                    const Spacer(),
                    SizedBox(                      
                      height: 50,
                      child: ElevatedButton(onPressed: (){
                        navigateTowithReplacment(context, const UploadView());
                      },                      
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.green,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          
                        ), child: Icon(Icons.arrow_forward_ios,color: AppColors.white,)),
                    ),
                    const Gap(20),
                  ],
                )
            ]
          ),
        ),
      ),
    );
  }
}