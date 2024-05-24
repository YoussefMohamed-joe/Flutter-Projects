import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/bookmark/data/get_wishlist_response/datum.dart';
import 'package:bookia/features/bookmark/presentation/widgets/wishlist_item.dart';
import 'package:bookia/features/home/presantaion/manager/home_cubit.dart';
import 'package:bookia/features/home/presantaion/manager/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class BookmarkView extends StatefulWidget {
  const BookmarkView({super.key});

  @override
  State<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends State<BookmarkView> {
  List<Datum>? list = [];
  @override
  Widget build(BuildContext context) {
    context.read<HomeCubit>().getWhishList();
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        if (state is GetWhishListSuccess) {
          list = state.getWishlistResponse.data?.data ?? [];
        } else if (state is GetWhishListError) {
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
        if (state is GetWhishListLoading) {
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
                    title: Text('Favourite Books', style: getTitleStyle()),
                    centerTitle: true,
                  ),
                  body: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: ListView.separated(
                            itemBuilder: (context, index) => WhishlistItem(
                              list: list![index],
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
                );
        }
      },
    );
  }
}
