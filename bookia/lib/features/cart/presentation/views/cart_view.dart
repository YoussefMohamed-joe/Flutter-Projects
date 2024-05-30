import 'package:bookia/core/functions/routing.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/core/widgets/custom_btn.dart';
import 'package:bookia/features/cart/data/get_cart_response/cart_item.dart';
import 'package:bookia/features/cart/presentation/manager/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/manager/cart_states.dart';
import 'package:bookia/features/cart/presentation/views/checkout_view.dart';
import 'package:bookia/features/cart/presentation/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  List<CartItem>? list = [];
  String price = '';
  @override
  Widget build(BuildContext context) {
    context.read<CartCubit>().getAllCart();
    return BlocConsumer<CartCubit, CartStates>(
      listener: (context, state) {
        if (state is CartSuccess) {
          list = state.getCartResponse.data?.cartItems ?? [];
          price = state.getCartResponse.data?.total.toString() ?? '';
        } else if (state is CartError) {
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
      builder: (context, state) {
        if (state is CartLoading) {
          return Center(
              child: CircularProgressIndicator(
            color: AppColors.primary,
          ));
        } else {
          return list!.isEmpty
              ? const Center(
                  child: Text(
                    'No Books Found',
                    style: TextStyle(color: Colors.black),
                  ),
                )
              : Scaffold(
                  appBar: AppBar(
                    title: Text('My Cart', style: getTitleStyle()),
                    centerTitle: true,
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: ListView.separated(
                            itemBuilder: (context, index) => CartlistItem(
                              list: list!,
                              index: index,
                            ),
                            separatorBuilder: (context, index) => const Column(
                              children: [
                                Gap(10),
                                Divider(
                                  thickness: 1,
                                ),
                                Gap(10),
                              ],
                            ),
                            itemCount: list!.length,
                          ),
                        ),
                      )
                    ],
                  ),
                  bottomNavigationBar: Row(
                    children: [
                      Text(
                        'Total: $price \$',
                        style: getTitleStyle(),
                      ),
                      const Spacer(),
                      Expanded(
                          child: CustomButton(
                              text: 'Checkout',
                              textStyle: getBodyStyle(color: AppColors.white),
                              onPressed: () {
                                navigateTo(
                                    context,
                                    CheckoutView(
                                      totalPrice: price,
                                    ));
                              }))
                    ],
                  ),
                );
        }
      },
    );
  }
}
