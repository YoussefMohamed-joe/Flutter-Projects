import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/home_view/home_view.dart';
import 'package:taskati/core/functions/error_message.dart';
import 'package:taskati/features/widgets/custom_button.dart';

String? path;
String name = '';

bool isLighTheme = AppLocalStorage.getcasUserhData('theme') ?? true;

class AccountChange extends StatefulWidget {
  const AccountChange({super.key});

  @override
  State<AccountChange> createState() => _AccountChange();
}

class _AccountChange extends State<AccountChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  
                  isLighTheme=!isLighTheme; 
                });
                AppLocalStorage.cashUserData('theme', isLighTheme);               
              },
              icon: isLighTheme
                  ? const Icon(Icons.dark_mode_outlined):const Icon(Icons.light_mode)
                   )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.file(
                        File(AppLocalStorage.getcasUserhData('path')),
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                            AssetsImage.user,
                            width: 50,
                            color: AppColors.violet,
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child: CircleAvatar(
                        
                        backgroundColor: isLighTheme?AppColors.white:AppColors.darkth,
                        child: Icon(
                        Icons.camera_alt,color: AppColors.violet,
                        ),),
                    )
                  ],
                ),
                const Gap(50),
                Divider(
                  height: 10,
                  color: AppColors.violet,
                  indent: 20,
                  endIndent: 20,
                ),
                const Gap(30),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: getSmallStyle(),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.violet)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.violet)),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.red)),
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.red)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
