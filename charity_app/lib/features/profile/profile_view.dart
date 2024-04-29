import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.green,
      body: Center(
        child: Text('إحسان',style: getehsan()),
      ),
    );
  }
}