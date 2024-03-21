import 'package:chat_ui/core/colors.dart';
import 'package:chat_ui/core/text_styles.dart';
import 'package:chat_ui/features/auth/presentaion/view/register_view.dart';
import 'package:chat_ui/features/auth/presentaion/widgets/custon_textfield.dart';
import 'package:chat_ui/features/chat/presentaion/view/home_view.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  bool passvis = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(
                      'https://img.freepik.com/premium-vector/chat-app-logo-design-template-can-be-used-icon-chat-application-logo_605910-1724.jpg'),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  'Login to your account',
                  style: getSignTextStyle(),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomTextField(
                  label: 'Email',
                  prefix: Icons.email,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  label: 'Password',
                  obsecure: passvis,
                  prefix: Icons.lock,
                  suffix: passvis ? Icons.visibility_off:Icons.visibility,
                  suffixOnPress: () {
                    setState(() {
                      passvis = !passvis;
                    });
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => const HomeView(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lb2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: Text(
                        'Login',
                        style: getTextStyle(),
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'if you don\'t have an account',
                      style: getSmallTextStyle(),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => const RegisterView(),
                          ));
                        },
                        child: Text(
                          'Create one!',
                          style: getSmallTextStyle(color: AppColors.lb),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
