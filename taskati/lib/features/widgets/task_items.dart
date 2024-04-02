import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/add-task/model/task_model.dart';

class taskItem extends StatelessWidget {
  const taskItem({
    super.key, required this.model,
  });
  final TaskModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      
      decoration: BoxDecoration(
        color: model.isCompleted? AppColors.green : model.color == 0 ? AppColors.violet : (model.color == 1) ? AppColors.pink : AppColors.orange,
        borderRadius: BorderRadius.circular(15)
      ),
      margin: const EdgeInsets.only(top: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(model.title,style: getTitleStyle(color: AppColors.white),),
                const Gap(10),
                Row(children: [Icon(Icons.schedule,color: AppColors.white,),const Gap(5),Text('${model.startTime} : ${model.endTime}',style: getSmallStyle(color: AppColors.white),),],),
                const Gap(10),
                Text(model.note,style: getBodyStyle(color: AppColors.white),maxLines: 1,overflow: TextOverflow.ellipsis,),
                const Gap(10),
              ],
            ),
          ),
          const Spacer(),
          Container(
            height: 80,
            width: 0.5,
            color: AppColors.white,
          ),
          const Gap(5),
          RotatedBox(
            quarterTurns: 3,
            child: Text(model.isCompleted?'COMPLETED':'TODO',style: getTitleStyle(fontSize: 14,color: AppColors.white,))),
            const Gap(5),
        ],
      ),
    );
  }
}
