import 'package:bookia/core/functions/routing.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/cutom_back_button.dart';
import 'package:bookia/core/widgets/nav_bar_view.dart';
import 'package:bookia/features/auth/presentation/manager/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/manager/auth_states.dart';
import 'package:bookia/features/auth/presentation/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  bool passVis = true;
  var formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, title: const CutomArrowBack()),
      body: BlocListener<AuthCubit, AuthStates>(
        listener: (context, state) {
          if (state is RegisterErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
              ),
            );
          } else if (state is RegisterSuccessState) {
            AppLocalStorage.cashData(
                'token', state.postAuthResponse.data!.token);
            navigateAndRemoveUntil(context, const NavBar());
          } else if (state is RegisterLoadingState) {
            showDialog(
                context: context,
                builder: (context) => Center(
                        child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(AppColors.primary),
                    )));
          }
        },
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Text(
                      'Hello! Register to get started',
                      style: getTitleStyle(fontSize: 30),
                    ),
                    const Gap(30),
                    TextFormField(
                      controller: userNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Username',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Email',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        } else if (value != confirmPasswordController.text) {
                          return 'Passwords do not match';
                        }

                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                passVis = !passVis;
                              });
                            },
                            icon: passVis
                                ? Icon(
                                    Icons.visibility_off,
                                    color: AppColors.grey,
                                  )
                                : Icon(
                                    Icons.visibility,
                                    color: AppColors.grey,
                                  )),
                      ),
                      obscureText: passVis,
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: confirmPasswordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        } else if (value != passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Confirm Password',
                      ),
                      obscureText: passVis,
                    ),
                    const Gap(15),
                    Row(
                      children: [
                        const Spacer(),
                        Text(
                          'Forget Password?',
                          style: getBodyStyle(color: AppColors.primary),
                        ),
                      ],
                    ),
                    const Gap(30),
                    SizedBox(
                      height: 60,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthCubit>().register(
                                  name: userNameController.text,
                                  email: emailController.text,
                                  password: passwordController.text,
                                  passwordConfirmation:
                                      confirmPasswordController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            'Register',
                            style: getBodyStyle(color: AppColors.white),
                          )),
                    ),
                    const Gap(35),
                    Row(
                      children: [
                        Expanded(
                            child: Divider(
                          color: AppColors.grey,
                        )),
                        const Gap(10),
                        Text(
                          'Or Login With',
                          style: getBodyStyle(color: AppColors.grey),
                        ),
                        const Gap(10),
                        Expanded(
                            child: Divider(
                          color: AppColors.grey,
                        )),
                      ],
                    ),
                    const Gap(20),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.semiwhite)),
                            child: SvgPicture.asset(
                              'assets/icons/fb.svg',
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        const Gap(8),
                        Expanded(
                          child: Container(
                            height: 60,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.semiwhite)),
                            child: SvgPicture.asset(
                              'assets/icons/google.svg',
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        const Gap(8),
                        Expanded(
                          child: Container(
                            height: 60,
                            width: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: AppColors.semiwhite)),
                            child: SvgPicture.asset(
                              'assets/icons/apple.svg',
                              fit: BoxFit.none,
                            ),
                          ),
                        ),
                        const Gap(8),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Already have an account?',
              style: getBodyStyle(),
            ),
            InkWell(
                onTap: () {
                  navigateTo(context, const LoginView());
                },
                child: Text(
                  ' Login Now',
                  style: getBodyStyle(color: AppColors.primary),
                )),
          ],
        ),
      ),
    );
  }
}
