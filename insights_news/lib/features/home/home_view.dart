import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:insights_news/core/services/local_storage.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:insights_news/core/utils/text_styles.dart';
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
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              Row(children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Image.asset(
                        'assets/rodri.png',
                        height: 200,
                      ),
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 0.75,
                    autoPlayInterval: const Duration(seconds: 2),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      setState(() {
                        page = index;
                      });
                    },
                    autoPlay: true,
                    scrollDirection: Axis.horizontal,
                  )),
              SmoothPageIndicator(
                controller: PageController(initialPage: page), // PageController
                count: 5,
                effect: ScrollingDotsEffect(
                  activeDotColor: Appcolors.green,
                  dotColor: Colors.grey,
                  dotHeight: 10,
                  dotWidth: 10
                ), // your preferred effect
              )
            ]),
          ),
        ),
      ),
    );
  }
}
