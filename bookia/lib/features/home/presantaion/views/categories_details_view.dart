import 'package:bookia/core/functions/routing.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/cutom_back_button.dart';
import 'package:bookia/features/home/data/Models/show_categories_response/product.dart';
import 'package:bookia/features/home/presantaion/manager/home_cubit.dart';
import 'package:bookia/features/home/presantaion/manager/home_states.dart';
import 'package:bookia/features/home/presantaion/views/book_details_categories_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CategoriesView extends StatefulWidget {
  final int id;
  const CategoriesView({super.key, required this.id});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  @override
  void initState() {
    context.read<HomeCubit>().showcategories(widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (context, state) {
        if (state is GetCategoriesViewSuccess) {
          List<Product>? product =
              HomeCubit.showCategoriesResponse.data!.products;
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: const CutomArrowBack(),
              title: Text(
                state.showCategoriesResponse.data!.name!,
                style: getTitleStyle(),
              ),
            ),
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
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
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            product[index].image.toString(),
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          )),
                      const Gap(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              product[index].name.toString(),
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
                            '${product[index].price.toString()} \$',
                            style: getBodyStyle(),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              navigateTo(
                                  context,
                                  BookCategoriesDetailsView(
                                    product: product[index],
                                    category: state
                                        .showCategoriesResponse.data!.name!,
                                  ));
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
              itemCount: product!.length,
            ),
          );
        } else if (state is GetCategoriesViewError) {
          return Scaffold(
            body: Center(
              child: Text(state.error),
            ),
          );
        } else {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            ),
          );
        }
      },
    );
  }
}
