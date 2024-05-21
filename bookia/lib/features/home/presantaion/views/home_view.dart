import 'package:bookia/core/functions/routing.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/home/presantaion/manager/home_cubit.dart';
import 'package:bookia/features/home/presantaion/manager/home_states.dart';
import 'package:bookia/features/home/presantaion/views/book_details_view.dart';
import 'package:bookia/features/home/presantaion/widgets/home_slider_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    context.read<HomeCubit>().getProducts();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Image.asset(
          'assets/images/logo.png',
          height: 30,
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/notification.svg')),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset('assets/icons/search.svg')),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SliderWidget(),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Popular Books',
                    style: getTitleStyle(),
                  ),
                ],
              ),
              const Gap(15),
              BlocBuilder<HomeCubit, HomeStates>(
                builder: (context, state) {
                  if (state is GetProductsLoading) {
                    return  Center(child: CircularProgressIndicator(color:AppColors.primary ,));
                  } else if(state is GetProductsError){
                    return Center(child: Text(state.error));
                  } else if(state is GetProductsSuccess){
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 11,
                            crossAxisSpacing: 11,
                            mainAxisExtent: 300),
                    itemBuilder: (context, index) => Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.secondary),
                        child: Column(
                          children: [
                            Hero(
                              tag: state.getProductsResponse.data!.products![index].name.toString(),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.network(
                                    state.getProductsResponse.data!.products![index].image.toString(),
                                    height: 200,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const Gap(5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    state.getProductsResponse.data!.products![index].name.toString(),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: getBodyStyle(),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(20),
                            Row(
                              children: [
                                Text(
                                  '${state.getProductsResponse.data!.products![index].price.toString()} \$',
                                  style: getBodyStyle(),
                                ),
                                const Spacer(),
                                InkWell(
                                  onTap: () {
                                    navigateTo(context, BookDetailsView(product: state.getProductsResponse.data!.products![index]));
                                  },
                                  child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 5),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: AppColors.dark),
                                      child: Text(
                                        'View Details',
                                        style: getBodyStyle(
                                            fontSize: 10, color: AppColors.white),
                                      )),
                                )
                              ],
                            )
                          ],
                        )),
                    itemCount: state.getProductsResponse.data!.products!.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  );
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
