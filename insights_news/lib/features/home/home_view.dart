import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_styles.dart';
import 'package:insights_news/core/widgets/slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(children: [
                Row(children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Hello, ${AppLocalStorage.getData('name')}',
                          style: getTitleStyle(color: Appcolors.white),
                        ),
                        Text(
                          'Have a nice day',
                          style: getBodyStyle(color: Appcolors.grey),
                        ),
                      ]),
                  const Spacer(),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(360),
                      child: Image.file(File(AppLocalStorage.getData('path')),
                          width: 60, height: 60, fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/user.png');
                      })),
                ]),
                const Gap(10),
                const SliderView(),
                TabBar(
                    onTap: (value) {
                      setState(() {
                        page = value;
                      });
                    },
                    labelPadding: const EdgeInsets.symmetric(horizontal: 6),
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    dividerColor: Colors.transparent,
                    indicatorColor: Appcolors.green,
                    labelColor: Appcolors.green,
                    unselectedLabelColor: Appcolors.white,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Appcolors.blackbg),
                    tabs: [
                      Tab(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  page == 0 ? Appcolors.green : Appcolors.grey),
                          child: Text(
                            'Science',
                            style: getBodyStyle(
                                color: page == 0
                                    ? Appcolors.blackbg
                                    : Appcolors.white),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  page == 1 ? Appcolors.green : Appcolors.grey),
                          child: Text(
                            'Entertainment',
                            style: getBodyStyle(
                                color: page == 1
                                    ? Appcolors.blackbg
                                    : Appcolors.white),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  page == 2 ? Appcolors.green : Appcolors.grey),
                          child: Text(
                            'Sports',
                            style: getBodyStyle(
                                color: page == 2
                                    ? Appcolors.blackbg
                                    : Appcolors.white),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  page == 3 ? Appcolors.green : Appcolors.grey),
                          child: Text(
                            'Business',
                            style: getBodyStyle(
                                color: page == 3
                                    ? Appcolors.blackbg
                                    : Appcolors.white),
                          ),
                        ),
                      ),
                    ])
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
