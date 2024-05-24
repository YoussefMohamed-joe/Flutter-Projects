import 'package:bookia/core/functions/email_validation.dart';
import 'package:bookia/core/functions/routing.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/cutom_back_button.dart';
import 'package:bookia/core/widgets/nav_bar_view.dart';
import 'package:bookia/features/auth/presentation/manager/auth_cubit.dart';
import 'package:bookia/features/auth/presentation/manager/auth_states.dart';
import 'package:bookia/features/auth/presentation/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool passVis = true;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false, title: const CutomArrowBack()),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: BlocListener<AuthCubit, AuthStates>(
            listener: (context, state) {
              if (state is LoginErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(state.error),
                  ),
                );
              } else if (state is LoginSuccessState) {
                AppLocalStorage.cashData(
                    'token', state.postAuthResponse.data!.token);
                navigateToWithReplacment(context, const NavBar());
              } else if (state is LoginLoadingState) {
                showDialog(
                    context: context,
                    builder: (context) => Center(
                            child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(AppColors.primary),
                        )));
              }
            },
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Text(
                      'Welcome back! Glad to see you, Again!',
                      style: getTitleStyle(fontSize: 30),
                    ),
                    const Gap(30),
                    TextFormField(
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Email';
                        } else if (emailValidate(emailController.text) ==
                            false) {
                          return 'Please Enter Valid Email';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter Your Email adress',
                      ),
                    ),
                    const Gap(15),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Password';
                        } else if (value.length < 8) {
                          return 'Password must be at least 8 characters';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        hintText: 'Enter Your Password',
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
                              context.read<AuthCubit>().login(
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          child: Text(
                            'Login',
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
              'Don\'t have an account?',
              style: getBodyStyle(),
            ),
            InkWell(
                onTap: () {
                  navigateTo(context, const RegisterView());
                },
                child: Text(
                  ' Register Now',
                  style: getBodyStyle(color: AppColors.primary),
                )),
          ],
        ),
      ),
    );
  }
}
