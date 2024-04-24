import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/features/widgets/custon_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  bool passvis=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
          child: Column(
        children: [
          const Gap(80),
          Text('إحسان', style: getehsan()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'HELLO',
                style: getheadline(fontSize: 36, color: AppColors.white),
              ),
              const Gap(10),
              Text(
                'USER!',
                style: getheadline(fontSize: 36, color: AppColors.semigreen),
              ),
            ],
          ),
          const Gap(50),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  color: AppColors.boneWhite,
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(35),topRight: Radius.circular(35))),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Gap(5),
                      Text(
                        'Welcome Back!',
                        style: getheadline(fontSize: 36),
                      ),
                      const Gap(5),
                      Row(
                        children: [
                          Text(
                            'Fill your details or continue\nwith your account',
                            style: getbodysmall(
                                fontSize: 18, color: AppColors.dgrey),
                          ),
                        ],
                      ),
                      const Gap(20),
                      const CustomTextField(
                        label: 'Email',
                        prefix: Icons.email,
                      ),
                      const Gap(20),
                      CustomTextField(
                        label: 'Password',
                        obsecure: passvis,
                        prefix: Icons.lock,
                        suffix: passvis ? Icons.visibility_off : Icons.visibility,
                        suffixOnPress: () {
                          setState(() {
                            passvis = !passvis;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
