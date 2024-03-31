import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.violet,
        centerTitle: true,
        title: Text('Add Task',style: getTitleStyle(color: AppColors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Title',style: getTitleStyle(color: AppColors.black),),
            const Gap(5),
            TextField(
              onChanged: (value){

              },
              decoration: const InputDecoration(
                    hintText: 'Enter Title Here',
                  ),
                  
            ),
            const Gap(10),
            Text('Note',style: getTitleStyle(color: AppColors.black),),
            const Gap(5),
            TextField(
              onChanged: (value){

              },
              maxLines: 3,
              decoration: const InputDecoration(
                    hintText: 'Enter Note Here',
                  ),
                  
            ),
            const Gap(10),
            Text('Date',style: getTitleStyle(color: AppColors.black),),
            const Gap(5),
            TextField(
              onChanged: (value){

              },
              onTap: (){

              },
              readOnly: true,
              decoration: InputDecoration(
                    hintText: 'Enter Title Here',
                    suffixIcon: Icon(Icons.calendar_month_outlined,color: AppColors.violet,)
                  ),
                  
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(child: Text('Start Time',style: getTitleStyle(color: AppColors.black),)),
                Expanded(child: Text('End Time',style: getTitleStyle(color: AppColors.black),))
              ],
            ),
            const Gap(5),
            Row(
              children: [
                Expanded(
                  child: TextField(
                                onChanged: (value){
                  
                                },
                                onTap: (){
                  
                                },
                                readOnly: true,
                                decoration: InputDecoration(
                      hintText: 'Enter Title Here',
                      suffixIcon: Icon(Icons.schedule,color: AppColors.violet,)
                    ),
                    
                              ),
                ),
                const Gap(10),
            Expanded(
              child: TextField(
                onChanged: (value){
              
                },
                onTap: (){
              
                },
                readOnly: true,
                decoration: InputDecoration(
                      hintText: 'Enter Title Here',
                      suffixIcon: Icon(Icons.schedule,color: AppColors.violet,)
                    ),
                    
              ),
            ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}