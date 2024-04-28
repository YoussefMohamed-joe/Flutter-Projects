import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/functions/routing.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_styles.dart';
import 'package:insights_news/core/widgets/nav_bar_view.dart';

import 'package:insights_news/features/upload/upload_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  bool registerd = AppLocalStorage.getData('Reg') ?? false;
  @override
  void initState() {
    
    Future.delayed(const Duration(seconds: 3,microseconds: 40),(){  
      navigateToWithReplacment(context,registerd ? const NavBar(): const UploadView());
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
            Image.asset('assets/logo.png'),
            const Gap(20),
            Text('Insights News',style: getTitleStyle(fontSize: 24),),
            const Gap(20),
            Text('Stay Informed, Anytime, Anywhere.',style: getBodyStyle(color: Appcolors.grey),)
            ]
        ),
      ),
    );
  }
}