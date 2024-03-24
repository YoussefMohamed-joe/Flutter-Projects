import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/home_view/home_view.dart';
import 'package:taskati/core/functions/error_message.dart';
import 'package:taskati/features/widgets/custom_button.dart';

String? path;
String name='';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.violet,
        actions: [
          TextButton(onPressed: (){
            if(path !=null && name.isNotEmpty){
              navigateTo(context, const HomeView());
            }else if (path !=null && name.isEmpty){
              scaffoldErrorMessage(context,'please Enter you name');
            }else if (path ==null && name.isNotEmpty){
              scaffoldErrorMessage(context,'Please Pick Your Picture');
            }else if (path ==null && name.isEmpty){
              scaffoldErrorMessage(context,'Please Pick Your Picture and Name');
            }
          }, child: Text('Done',style: getTitleStyle(color: AppColors.violet),))
        ],
      ),
      body:  Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 CircleAvatar(
                  radius: 70,
                  backgroundImage: (path != null) ? FileImage(File(path!)) as ImageProvider:AssetImage(AssetsImage.user),
                  backgroundColor: AppColors.violet,
                ),
                const Gap(15),
                 CustomButton(text: 'Upload from Camera',onpressed: () {
                  ImagePicker().pickImage(source: ImageSource.camera).then((value) {
                    if(value!= null){
                      setState(() {
                        path = value.path;
                      });
                    }
                  });
                },),
                const Gap(10),
                 CustomButton(text: 'Upload from Gallery',onpressed: (){
                  ImagePicker().pickImage(source: ImageSource.gallery).then((value) {
                    if(value!= null){
                      setState(() {
                        path = value.path;
                      });
                    }
                  });
                 },),
                const Gap(30),
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
                      name=value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    hintStyle: getSmallStyle(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.violet)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.violet)
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.red)
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: AppColors.red)
                    ),
            
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

