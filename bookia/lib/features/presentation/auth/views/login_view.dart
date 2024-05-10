import 'package:bookia/core/functions/routing.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/cutom_back_button.dart';
import 'package:bookia/features/presentation/auth/views/register_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool passVis = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const CutomArrowBack()
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('Welcome back! Glad to see you, Again!',style: getTitleStyle(fontSize: 30),),
                const Gap(30),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter Your Email adress',
                  ),
                
                ),
                const Gap(15),
                TextFormField(
                  decoration:  InputDecoration(
                    hintText: 'Enter Your Password',
                    suffixIcon: IconButton(onPressed: (){
                      setState(() {
                        passVis = !passVis;
                      });
                    }, icon: passVis ?  Icon(Icons.visibility_off,color: AppColors.grey,) :  Icon(Icons.visibility,color: AppColors.grey,)  ),
                  ),
                  obscureText: passVis,
                ),
                const Gap(15),
                Row(
                  children: [
                    const Spacer(),
                    Text('Forget Password?',style: getBodyStyle(color: AppColors.primary),),
                  ],
                ),
                const Gap(30),
                SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ElevatedButton(onPressed: (){
                      
                    }, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)
                      ),
                    ),
                    child: Text('Login',style: getBodyStyle(color: AppColors.white),)),
                  ),
                const Gap(35),
                Row(
                  children: [
                    Expanded(child: Divider(color: AppColors.grey,)),
                    const Gap(10),
                    Text('Or Login With',style: getBodyStyle(color: AppColors.grey),),
                    const Gap(10),
                    Expanded(child: Divider(color: AppColors.grey,)),
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
                          border: Border.all(color: AppColors.semiwhite)
                        ),
                        child: SvgPicture.asset('assets/icons/fb.svg',fit: BoxFit.none,),
                      ),
                    ),
                    const Gap(8),
                    Expanded(
                      child: Container(
                        height: 60,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.semiwhite)
                        ),
                        child: SvgPicture.asset('assets/icons/google.svg',fit: BoxFit.none,),
                      ),
                    ),
                    const Gap(8),
                    Expanded(
                      child: Container(
                        height: 60,
                        width: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.semiwhite)
                        ),
                        child: SvgPicture.asset('assets/icons/apple.svg',fit: BoxFit.none,),
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(26),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,children: [
          Text('Don\'t have an account?',style: getBodyStyle(),),
          InkWell(onTap: (){
            navigateTo(context, const RegisterView());
          },child: Text(' Register Now',style: getBodyStyle(color: AppColors.primary),)),
        ],),
      ),
    );
  }
}

