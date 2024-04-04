import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/add-task/model/task_model.dart';
import 'package:taskati/features/widgets/home_header.dart';
import 'package:taskati/features/widgets/task_items.dart';
import 'package:taskati/features/widgets/time_task.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const HomeHeader(),
              const Gap(10),
              const TimeTask(),
              const Gap(10),
              DatePicker(
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColors.violet,
                selectedTextColor: Colors.white,
                
                dateTextStyle: getBodyStyle(context,fontSize: 22),
                dayTextStyle: getBodyStyle(context,fontSize: 12),
                monthTextStyle: getBodyStyle(context,fontSize: 12),
                width: 80,
                height: 100,
                onDateChange: (date) {
                  setState(() {
                    selectedDate = DateFormat('dd/MM/yyyy').format(date);
                  });
                },
              ),
              Expanded(
                  child: ValueListenableBuilder<Box<TaskModel>>(
                      valueListenable:
                          Hive.box<TaskModel>('taskBox').listenable(),
                      builder:
                          (BuildContext context, dynamic value, Widget? child) {
                        List<TaskModel> task = value.values
                            .where((element) => element.date == selectedDate)
                            .toList();
                        return task.isEmpty
                            ? Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Column(
                                  children: [
                                    const Gap(15),
                                    Lottie.asset(AssetsImage.noTask),
                                    const Gap(15),
                                    Text(
                                      'No Tasks Found!',
                                      style:
                                          getBodyStyle(context),
                                    )
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemBuilder: (BuildContext context, int index) {
                                  return Dismissible(
                                      onDismissed: (direction) {
                                        if (direction ==
                                            DismissDirection.startToEnd) {                                          
                                          value.put(
                                              task[index].id,
                                              TaskModel(
                                                  id: task[index].id,
                                                  title: task[index].title,
                                                  note: task[index].note,
                                                  date: task[index].date,
                                                  startTime: task[index].startTime,
                                                  endTime: task[index].endTime,
                                                  color: task[index].color,
                                                  isCompleted: true));
                                        } else {
                                          value.delete(task[index].id);
                                        }
                                      },
                                      key: UniqueKey(),
                                      background: Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: AppColors.green,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          children: [
                                            const Gap(10),
                                            Icon(
                                              Icons.check,
                                              color: AppColors.white,
                                            ),
                                            const Gap(5),
                                            Text('Complete',
                                                style: getBodyStyle(context,
                                                    color: AppColors.white)),
                                          ],
                                        ),
                                      ),
                                      secondaryBackground: Container(
                                        margin: const EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: AppColors.red,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Icon(
                                              Icons.delete,
                                              color: AppColors.white,
                                            ),
                                            const Gap(5),
                                            Text('delete',
                                                style: getBodyStyle(context,
                                                    color: AppColors.white)),
                                            const Gap(10),
                                          ],
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 5),
                                        child: taskItem(
                                          model: task[index],
                                        ),
                                      ));
                                },
                                itemCount: task.length,
                              );
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
