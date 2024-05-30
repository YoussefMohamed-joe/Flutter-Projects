import 'package:bookia/core/functions/routing.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/home/presantaion/manager/home_cubit.dart';
import 'package:bookia/features/home/presantaion/manager/home_states.dart';
import 'package:bookia/features/home/presantaion/views/categories_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class CategoriesWidget extends StatefulWidget {
  const CategoriesWidget({super.key});

  @override
  State<CategoriesWidget> createState() => _CategoriesWidgetState();
}

class _CategoriesWidgetState extends State<CategoriesWidget> {
  int page = 0;
  @override
  void initState() {
    context.read<HomeCubit>().getcategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      buildWhen: (previous, state) =>
          state is GetCategoriesSuccess || state is GetCategoriesLoading,
      builder: (context, state) {
        if (state is GetCategoriesSuccess) {
          return SizedBox(
            height: 50,
            width: double.infinity,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (itemBuilder, index) {
                return InkWell(
                  onTap: () {
                    navigateTo(
                        context,
                        CategoriesView(
                            id: state.getCategoriesResponse.data!
                                .categories![index].id!));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.secondary,
                    ),
                    child: Text(
                      state
                          .getCategoriesResponse.data!.categories![index].name!,
                      style: getBodyStyle(),
                    ),
                  ),
                );
              },
              separatorBuilder: (separatorBuilder, index) => const Gap(15),
              itemCount: state.getCategoriesResponse.data!.categories!.length,
            ),
          );
        } else if (state is GetCategoriesError) {
          return Center(child: Text(state.error));
        }
        return const SizedBox();
      },
    );
  }
}
