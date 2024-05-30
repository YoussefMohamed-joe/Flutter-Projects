import 'package:bookia/core/utils/colors.dart';
import 'package:bookia/core/utils/text_styles.dart';
import 'package:bookia/features/Profile/presentation/manager/profile_cubit.dart';
import 'package:bookia/features/Profile/presentation/manager/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class MyOrdersView extends StatefulWidget {
  const MyOrdersView({super.key});

  @override
  State<MyOrdersView> createState() => _MyOrdersViewState();
}

class _MyOrdersViewState extends State<MyOrdersView> {
  @override
  void initState() {
    context.read<ProfileCubit>().donationHistory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Donation History',
            style: getTitleStyle(color: AppColors.dark)),
        leading: const BackButton(),
      ),
      body: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          if (state is HistoryLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColors.primary,
              ),
            );
          } else if (state is HistoryError) {
            return Center(
                child: Text(
              'Something went wrong',
              style: getTitleStyle(color: AppColors.dark),
            ));
          } else if (state is HistorySuccess) {
            return ListView.builder(
              itemCount: state.gethistory.data!.orders!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.white,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Receipt',
                                style: getTitleStyle(color: AppColors.dark),
                              ),
                              const Spacer(),
                              Text(
                                '${state.gethistory.data!.orders![index].orderDate}',
                                style: getBodyStyle(color: AppColors.dark),
                              ),
                            ],
                          ),
                          const Gap(10),
                          Text(
                            'ID: ${state.gethistory.data!.orders![index].orderCode}',
                            style: getBodyStyle(color: AppColors.dark),
                          ),
                          const Gap(10),
                          Row(children: [
                            Text(
                              'Total Price: ${state.gethistory.data!.orders![index].total}',
                              style: getBodyStyle(color: AppColors.dark),
                            ),
                            const Spacer(),
                            Text(
                              '${state.gethistory.data!.orders![index].status}',
                              style: getBodyStyle(color: Colors.green),
                            ),
                          ])
                        ]),
                  ),
                );
              },
            );
          }
          return Center(
              child: Text(
            'No Donation History',
            style: getTitleStyle(color: AppColors.dark),
          ));
        },
      ),
    );
  }
}
