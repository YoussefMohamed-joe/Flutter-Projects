import 'package:bookia/core/utils/colors.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
            itemCount: 5,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.primary,
                      ),
                      child: Image.asset(
                        'assets/images/pic.png',
                        fit: BoxFit.fill,
                        width: double.infinity,
                        height: 150,
                      ),
                    ),
            options: CarouselOptions(
              height: 150,
              viewportFraction: 1,
              autoPlayInterval: const Duration(seconds: 2),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
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
        const Gap(15),
        SmoothPageIndicator(
          controller: PageController(initialPage: page), // PageController
          count: 5,
          effect: ExpandingDotsEffect(
              activeDotColor: AppColors.primary,
              expansionFactor: 4,
              dotColor: AppColors.grey,
              dotHeight: 7,
              dotWidth: 7),
        ),
      ],
    );
  }
}
