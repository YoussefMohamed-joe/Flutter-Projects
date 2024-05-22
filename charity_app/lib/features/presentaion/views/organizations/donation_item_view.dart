import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/services/local_storage.dart';
import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/core/widgets/nav_bar_view.dart';
import 'package:charity_app/features/presentaion/manager/Organisations/org_cubit.dart';
import 'package:charity_app/features/presentaion/manager/Organisations/org_states.dart';
import 'package:charity_app/features/presentaion/manager/carts/cart_cubit.dart';
import 'package:charity_app/features/presentaion/manager/carts/cart_stats.dart';
import 'package:charity_app/features/presentaion/manager/price/price_cubit.dart';
import 'package:charity_app/features/presentaion/manager/price/price_states.dart';
import 'package:charity_app/features/presentaion/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';

class DonationItemView extends StatefulWidget {
  const DonationItemView({super.key});

  @override
  State<DonationItemView> createState() => _DonationItemViewState();
}

class _DonationItemViewState extends State<DonationItemView> {
  int itemIndex = AppLocalStorage.getData('ItemIndex');
  int orgIndex = AppLocalStorage.getData('OrgIndex');
  @override
  void initState() {
    context.read<PriceCubit>().setpPrice(OrgCubit.newModel.data!
        .organizations![orgIndex].donationOption![itemIndex].price!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartPostCubit, CartPostStates>(
      listener: (context, state) {
        if (state is CartPostSuccessState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: const Duration(milliseconds: 500),
              content: Text(
                'Added Successfully to Cart',
                style: getbody(color: AppColors.white),
              ),
              backgroundColor: AppColors.green,
            ),
          );
        } else if (state is CartPostErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              'Something Went Wrong',
              style: getbody(color: AppColors.white),
            ),
            backgroundColor: AppColors.green,
          ));
        }
      },
      builder: (context, state) {
        return BlocBuilder<OrgCubit, OrgStates>(
          builder: (context, state) {
            if (state is OrgSuccessState) {
              return Scaffold(
                backgroundColor: AppColors.boneWhite,
                appBar: AppBar(
                    backgroundColor: AppColors.boneWhite,
                    title: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(
                          OrgCubit
                              .newModel.data!.organizations![orgIndex].name!,
                          maxLines: 1,
                          overflow: TextOverflow.visible,
                          style: getheadline(color: AppColors.black)),
                    ),
                    leading: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                    actions: [
                      IconButton(
                        onPressed: () {
                          NavBar.index = 2;
                          navigateTowithReplacment(context, const NavBar());
                        },
                        icon: SvgPicture.asset('assets/icons/cart.svg',
                            colorFilter: ColorFilter.mode(
                                AppColors.black, BlendMode.srcIn)),
                      ),
                      const Gap(5),
                    ]),
                body: SingleChildScrollView(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 230,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                  image: NetworkImage(OrgCubit
                                      .newModel
                                      .data!
                                      .organizations![orgIndex]
                                      .donationOption![itemIndex]
                                      .productImage!),
                                  fit: BoxFit.fill,
                                )),
                          ),
                          const Gap(30),
                          Text(
                              OrgCubit.newModel.data!.organizations![orgIndex]
                                  .donationOption![itemIndex].tagName!,
                              style: getheadline(color: AppColors.black)),
                          const Gap(15),
                          Text(
                              OrgCubit.newModel.data!.organizations![orgIndex]
                                  .donationOption![itemIndex].description!,
                              style: getbody(color: AppColors.black)),
                          const Gap(30),
                          Text(
                            'Price',
                            style: getheadline(),
                          ),
                          const Gap(20),
                          BlocBuilder<PriceCubit, PriceStates>(
                              builder: (context, state) {
                            return Row(
                              children: [
                                const Gap(10),
                                Text(
                                  '${context.read<PriceCubit>().price.toString()} LE',
                                  style: getheadline(color: AppColors.dgrey),
                                ),
                                const Spacer(),
                                IconButton(
                                    onPressed: () {
                                      context
                                          .read<PriceCubit>()
                                          .decreasePrice();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              AppColors.green),
                                    ),
                                    icon: Icon(
                                      Icons.remove,
                                      color: AppColors.white,
                                    )),
                                const Gap(20),
                                Text(
                                  context.read<PriceCubit>().counter.toString(),
                                  style: getheadline(color: AppColors.dgrey),
                                ),
                                const Gap(20),
                                IconButton(
                                    onPressed: () {
                                      context
                                          .read<PriceCubit>()
                                          .increasePrice();
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              AppColors.green),
                                    ),
                                    icon: Icon(
                                      Icons.add,
                                      color: AppColors.white,
                                    )),
                              ],
                            );
                          }),
                          const Gap(10),
                        ],
                      ),
                    ),
                  ),
                ),
                bottomNavigationBar: Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: CustomButton(
                      text: 'Add To Cart',
                      width: double.infinity,
                      onpressed: () {
                        context.read<CartPostCubit>().addCarts(
                            OrgCubit
                                .newModel.data!.organizations![orgIndex].sId!,
                            OrgCubit.newModel.data!.organizations![orgIndex]
                                .donationOption![itemIndex].sId!,
                            context.read<PriceCubit>().counter);
                      }),
                ),
              );
            } else if (state is OrgLoadingState) {
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
      },
    );
  }
}
