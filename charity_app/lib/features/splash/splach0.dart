import 'package:charity_app/core/constants/assets_images.dart';
import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/features/splash/splash1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class Splash0 extends StatefulWidget {
  const Splash0({super.key});

  @override
  State<Splash0> createState() => _Splash0State();
}

class _Splash0State extends State<Splash0> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.boneWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            const Gap(120),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(image: AssetImage(AssetsImage.image3)),
            ),
            const Gap(20),
            Text(
              'Why?',
              style: getheadline(fontSize: 32),
            ),
            const Gap(20),
            Text(
              'Discover and support charities , initiatives \nthat align with your values and create a \nbetter future for all',
              style: getbody(fontSize: 18),
            ),
            const Gap(80),
            Row(
              children: [
                const Gap(40),
                Text(
                  'Skip',
                  style: getsubheadline(fontSize: 24),
                ),
                const Spacer(),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        navigateTowithReplacment(context, const Splash1());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.white,
                      )),
                ),
                const Gap(20),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
