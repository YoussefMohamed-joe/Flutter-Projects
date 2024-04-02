import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/add-task/model/task_model.dart';
import 'package:taskati/features/widgets/custom_button.dart';
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
                width: 80,
                height: 100,
              ),
              Expanded(
                child: ValueListenableBuilder<Box<TaskModel>>(
                valueListenable: Hive.box<TaskModel>('taskBox').listenable(), 
                builder: (BuildContext context,dynamic value,Widget? child) {
                  List<TaskModel> task = value.values.toList();
                  return ListView.builder(
                  itemBuilder: (BuildContext context,int index) {
                    return  taskItem(model: task[index],);
                  },
                  itemCount: task.length,
                  );
                })
              )
            ],
          ),
        ),
      ),
    );
  }
}

