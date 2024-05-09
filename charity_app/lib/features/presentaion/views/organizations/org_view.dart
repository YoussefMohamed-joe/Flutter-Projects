import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/services/local_storage.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/features/presentaion/manager/Organisations/org_cubit.dart';
import 'package:charity_app/features/presentaion/manager/Organisations/org_states.dart';
import 'package:charity_app/features/presentaion/views/organizations/donation_item_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';


class OrgView extends StatefulWidget {
  const OrgView({super.key});

  @override
  State<OrgView> createState() => _OrgViewState();
}

class _OrgViewState extends State<OrgView> {
  int page = 0;
  int orgindex = AppLocalStorage.getData('OrgIndex');
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrgCubit, OrgStates>(
      builder: (context, state) {
        if (state is OrgSuccessState) {
           return Scaffold(
      backgroundColor: AppColors.boneWhite,
      appBar: AppBar(
        backgroundColor: AppColors.boneWhite,
        title: Text(OrgCubit.newModel.data!.organizations![orgindex].name!, style: getheadline(color: AppColors.black)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CarouselSlider.builder(
                  itemCount: OrgCubit.newModel.data!.organizations![orgindex].sliderImages!.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.boneWhite,
                          
                          image: DecorationImage(image: NetworkImage(OrgCubit.newModel.data!.organizations![orgindex].sliderImages![itemIndex]), fit: BoxFit.fill,) 
                        ),
                        ),
                      
                  options: CarouselOptions(
                    height: 170,
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
              Positioned(
                bottom: 10,
                left: 155,
                child: SmoothPageIndicator(
                  controller: PageController(initialPage: page), // PageController
                  count: OrgCubit.newModel.data!.organizations![orgindex].sliderImages!.length,
                  effect: ScrollingDotsEffect(
                    activeDotColor: AppColors.lgreen,
                    dotColor: Colors.grey,
                    dotHeight: 12,
                    dotWidth: 12
                  ), // your preferred effect
                ),
              )
                ]
              ),
              const Gap(20),
              Text('Description', style: getheadline(color: AppColors.black)),
              const Gap(10),
              Text(OrgCubit.newModel.data!.organizations![orgindex].description!, style: getbody(color: AppColors.dgrey)),
              const Gap(20),
              Text('Items to donate in', style: getheadline(color: AppColors.black)),
              const Gap(10),
              Expanded(
                child: ListView.separated(itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      AppLocalStorage.cashData('ItemIndex', index);
                      navigateTo(context, const DonationItemView());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                       Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                          image: DecorationImage(image: NetworkImage(OrgCubit.newModel.data!.organizations![orgindex].donationOption![index].productImage!), fit: BoxFit.fill,)
                        ),
                       ),
                       const Gap(10),
                       Expanded(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           
                           children: [
                             Text(OrgCubit.newModel.data!.organizations![orgindex].donationOption![index].tagName!, style: getbody()),
                             const Gap(5),
                             Text(OrgCubit.newModel.data!.organizations![orgindex].donationOption![index].description!, maxLines: 5,style: getbodysmall(color: AppColors.dgrey,)),
                           ],
                         ),
                       ),
                      ],
                    ),
                  );
                }, separatorBuilder: (context,index){
                  return const Gap(10);
                }, itemCount: OrgCubit.newModel.data!.organizations![orgindex].donationOption!.length, scrollDirection: Axis.vertical, shrinkWrap: true),
              ),
            ],
          ),
        ),
      ),
      );
        }
        else if (state is OrgLoadingState) {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(AppColors.green),
            ),
          );
        } else if (state is OrgErrorState) {
          return Center(
            child: Text(
              state.error,
              style: getbody(),
            ),
          );
        }
        return const SizedBox();
      },
    );
   
  }
}