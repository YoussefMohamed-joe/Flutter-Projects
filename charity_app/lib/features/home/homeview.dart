import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<String> items = [
  'Cairo',
  'Helwan',
  'Giza',
  'Alexandria',
];
String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.boneWhite,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Gap(40),
              Text('إحسان',style: getehsan(color: AppColors.black)),
              const Gap(20),
              Row(
                children: [
                  SvgPicture.asset('assets/location.svg',width: 25,height: 25,colorFilter:
                              ColorFilter.mode(AppColors.green, BlendMode.srcIn)),
                  const Gap(10),
                  DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Cairo',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: items
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ))
              .toList(),
          value: selectedValue,
          onChanged: (String? value) {
            setState(() {
              selectedValue = value;
            });
          },
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.keyboard_arrow_down,
            ),
            iconSize: 25,
            iconEnabledColor: Colors.green,
          ),
           dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              color: AppColors.boneWhite,
            ),),
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 115,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
      const Spacer(),
      
              ],)
            ],
          ),
        )
      ),
    );
  }
}