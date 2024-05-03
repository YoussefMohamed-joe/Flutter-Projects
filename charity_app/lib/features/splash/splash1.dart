import 'package:charity_app/core/constants/assets_images.dart';
import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/features/splash/splash2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Splash1 extends StatefulWidget {
  const Splash1({super.key});

  @override
  State<Splash1> createState() => _Splash1State();
}

class _Splash1State extends State<Splash1> {
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
              child: Image(image: AssetImage(AssetsImage.image4)),
            ),
            const Gap(20),
            Text(
              'Why?',
              style: getheadline(fontSize: 32),
            ),
            const Gap(20),
            Text(
              'Donation is the act of giving, whether it be\nfinancial assistance, goods, or services,\nto support a cause or help those in need.\nIt is a powerful way to make a positive\nimpact on individuals.',
              style: getbody(fontSize: 18),
            ),
            const Gap(45),
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
                        navigateTowithReplacment(context, const Splash2());
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
