import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

import 'package:gap/gap.dart';

class HelpView extends StatelessWidget {
  const HelpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.boneWhite,
      appBar: AppBar(
        backgroundColor: AppColors.boneWhite,
        title: Text('Help and Support',
            style: getheadline(color: AppColors.black)),
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
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Help Center ', style: getheadline(fontSize: 24)),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  ),
                  const Gap(5),
                  Text(
                    'See FAQ and contact support',
                    style: getbody(),
                  )
                ],
              ),
            ),
            const Gap(10),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.lgrey,
            ),
            const Gap(10),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Feedback ', style: getheadline(fontSize: 24)),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  ),
                  const Gap(5),
                  Text(
                    'Take a moment to let us know how we’re doing',
                    style: getbody(),
                  )
                ],
              ),
            ),
            const Gap(10),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.lgrey,
            ),
            const Gap(10),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Invite friends to Kind Heart ',
                          style: getheadline(fontSize: 24)),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  ),
                  const Gap(5),
                  Text(
                    'Invite friends to Donate ',
                    style: getbody(),
                  )
                ],
              ),
            ),
            const Gap(10),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.lgrey,
            ),
            const Gap(10),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('submit Request', style: getheadline(fontSize: 24)),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  ),
                  const Gap(5),
                  Text(
                    'Submit an email to customer service',
                    style: getbody(),
                  )
                ],
              ),
            ),
            const Gap(10),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.lgrey,
            ),
            const Gap(10),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('chat with us ', style: getheadline(fontSize: 24)),
                      const Spacer(),
                      const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      )
                    ],
                  ),
                  const Gap(5),
                  Text(
                    'Chat with one of our customer service',
                    style: getbody(),
                  )
                ],
              ),
            ),
            const Gap(10),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.lgrey,
            ),
            const Gap(10),
            SizedBox(
              width: double.infinity,
              height: 70,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Version', style: getheadline(fontSize: 24)),
                    ],
                  ),
                  const Gap(5),
                  Text(
                    '6.37539',
                    style: getbody(),
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
