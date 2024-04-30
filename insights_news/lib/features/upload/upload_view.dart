import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news/core/functions/routing.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_styles.dart';
import 'package:insights_news/core/widgets/custom_button.dart';
import 'package:insights_news/core/widgets/error_message.dart';
import 'package:insights_news/features/home/home_view.dart';

String? path;
String name = '';
bool registerd = false;

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
        backgroundColor: Appcolors.blackbg,
        actions: [
          TextButton(
              onPressed: () {
                if (path != null && name.isNotEmpty) {
                  registerd = true;
                  AppLocalStorage.cashData('name', name);
                  AppLocalStorage.cashData('path', path);
                  AppLocalStorage.cashData('Reg', registerd);
                  navigateToWithReplacment(context, const HomeView());
                } else if (path != null && name.isEmpty) {
                  scaffoldErrorMessage(context, 'please Enter you name');
                } else if (path == null && name.isNotEmpty) {
                  scaffoldErrorMessage(context, 'Please Pick Your Picture');
                } else if (path == null && name.isEmpty) {
                  scaffoldErrorMessage(
                      context, 'Please Pick Your Picture and Name');
                }
              },
              child: Text(
                'Done',
                style: getTitleStyle(color: Appcolors.green),
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: (path != null)
                      ? FileImage(File(path!)) as ImageProvider
                      : AssetImage('assets/user.png'),
                  backgroundColor: Appcolors.blackbg,
                ),
                const Gap(15),
                CustomButton(
                  text: 'Upload from Camera',
                  onpressed: () {
                    ImagePicker()
                        .pickImage(source: ImageSource.camera)
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          path = value.path;
                        });
                      }
                    });
                  },
                ),
                const Gap(10),
                CustomButton(
                  text: 'Upload from Gallery',
                  onpressed: () {
                    ImagePicker()
                        .pickImage(source: ImageSource.gallery)
                        .then((value) {
                      if (value != null) {
                        setState(() {
                          path = value.path;
                        });
                      }
                    });
                  },
                ),
                const Gap(30),
                Divider(
                  height: 10,
                  color: Appcolors.green,
                ),
                const Gap(30),
                TextFormField(
                    style: getBodyStyle(),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Appcolors.grey,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Appcolors.green,
                        ),
                        hintText: 'Enter your name',
                        hintStyle: getBodyStyle(color: Appcolors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(15),
                        ))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
