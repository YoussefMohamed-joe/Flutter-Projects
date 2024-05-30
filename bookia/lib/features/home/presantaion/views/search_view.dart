import 'package:bookia/core/functions/routing.dart';
import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/home/data/Models/get_search_response/product.dart';
import 'package:bookia/features/home/presantaion/manager/home_cubit.dart';
import 'package:bookia/features/home/presantaion/manager/home_states.dart';
import 'package:bookia/features/home/presantaion/views/book_details_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SearchView extends StatefulWidget {

  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  @override
  Widget build(BuildContext context) {
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        context.read<HomeCubit>().search(value);
                      },
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    const Gap(20),
                    Expanded(
                      child: BlocBuilder<HomeCubit, HomeStates>(
                        builder: (context, state) {
                                if (state is SearchSuccess) {
                                List<Product>? product =
                                    HomeCubit.searchResponse.data!.products;
                      return GridView.builder(
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
                                            BookSearchView(
                                              product: product[index],
                                              category: HomeCubit.searchResponse.data!.products![index].name.toString(),
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
                      );} else if (state is SearchError) {
                                return Scaffold(
                                  body: Center(
                                    child: Text(state.error),
                                  ),
                                );
                              } else {
                                return Scaffold(
                                  body: Center(
                                    child: Text('Haven\'t search anything yet ;)',style: getTitleStyle(color: AppColors.primary),),
                                  ),);}
                            },),
                    )
                  ],
                ),
              ),
            ),
          );
        

        }

}
