import 'package:charity_app/core/constants/assets_images.dart';
import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/features/upload/uploadview.dart';
import 'package:charity_app/features/widgets/custom_button.dart';
import 'package:charity_app/features/widgets/custon_textfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  bool passvis = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.boneWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SingleChildScrollView(
            child: Column(children: [
              const Gap(40),
              Text('Getting started!',
                  style: getheadline(color: AppColors.green, fontSize: 36)),
              Text(
                'Looks like you are new to us!',
                style: getheadline(fontSize: 20, color: AppColors.dgrey),
              ),
              const Gap(10),
              Text(
                'Create an account for great donation experience',
                style: getheadline(fontSize: 16, color: AppColors.dgrey),
              ),
              const Gap(20),
              const CustomTextField(
                label: 'UserName',
                prefix: Icons.person,
              ),
              const Gap(20),
              const CustomTextField(
                label: 'Phone Number',
                prefix: Icons.phone,
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
              const Gap(30),
              CustomButton(
                text: 'SIGN UP',
                onpressed: () {
                  //////////////
                },
                height: 47,
                width: double.infinity,
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 1.5,
                    color: AppColors.dgrey,
                  ),
                  const Gap(10),
                  Text(
                    'Or Continue With',
                    style: getbody(color: AppColors.dgrey),
                  ),
                  const Gap(10),
                  Container(
                    width: 30,
                    height: 1.5,
                    color: AppColors.dgrey,
                  ),
                ],
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(AssetsImage.google),
                    ),
                  ),
                  const Gap(20),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xff4460A0),
                          borderRadius: BorderRadius.circular(10)),
                      child: Image.asset(AssetsImage.facebook),
                    ),
                  ),
                ],
              ),
              const Gap(15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: getbody(color: AppColors.dgrey),
                  ),
                  const Gap(10),
                  Column(
                    children: [
                      InkWell(
                          onTap: () {
                            navigateTowithReplacment(context, const UploadView());
                          },
                          child: Text(
                            'LOGIN',
                            style: getbody(color: AppColors.green),
                          )),
                      Container(
                        width: 47,
                        height: 1,
                        color: AppColors.green,
                      )
                    ],
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
