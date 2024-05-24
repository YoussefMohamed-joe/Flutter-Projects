import 'package:bookia/core/functions/routing.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/home/data/Models/get_products_response/product.dart';
import 'package:bookia/features/home/presantaion/manager/home_cubit.dart';
import 'package:bookia/features/home/presantaion/manager/home_states.dart';
import 'package:bookia/features/home/presantaion/views/book_details_view.dart';
import 'package:bookia/features/home/presantaion/widgets/home_slider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:flutter_svg/svg.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Product>? product = [];
  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().getProducts();
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
              BlocConsumer<HomeCubit, HomeStates>(
                listener: (context, state) {
                  if (state is GetProductsSuccess) {
                    product = state.getProductsResponse.data?.products;
                  } else if (state is GetProductsError) {}
                },
                builder: (context, state) {
                  if (state is GetProductsLoading) {
                    return Center(
                        child: CircularProgressIndicator(
                      color: AppColors.primary,
                    ));
                  }
                  return product!.isEmpty
                      ? Center(
                          child: Text(
                          'No Data Found',
                          style: getBodyStyle(color: AppColors.primary),
                        ))
                      : GridView.builder(
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
                                    tag: product![index].name.toString(),
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          product![index].image.toString(),
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
                                          product![index].name.toString(),
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
                                        '${product![index].price.toString()} \$',
                                        style: getBodyStyle(),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        onTap: () {
                                          navigateTo(
                                              context,
                                              BookDetailsView(
                                                  product: product![index]));
                                        },
                                        child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10, vertical: 5),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                color: AppColors.dark),
                                            child: Text(
                                              'View Details',
                                              style: getBodyStyle(
                                                  fontSize: 10,
                                                  color: AppColors.white),
                                            )),
                                      )
                                    ],
                                  )
                                ],
                              )),
                          itemCount: product!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
