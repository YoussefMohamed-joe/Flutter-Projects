import 'package:charity_app/core/constants/assets_images.dart';
import 'package:charity_app/core/functions/email_validation.dart';
import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/services/local_storage.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/core/widgets/nav_bar_view.dart';
import 'package:charity_app/features/presentaion/manager/User/user_cubit.dart';
import 'package:charity_app/features/presentaion/manager/User/user_state.dart';
import 'package:charity_app/features/presentaion/views/upload/signup_view.dart';
import 'package:charity_app/features/presentaion/widgets/custom_button.dart';
import 'package:charity_app/features/presentaion/widgets/custon_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool passvis = true;
  bool isChecked = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogCubit, LogStates>(listener: (context, state) {
      if (state is LogSuccessState) {
        navigateToPop(context);
        AppLocalStorage.cashData('login', isChecked ? false : true);
        navigateTowithReplacment(context, const NavBar(index: 0,));
      } else if (state is LogErrorState) {
        navigateToPop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            state.error,
            style: getbody(color: AppColors.white),
          ),
          backgroundColor: AppColors.green,
        ));
      } else if (state is LogLoadingState) {
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Center(
                  child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppColors.green),
              ));
            });
      }
    }, builder: (context, state) {
      return Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: AppColors.green,
          body: Center(
              child: Column(
            children: [
              const Gap(40),
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
                    style:
                        getheadline(fontSize: 36, color: AppColors.semigreen),
                  ),
                ],
              ),
              const Gap(25),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: AppColors.boneWhite,
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35))),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
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
                          CustomTextField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Email';
                              } else if (!emailValidate(emailController.text)) {
                                return 'Please Enter A Valid Email';
                              }
                              return null;
                            },
                            controller: emailController,
                            label: 'Email',
                            prefix: Icons.email,
                          ),
                          const Gap(10),
                          CustomTextField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter Your Password';
                              } else if (passwordController.text.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              return null;
                            },
                            controller: passwordController,
                            label: 'Password',
                            obsecure: passvis,
                            prefix: Icons.lock,
                            suffix: passvis
                                ? Icons.visibility_off
                                : Icons.visibility,
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
                                  child: isChecked
                                      ? const SizedBox()
                                      : Icon(
                                          Icons.done,
                                          color: AppColors.black,
                                          size: 18,
                                        ),
                                ),
                              ),
                              const Gap(10),
                              Text(
                                'Remember me',
                                style: getbody(color: AppColors.dgrey),
                              ),
                              const Spacer(),
                              InkWell(
                                  onTap: () {},
                                  child: Text(
                                    'Forgot Password?',
                                    style: getbody(color: AppColors.dgrey),
                                  )),
                            ],
                          ),
                          const Gap(10),
                          CustomButton(
                            text: 'LOG IN',
                            onpressed: () {
                              if (formKey.currentState!.validate()) {
                                context.read<LogCubit>().postLogin(
                                    emailController.text,
                                    passwordController.text);
                              }
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
                            children: [
                              const Gap(90),
                              Text(
                                'New User?',
                                style: getbody(color: AppColors.dgrey),
                              ),
                              const Gap(10),
                              InkWell(
                                  onTap: () {
                                    navigateTo(
                                        context, const SignupView());
                                  },
                                  child: Text(
                                    'Create Account',
                                    style: getbody(
                                        color: AppColors.green,
                                        decoration: true),
                                  ))
                            ],
                          ),
                          const Gap(10),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     Text(
                          //       'Open as a',
                          //       style: getbody(color: AppColors.dgrey),
                          //     ),
                          //     const Gap(10),
                          //     InkWell(
                          //         onTap: () {
                          //           navigateTowithReplacment(
                          //               context, const SignupView());
                          //         },
                          //         child: Text(
                          //           'Guest',
                          //           style: getbody(
                          //               color: AppColors.green,
                          //               decoration: true),
                          //         ))
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
        ),
      );
    });
  }
}