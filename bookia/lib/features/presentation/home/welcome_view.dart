import 'package:bookia/core/constants/app_constants.dart';
import 'package:bookia/core/functions/routing.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/presentation/auth/views/login_view.dart';
import 'package:bookia/features/presentation/auth/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';



class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          Image.asset(AssetsImages.welcome,fit: BoxFit.cover,height: double.infinity,width: double.infinity,),
          Positioned(
            top: 140,
            left: 80,
            right: 80,
            child: Column(
              children: [
                Image.asset(AssetsImages.logo,),
                const Gap(20),
                Text('Order Your Book Now!',style: getTitleStyle(),)
              ],
            )),

            Positioned(
            bottom: 90,
            left: 20,
            right: 20,
            child: Column(
              children: [
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    navigateTo(context, const LoginView());
                  }, 
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                  child: Text('Login',style: getBodyStyle(color: AppColors.white),)),
                ),
                const Gap(15),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: ElevatedButton(onPressed: (){
                    navigateTo(context, const RegisterView());
                  }, 
                  style: ElevatedButton.styleFrom(
                    
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      side:  BorderSide(color: AppColors.dark),
                      borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                  child: Text('Register',style: getBodyStyle(),)),
                ),

              ],
            )),
            

        ]
      ),
    );
  }
}