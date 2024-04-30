import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:insights_news/core/utils/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderView extends StatefulWidget {
  const SliderView({super.key});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  int page = 0;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider.builder(
          itemCount: 5,
          itemBuilder:
              (BuildContext context, int itemIndex, int pageViewIndex) =>
                  Image.asset(
                    'assets/rodri.png',
                    height: 200,
                  ),
          options: CarouselOptions(
            height: 200,
            viewportFraction: 0.75,
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
      SmoothPageIndicator(
        controller: PageController(initialPage: page), // PageController
        count: 5,
        effect: ScrollingDotsEffect(
            activeDotColor: Appcolors.green,
            dotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 10), // your preferred effect
      ),
    ]);
  }
}
