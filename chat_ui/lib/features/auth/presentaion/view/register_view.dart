import 'package:chat_ui/core/colors.dart';
import 'package:chat_ui/core/text_styles.dart';
import 'package:chat_ui/features/auth/presentaion/view/login_view.dart';
import 'package:chat_ui/features/auth/presentaion/widgets/custon_textfield.dart';
import 'package:chat_ui/features/chat/presentaion/view/home_view.dart';
import 'package:flutter/material.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterView();
}

class _RegisterView extends State<RegisterView> {
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
                  backgroundImage: NetworkImage('https://img.freepik.com/premium-vector/chat-app-logo-design-template-can-be-used-icon-chat-application-logo_605910-1724.jpg'),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Create an account',
                  style: getSignTextStyle(),
                ),
                const SizedBox(
                  height: 10,
                ),
                 CustomTextField(label: 'Name',prefix: Icons.person,),
                const SizedBox(
                  height: 10,
                ),
                 CustomTextField(label: 'Email',prefix: Icons.email,),
                const SizedBox(
                  height: 10,
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
                    onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const HomeView(),));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lb2,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                    ), 
                    child: Text('Register',style: getTextStyle(),)),
                ),
                const SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('if you have an account',style: getSmallTextStyle(),),
                    TextButton(onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginView(),));
                    }, 
                    child: Text('login now',style: getSmallTextStyle(color: AppColors.lb),))
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

