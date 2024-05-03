import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.boneWhite,
      appBar: AppBar(
        backgroundColor: AppColors.boneWhite,
        title: Text('Settings', style: getheadline(color: AppColors.black)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(children: [
            const Gap(20),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Gap(5),
                      SvgPicture.asset(
                        'assets/Bell.svg',
                        width: 30,
                        height: 30,
                        colorFilter:
                            ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                      ),
                    ],
                  ),
                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Notifications', style: getheadline(fontSize: 24)),
                      Text(
                        'Recommendations and special\ncommunication',
                        style: getbody(),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Column(
                    children: [
                      Gap(10),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Gap(12),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.lgrey,
            ),
            const Gap(12),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Gap(5),
                      SvgPicture.asset(
                        'assets/lang.svg',
                        width: 30,
                        height: 30,
                        colorFilter:
                            ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                      ),
                    ],
                  ),
                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Language', style: getheadline(fontSize: 24)),
                      const Gap(10),
                      Text(
                        'English',
                        style: getbody(),
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Gap(10),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      ),
                      const Gap(10),
                      Text(
                        'التغيير إلى العربية',
                        style: getbody(decoration: true),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Gap(12),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.lgrey,
            ),
            const Gap(12),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Gap(5),
                      SvgPicture.asset(
                        'assets/location.svg',
                        width: 30,
                        height: 30,
                        colorFilter:
                            ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                      ),
                    ],
                  ),
                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Country', style: getheadline(fontSize: 24)),
                      const Gap(10),
                      Text(
                        'Egypt , All cities',
                        style: getbody(),
                      )
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      const Gap(10),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      ),
                      const Gap(10),
                      Text(
                        'Change',
                        style: getbody(decoration: true),
                      )
                    ],
                  )
                ],
              ),
            ),
            const Gap(12),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.lgrey,
            ),
            const Gap(12),
            SizedBox(
              width: double.infinity,
              height: 80,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      const Gap(5),
                      SvgPicture.asset(
                        'assets/password.svg',
                        width: 30,
                        height: 30,
                        colorFilter:
                            ColorFilter.mode(AppColors.black, BlendMode.srcIn),
                      ),
                    ],
                  ),
                  const Gap(15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Change password', style: getheadline(fontSize: 24)),
                      const Gap(10),
                      Text(
                        'Reset your password',
                        style: getbody(),
                      )
                    ],
                  ),
                  const Spacer(),
                  const Column(
                    children: [
                      Gap(10),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
