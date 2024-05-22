import 'package:charity_app/core/constants/assets_images.dart';
import 'package:charity_app/core/services/api_services.dart';

import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';

import 'package:charity_app/features/presentaion/manager/carts/cart_cubit.dart';
import 'package:charity_app/features/presentaion/manager/carts/cart_stats.dart';

import 'package:charity_app/features/presentaion/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    context.read<CartCubit>().getAllCarts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartStates>(builder: (context, state) {
      if (state is CartErrorState) {
        return Center(child: Text(state.error));
      } else if (state is CartLoadingState) {
        return Center(
            child: CircularProgressIndicator(
          color: AppColors.green,
        ));
      } else if (state is CartConstantState) {
        return Scaffold(
            backgroundColor: AppColors.boneWhite,
            body: Center(
                child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          AssetsImage.noCart,
                        ),
                      ],
                    ))));
      } else if (state is CartSuccessState) {
        return Scaffold(
          backgroundColor: AppColors.boneWhite,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SafeArea(
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Row(
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10),
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(state
                                          .newModel
                                          .userCarts![index]
                                          .donationItemId!
                                          .productImage!),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              const Gap(10),
                              Expanded(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    state.newModel.userCarts![index]
                                        .donationItemId!.tagName!,
                                    style: getheadline(color: AppColors.black),
                                  ),
                                  const Gap(5),
                                  Row(
                                    children: [
                                      Text(
                                        'Quantity:',
                                        style: getbody(),
                                      ),
                                      const Gap(5),
                                      Text(
                                        state
                                            .newModel.userCarts![index].quantity
                                            .toString(),
                                        style: getbody(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const Gap(5),
                                  Row(
                                    children: [
                                      Text(
                                        'Price:',
                                        style: getbody(),
                                      ),
                                      const Gap(5),
                                      Text(
                                        '${state.newModel.userCarts![index].totalPrice.toString()} LE',
                                        style: getbody(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  const Gap(5),
                                  Row(
                                    children: [
                                      Text(
                                        'Delete:',
                                        style: getbody(),
                                      ),
                                      const Gap(10),
                                      IconButton(
                                          onPressed: () {
                                            ApiServices.deleteCart(state
                                                .newModel
                                                .userCarts![index]
                                                .id!);
                                            Future.delayed(
                                                const Duration(seconds: 1), () {
                                              context
                                                  .read<CartCubit>()
                                                  .getAllCarts();
                                            });
                                          },
                                          icon: Icon(
                                            Icons.delete_outline_rounded,
                                            color: AppColors.red,
                                          ))
                                    ],
                                  )
                                ],
                              ))
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(
                            color: AppColors.grey,
                            thickness: 1,
                          );
                        },
                        itemCount: state.newModel.userCarts!.length,
                        shrinkWrap: true,
                      ),
                    ),
                    const Gap(10),
                    CustomButton(
                      text: 'Donate ${state.totalPrice} LE',
                      width: double.infinity,
                      height: 45,
                      onpressed: () {
                        ApiServices.makePayment(context);
                      },
                    ),
                    const Gap(10),
                  ],
                ),
              ),
            ),
          ),
        );
      }
      return Container();
    });
  }
}
