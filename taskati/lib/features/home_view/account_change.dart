import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/home_view/home_view.dart';
import 'package:taskati/core/functions/error_message.dart';
import 'package:taskati/features/widgets/custom_button.dart';

bool isLighTheme = AppLocalStorage.getcasUserhData('theme') ?? true;
String updateName = '';

class AccountChange extends StatefulWidget {
  const AccountChange({super.key});

  @override
  State<AccountChange> createState() => _AccountChange();
}

class _AccountChange extends State<AccountChange> {
  @override
  var keyForm= GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  isLighTheme = !isLighTheme;
                });
                AppLocalStorage.cashUserData('theme', isLighTheme);
              },
              icon: isLighTheme
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: ValueListenableBuilder(
            valueListenable: Hive.box('UserBox').listenable(),
            builder: (BuildContext context, dynamic box, Widget? child) {
              var name = box.get('name');
              var image = box.get('path');
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(360),
                        child: Image.file(
                          File(image),
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
                          showModalBottomSheet(context: context, builder: (context){
                            return Container(
                              decoration: BoxDecoration(
                                color: isLighTheme? AppColors.white : AppColors.darkth,
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                              ),
                              
                              height: 200,
                              width: double.infinity,
                              child: Column(
                                children: [
                                  const Gap(30),
                                  CustomButton(text: 'Upload from Camera',width: 330,onpressed: (){
                                    ImagePicker().pickImage(source: ImageSource.camera).then((value) {
                                      if(value!= null){
                                        
                                        AppLocalStorage.cashUserData('path', value.path);
                                        navigateToPop(context);
                                      }
                                      
                                    });
                                  }),
                                  const Gap(20),
                                  CustomButton(text: 'Upload from Gallery',width: 330,onpressed: (){
                                    ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
                                      if(value!= null){
                                        
                                        AppLocalStorage.cashUserData('path', value.path);
                                        navigateToPop(context);
                                      }
                                    });
                                  })
                                ],
                              )
                            );
                          });
                        },
                        child: CircleAvatar(
                          backgroundColor:
                              isLighTheme ? AppColors.white : AppColors.darkth,
                          child: Icon(
                            Icons.camera_alt,
                            color: AppColors.violet,
                          ),
                        ),
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
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Row(
                      children: [
                        Text(
                          name,
                          style: getTitleStyle(context, color: AppColors.violet),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            showModalBottomSheet(context: context,isScrollControlled:  true,builder: (context){
                              return Padding(
                                padding: MediaQuery.of(context).viewInsets,
                                child: Form(
                                  key: keyForm,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: isLighTheme? AppColors.white : AppColors.darkth,
                                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                                    ),
                                    
                                    height: 200,
                                    width: double.infinity,
                                    child: Column(
                                      children: [
                                        const Gap(20),
                                        SizedBox(width: 330,child: TextFormField(style: getTitleStyle(context,color: AppColors.violet),initialValue: name,validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'Enter Name';
                                          }
                                          return null;
                                        },onChanged: (value) {
                                          updateName=value;
                                        },)),
                                        const Gap(20),
                                        CustomButton(text: 'Update Name',width: 330,onpressed: (){
                                          if (keyForm.currentState!.validate()) {
                                            AppLocalStorage.cashUserData('name', updateName);
                                            navigateToPop(context);
                                          }
                                        }),
                                      ],
                                    )
                                  ),
                                ),
                              );
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(color: AppColors.violet),
                              ),
                              child: Icon(
                            Icons.edit,
                            color: AppColors.violet,
                          )),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
