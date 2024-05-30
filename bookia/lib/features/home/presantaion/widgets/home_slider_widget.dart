import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/features/home/presantaion/manager/home_cubit.dart';
import 'package:bookia/features/home/presantaion/manager/home_states.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  void initState() {
    context.read<HomeCubit>().getSliders();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, state) =>
          state is GetSlidersSuccess || state is GetSlidersError,
      builder: (context, state) {
        if (state is GetSlidersSuccess) {
          return Column(
            children: [
              CarouselSlider.builder(
                  itemCount: state.getSlidersResponse.data!.sliders!.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: AppColors.primary,
                        ),
                        child: Image.network(
                          state.getSlidersResponse.data!.sliders![itemIndex]
                              .image!,
                          fit: BoxFit.fill,
                          width: double.infinity,
                          height: 150,
                        ),
                      ),
                  options: CarouselOptions(
                    height: 150,
                    viewportFraction: 1,
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
              const Gap(15),
              SmoothPageIndicator(
                controller: PageController(initialPage: page), // PageController
                count: state.getSlidersResponse.data!.sliders!.length,
                effect: ExpandingDotsEffect(
                    activeDotColor: AppColors.primary,
                    expansionFactor: 4,
                    dotColor: AppColors.grey,
                    dotHeight: 7,
                    dotWidth: 7),
              ),
            ],
          );
        } else if (state is GetSlidersError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox();
      },
    );
  }
}
