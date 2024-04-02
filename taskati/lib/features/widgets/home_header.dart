import 'dart:io';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/home_view/account_change.dart';

import '../../core/utils/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Hello, ${AppLocalStorage.getcasUserhData('name')}',style: getTitleStyle(fontSize: 22,color: AppColors.violet),),
            const Gap(3),
            Text('Have A Nice Day',style: getBodyStyle(),)
          ],
        ),
        const Spacer(),
        
        InkWell(
          onTap: (){
            navigateTo(context, const AccountChange());
          },
          child:  ClipRRect(
           borderRadius: BorderRadius.circular(360),
           child: Image.file(
              File(AppLocalStorage.getcasUserhData('path')),
             width: 60,
             height: 60,
             fit: BoxFit.cover,
             
             
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(AssetsImage.user,width: 50,color: AppColors.violet,);
              },
           ),
         )
        )
      ],
    );
  }
}