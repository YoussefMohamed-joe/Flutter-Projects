
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/add-task/model/task_model.dart';
import 'package:taskati/features/home_view/account_change.dart';
import 'package:taskati/features/home_view/home_view.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  int selectedcolor = 0;
  String date = DateFormat('dd/MM/yyyy').format(DateTime.now());
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a').format(DateTime.now().add(const Duration(minutes: 15)));
  var titleController = TextEditingController();
  var noteController = TextEditingController();
  String note='';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('Add Task',style: getTitleStyle(context,color: AppColors.white),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Title',style: getTitleStyle(context),),
              const Gap(5),
              TextField(
                controller: titleController,
                decoration: const InputDecoration(
                      hintText: 'Enter Title Here',
                    ),
                    
              ),
              const Gap(10),
              Text('Note',style: getTitleStyle(context,),),
              const Gap(5),
              TextField(
                controller: noteController,
                maxLines: 3,
                decoration: const InputDecoration(
                      hintText: 'Enter Note Here',
                    ),
                    
              ),
              const Gap(10),
              Text('Date',style: getTitleStyle(context,),),
              const Gap(5),
              TextField(
                onTap: (){
                  showDatePicker(context: context, 
                  firstDate: DateTime.now(), 
                  lastDate: DateTime.now().add(const Duration(days: 365))).then((value) {
                    if(value != null){
                    setState(() {
                      date = DateFormat('dd/MM/yyyy').format(value);
                    });
                    
                  } });
                },
                readOnly: true,
                decoration: InputDecoration(
                      hintText: date,
                      suffixIcon: Icon(Icons.calendar_month_outlined,color: AppColors.violet,)
                    ),
                    
              ),
              const Gap(10),
              Row(
                children: [
                  Expanded(child: Text('Start Time',style: getTitleStyle(context),)),
                  Expanded(child: Text('End Time',style: getTitleStyle(context,),))
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
                                    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                                      if(value != null){
                                        setState(() {
                                          startTime=value.format(context);
                                          endTime = value.replacing(minute: value.minute + 15).format(context);
                                        });
                                      }
                                    });
                                  },
                                  readOnly: true,
                                  decoration: InputDecoration(
                        hintText: startTime,
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
                    showTimePicker(context: context, initialTime: TimeOfDay.now()).then((value) {
                                      if(value != null){
                                        setState(() {
                                          endTime=value.format(context);
                                        });
                                      }
                                    });
                  },
                  readOnly: true,
                  decoration: InputDecoration(
                        hintText: endTime,
                        suffixIcon: Icon(Icons.schedule,color: AppColors.violet,)
                      ),
                      
                ),
              ),
                ],
              ),
              const Gap(10),
              Row(children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Colors',style: getTitleStyle(context,),),
                    const Gap(5),
                    Row(children: List.generate(3, (index) {
                      return Padding(
                        padding: const EdgeInsets.all(3),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              selectedcolor = index;
                            });
                          },
                          child: CircleAvatar(
                            radius: 18,
                            backgroundColor: index == 0? AppColors.violet : (index == 1)? AppColors.pink : AppColors.orange,
                            child: selectedcolor == index ? Icon(Icons.check,color: AppColors.white,):const SizedBox(),
                          ),
                        ),
                      );
                    })
                    ,)
                    
                  ],
                ),
                const Spacer(),
                InkWell(
            onTap: (){
              String id = DateTime.now().toIso8601String();
              AppLocalStorage.cashTaskData(
                id,
                TaskModel(
                  id: id,
                  title: titleController.text,
                  note: noteController.text,
                  date: date,
                  startTime: startTime,
                  endTime: endTime,
                  color: selectedcolor,
                  isCompleted: false, 
                )
              );
              navigateToPop(context);
            },
            child: Container(
            width: 110,
            height: 55,
            
            decoration: BoxDecoration(
              color: AppColors.violet,
              borderRadius: BorderRadius.circular(15)
            ),
            child: Center(child: Text('Create Task',style: getBodyStyle(context,color: AppColors.white),)),
            ),
          )
              ],),
              
            ],
          ),
        ),
      ),
    );
  }
}