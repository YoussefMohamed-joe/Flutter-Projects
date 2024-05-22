import 'package:charity_app/core/constants/assets_images.dart';
import 'package:charity_app/core/functions/email_validation.dart';
import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/services/local_storage.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/core/widgets/nav_bar_view.dart';
import 'package:charity_app/features/presentaion/manager/User/user_cubit.dart';
import 'package:charity_app/features/presentaion/manager/User/user_state.dart';
import 'package:charity_app/features/presentaion/views/upload/login_view.dart';
import 'package:charity_app/features/presentaion/widgets/custom_button.dart';
import 'package:charity_app/features/presentaion/widgets/custon_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool passvis = true;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterModelCubit, RegStates>(
        listener: (context, state) {
      if (state is RegSuccessState) {
        navigateToPop(context);
        AppLocalStorage.cashData('login', true);
        navigateTowithReplacment(context, const NavBar());
      } else if (state is RegErrorState) {
        navigateToPop(context);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
            state.error,
            style: getbody(color: AppColors.white),
          ),
          backgroundColor: AppColors.green,
        ));
      } else if (state is RegLoadingState) {
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
      return Scaffold(
        backgroundColor: AppColors.boneWhite,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(children: [
                  const Gap(20),
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
                  const Gap(10),
                  CustomTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please Enter Your Name';
                      }
                      return null;
                    },
                    controller: nameController,
                    label: 'UserName',
                    prefix: Icons.person,
                  ),
                  const Gap(10),
                  Row(
                    children: [
                      Container(
                        width: 63,
                        height: 64,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text('+20',
                              style: getheadline(color: AppColors.grey)),
                        ),
                      ),
                      const Gap(5),
                      SizedBox(
                        width: 300,
                        child: CustomTextField(
                          validator: (p0) {
                            if (p0!.isEmpty) {
                              return 'Please Enter Your Phone Number';
                            } else if (phoneNumberController.text.length !=
                                10) {
                              return 'Invalid Phone Number';
                            }
                            return null;
                          },
                          controller: phoneNumberController,
                          label: 'Phone Number',
                          prefix: Icons.phone,
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  CustomTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please Enter Your Email';
                      } else if (!emailValidate(emailController.text)) {
                        return 'Please Enter a Valid Email';
                      }
                      return null;
                    },
                    controller: emailController,
                    label: 'Email',
                    prefix: Icons.email,
                  ),
                  const Gap(10),
                  CustomTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please Enter Your Password';
                      } else if (passwordController.text.length < 8) {
                        return 'Password Must Be At Least 8 Characters';
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        return 'Password Does Not Match';
                      }
                      return null;
                    },
                    controller: passwordController,
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
                  CustomTextField(
                    validator: (p0) {
                      if (p0!.isEmpty) {
                        return 'Please Enter Your Password';
                      } else if (passwordController.text.length < 8) {
                        return 'Password Must Be At Least 8 Characters';
                      } else if (passwordController.text !=
                          confirmPasswordController.text) {
                        return 'Password Does Not Match';
                      }
                      return null;
                    },
                    controller: confirmPasswordController,
                    label: 'Confirm Password',
                    obsecure: passvis,
                    prefix: Icons.lock,
                  ),
                  const Gap(30),
                  CustomButton(
                    text: 'SIGN UP',
                    onpressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<RegisterModelCubit>().postSignUp(
                            emailController.text,
                            passwordController.text,
                            nameController.text,
                            '+20${phoneNumberController.text}',
                            confirmPasswordController.text);
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
                                navigateTowithReplacment(
                                    context, const LoginView());
                              },
                              child: Text(
                                'LOGIN',
                                style: getbody(
                                    color: AppColors.green, decoration: true),
                              )),
                        ],
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ),
      );
    });
  }
}
