import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/home_view/home_view.dart';
import 'package:taskati/features/upload_view/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    
    Future.delayed(const Duration(seconds: 5,microseconds: 40),(){
      if(AppLocalStorage.getcasUserhData('Reg')?? false){
        navigateTowithReplacment(context, const HomeView());
      }else{
      navigateTowithReplacment(context, const UploadView());
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children:[
            Lottie.asset(AssetsImage.logo),
            const Gap(20),
            Text('Taskati',style: getTitleStyle(fontSize: 24,fontWeight: FontWeight.normal),),
            const Gap(10),
            Text('It\'s Time To Get Organised',style: getBodyStyle(fontWeight:  FontWeight.w100),)
            ]
        ),
      ),
    );
  }
}