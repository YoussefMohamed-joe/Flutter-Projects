import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/cart/data/get_cart_response/cart_item.dart';
import 'package:bookia/features/cart/presentation/manager/cart_cubit.dart';
import 'package:bookia/features/cart/presentation/manager/cart_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CartlistItem extends StatefulWidget {
  final List<CartItem> list;
  final int index;
  const CartlistItem({
    super.key,
    required this.list,
    required this.index,
  });
  
  @override
  State<CartlistItem> createState() => _CartlistItemState();

  
}

class _CartlistItemState extends State<CartlistItem> {
  @override
  void initState() {
    context.read<CartCubit>().setQuantity(widget.index, widget.list[widget.index].itemQuantity!);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    return Row(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          widget.list[widget.index].itemProductImage!,
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
                  child: Text(widget.list[widget.index].itemProductName!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: getBodyStyle()),
                ),
                IconButton(
                    onPressed: () {
                      context.read<CartCubit>().removeCart(widget.list[widget.index].itemId!);
                      Future.delayed(const Duration(milliseconds: 500), () {
                        context.read<CartCubit>().getAllCart();
                      });
                    },
                    icon: Icon(
                      Icons.remove_shopping_cart_outlined,
                      color: AppColors.red,
                    ))
              ],
            ),
            Text('${widget.list[widget.index].itemProductPrice} \$',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: getBodyStyle()),
            const Gap(10),
            BlocBuilder<CartCubit, CartStates>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    FloatingActionButton.small(
                      onPressed: () {
                        
                        context.read<CartCubit>().removeQuntity(widget.index);
                        context.read<CartCubit>().postQuantity(
                            widget.list[widget.index].itemId!,
                            context.read<CartCubit>().quantity[widget.index]);
                      },
                      elevation: 0,
                      backgroundColor: AppColors.secondary,
                      child: const Icon(Icons.remove),
                    ),
                    const Gap(10),
                    Text(
                      context.read<CartCubit>().quantity[widget.index].toString(),
                      style: getTitleStyle(fontWeight: FontWeight.normal),
                    ),
                    const Gap(10),
                    FloatingActionButton.small(
                      onPressed: () {
                        context.read<CartCubit>().addQuntity(widget.index);
                        context.read<CartCubit>().postQuantity(
                            widget.list[widget.index].itemId!,
                            context.read<CartCubit>().quantity[widget.index]);
                      },
                      elevation: 0,
                      backgroundColor: AppColors.secondary,
                      child: const Icon(Icons.add),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      )
    ]);
  }
}
