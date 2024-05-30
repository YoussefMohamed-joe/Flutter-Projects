import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/cutom_back_button.dart';
import 'package:bookia/features/cart/presentation/manager/cart_cubit.dart';
import 'package:bookia/features/home/data/Models/show_categories_response/product.dart';

import 'package:bookia/features/home/presantaion/manager/home_cubit.dart';
import 'package:bookia/features/home/presantaion/manager/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class BookCategoriesDetailsView extends StatelessWidget {
  final Product product;
  final String category;
  const BookCategoriesDetailsView(
      {super.key, required this.product, required this.category});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is AddBookmarkSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Added to bookmark Successfully',
                style: getBodyStyle(color: AppColors.white),
              ),
              backgroundColor: AppColors.primary,
            ),
          );
        } else if (state is AddBookmarkErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.error,
                style: getBodyStyle(),
              ),
              backgroundColor: AppColors.primary,
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: const CutomArrowBack(),
          actions: [
            IconButton(
                onPressed: () {
                  context.read<HomeCubit>().addBookmark(product.id!);
                },
                icon: SvgPicture.asset('assets/icons/bookmark.svg'))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(13),
            child: Center(
              child: Column(children: [
                Hero(
                  tag: product.id.toString(),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      product.image.toString(),
                      width: 180,
                      height: 240,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const Gap(10),
                Text(
                  product.name.toString(),
                  style: getTitleStyle(fontSize: 21),
                ),
                const Gap(10),
                Text(
                  category,
                  style: getBodyStyle(color: AppColors.primary),
                ),
                const Gap(10),
                Text(
                  product.description.toString(),
                  textAlign: TextAlign.justify,
                  style: getBodyStyle(fontSize: 14),
                ),
              ]),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Text(
                '${product.price.toString()} \$',
                style: getTitleStyle(),
              ),
              const Spacer(),
              InkWell(
                onTap: () {
                  context.read<CartCubit>().addCart(product.id!);
                },
                child: Container(
                    height: 40,
                    width: 180,
                    alignment: Alignment.center,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.dark),
                    child: Text(
                      'Add To Cart',
                      style: getBodyStyle(fontSize: 18, color: AppColors.white),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
