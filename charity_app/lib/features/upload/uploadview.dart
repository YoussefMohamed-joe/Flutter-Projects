import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/features/widgets/custom_button.dart';
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
  bool isChecked=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
          child: Column(
        children: [
          const Gap(50),
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
          const Gap(30),
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
                      const Gap(10),
                      const CustomTextField(
                        label: 'Email',
                        prefix: Icons.email,
                      ),
                      const Gap(10),
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
                      const Gap(10),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.black),
                              ),
                              child: isChecked?SizedBox():Icon(Icons.done,color: AppColors.black,size: 18,),
                            ),
                          ),
                          const Gap(10),
                          Text('Remember me',style: getbody(color: AppColors.dgrey),),
                          const Spacer(),
                          InkWell(onTap: (){},child: Text('Forgot Password?',style: getbody(color: AppColors.dgrey),)),
                        ],
                      ),
                      const Gap(10),
                      CustomButton(text: 'LOG IN',onpressed: (){
                        //////////////
                      },height: 47,width: double.infinity, ),
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
                          Text('Or Continue With',style: getbody(color: AppColors.dgrey),),
                          const Gap(10),
                          Container(
                            width: 30,
                            height: 1.5,
                            color: AppColors.dgrey,
                          ),
                        ],
                      )
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
