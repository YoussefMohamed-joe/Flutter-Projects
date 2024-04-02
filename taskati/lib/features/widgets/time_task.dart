import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/add-task/views/add_task.dart';

class TimeTask extends StatelessWidget {
  const TimeTask({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat.yMMMEd().format(DateTime.now()),style: getTitleStyle(fontSize: 20,color: AppColors.black),),
            const Gap(3),
            Text('Today',style: getTitleStyle(fontSize: 20,color: AppColors.black),)
          ],
        ),
        const Spacer(),
        InkWell(
          onTap: (){
            navigateTo(context, const AddTask());
          },
          child: Container(
          width: 110,
          height: 55,
          
          decoration: BoxDecoration(
            color: AppColors.violet,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Center(child: Text('+ Add Task',style: getBodyStyle(color: AppColors.white),)),
          ),
        )
      ],
    );
  }
}