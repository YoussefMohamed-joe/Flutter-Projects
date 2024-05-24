import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/bookmark/data/get_wishlist_response/datum.dart';
import 'package:bookia/features/cart/presentation/manager/cart_cubit.dart';
import 'package:bookia/features/home/presantaion/manager/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class WhishlistItem extends StatelessWidget {
  final Datum list;
  const WhishlistItem({
    super.key,
    required this.list,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          list.image!,
          height: 120,
          width: 100,
          fit: BoxFit.cover,
        ),
      ),
      const Gap(20),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(list.name!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getBodyStyle()),
                ),
                IconButton(
                    onPressed: () {
                      context.read<HomeCubit>().removeBookmark(list.id!);
                      Future.delayed(const Duration(milliseconds: 500), () {
                        context.read<HomeCubit>().getWhishList();
                      });
                    },
                    icon: Icon(
                      Icons.bookmark_remove_outlined,
                      color: AppColors.red,
                    ))
              ],
            ),
            Text('${list.price} \$',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: getBodyStyle()),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    context.read<CartCubit>().addCart(list.id!);
                  },
                  child: Container(
                      height: 40,
                      width: 150,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.primary),
                      child: Text(
                        'Add To Cart',
                        style:
                            getBodyStyle(fontSize: 18, color: AppColors.white),
                      )),
                ),
              ],
            )
          ],
        ),
      )
    ]);
  }
}
