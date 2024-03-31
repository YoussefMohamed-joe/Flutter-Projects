import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:taskati/core/constants/assets_images.dart';
import 'package:taskati/core/services/local_storage.dart';
import 'package:taskati/core/utils/colors.dart';
import 'package:taskati/core/utils/text_styles.dart';
import 'package:taskati/features/widgets/custom_button.dart';
import 'package:taskati/features/widgets/home_header.dart';
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
                child: ListView.builder(
                  itemBuilder: (BuildContext context,int index) {
                    return Container(
                      width: double.infinity,
                      
                      decoration: BoxDecoration(
                        color: AppColors.violet,
                        borderRadius: BorderRadius.circular(15)
                      ),
                      margin: const EdgeInsets.only(top: 10),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Text('Flutter Task - 1',style: getTitleStyle(color: AppColors.white),),
                                const Gap(10),
                                Row(children: [Icon(Icons.schedule,color: AppColors.white,),const Gap(5),Text('10 Pm : 12 Am',style: getSmallStyle(color: AppColors.white),),],),
                                const Gap(10),
                                Text('I will do this task',style: getBodyStyle(color: AppColors.white),),
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
                            child: Text('TODO',style: getTitleStyle(fontSize: 14,color: AppColors.white,))),
                            const Gap(5),
                        ],
                      ),
                    );
                  },
                  itemCount: 3,
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
