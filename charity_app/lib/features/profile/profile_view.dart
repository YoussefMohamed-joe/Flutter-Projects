import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/features/profile/Help%20and%20support/help_support.dart';
import 'package:charity_app/features/profile/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.boneWhite,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              const Gap(80),
              Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            image: AssetImage('assets/pp.png'),
                            fit: BoxFit.fill)),
                  ),
                  const Gap(20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Gharam Mohamed', style: getheadline()),
                      Text('View and edit profile',
                          style: getsubheadline(
                            fontSize: 14,
                            decoration: true,
                          )),
                      const Gap(30),
                    ],
                  )
                ],
              ),
              const Gap(30),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/list.svg',
                          width: 30, height: 30),
                      const Gap(15),
                      Text('My Donation history', style: getsubheadline()),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
              const Gap(10),
              Container(
                width: double.infinity,
                height: 1,
                color: AppColors.lgrey,
              ),
              const Gap(10),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/wallet.svg',
                          width: 30, height: 30),
                      const Gap(15),
                      Text('Payment Method', style: getsubheadline()),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
              const Gap(10),
              Container(
                width: double.infinity,
                height: 1,
                color: AppColors.lgrey,
              ),
              const Gap(10),
              InkWell(
                onTap: () {
                  navigateTo(context, const SettingsView());
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/setting.svg',
                          width: 30, height: 30),
                      const Gap(15),
                      Text('Settings', style: getsubheadline()),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
              const Gap(10),
              Container(
                width: double.infinity,
                height: 1,
                color: AppColors.lgrey,
              ),
              const Gap(10),
              InkWell(
                onTap: () {
                  navigateTo(context, const HelpView());
                },
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/support.svg',
                          width: 30, height: 30),
                      const Gap(15),
                      Text('Help and support', style: getsubheadline()),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
              const Gap(10),
              Container(
                width: double.infinity,
                height: 1,
                color: AppColors.lgrey,
              ),
              const Gap(10),
              InkWell(
                onTap: () {},
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/logout.svg',
                          width: 30, height: 30),
                      const Gap(15),
                      Text('Log Out', style: getsubheadline()),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
