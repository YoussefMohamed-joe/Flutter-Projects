import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/services/local_storage.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/widgets/nav_bar_view.dart';
import 'package:charity_app/features/presentaion/views/splash/splach0.dart';
import 'package:charity_app/features/presentaion/views/upload/uploadview.dart';

import 'package:flutter/material.dart';

class MainSplash extends StatefulWidget {
  const MainSplash({super.key});

  @override
  State<MainSplash> createState() => _MainSplashState();
}

class _MainSplashState extends State<MainSplash> {
  bool splashDone = AppLocalStorage.getData('splashDone') ?? false;
  bool isLogin = AppLocalStorage.getData('login') ?? false;
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      navigateTowithReplacment(
          context,
          isLogin
              ? const NavBar()
              : splashDone
                  ? const UploadView()
                  : const Splash0());
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.boneWhite,
      body: const Column(children: []),
    );
  }
}
