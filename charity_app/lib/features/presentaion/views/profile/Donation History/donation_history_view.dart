import 'package:charity_app/core/utils/colors.dart';
import 'package:charity_app/core/utils/text_styles.dart';
import 'package:charity_app/features/presentaion/manager/Donation%20History/donation_history_cubit.dart';
import 'package:charity_app/features/presentaion/manager/Donation%20History/donation_history_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class DonationHistoryView extends StatefulWidget {
  const DonationHistoryView({super.key});

  @override
  State<DonationHistoryView> createState() => _DonationHistoryViewState();
}

class _DonationHistoryViewState extends State<DonationHistoryView> {
  @override
  void initState() {
    context.read<DoantionHistoryCubit>().donationHistory();
    super.initState();
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.boneWhite,
      appBar: AppBar(
        backgroundColor: AppColors.boneWhite,
        title: Text('Donation History',
            style: getheadline(color: AppColors.black)),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: BlocBuilder<DoantionHistoryCubit, DonationHistoryStates>(
        builder: (context, state) {
          if (state is DonationHistoryLoadingState) {
            return  Center(
              child: CircularProgressIndicator(
                color: AppColors.green,
              ),
            );
          }
          else if (state is DonationHistoryErrorState) {
            return Center(child: Text('Something went wrong',style: getheadline(color: AppColors.black),));
          }
          else if (state is DonationHistorySuccessState) {
            return ListView.builder(
              itemCount: 1,
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
                            Text('Receipt',style: getheadline(color: AppColors.black),),
                            const Spacer(),
                            Text(state.getDonationHistoryResponse.userDonationHistory!.paymentDate.toString().split('.')[0],style: getbody(color: AppColors.black),),
                          ],
                        ),
                        const Gap(10),
                        Text('Email: ${state.getDonationHistoryResponse.userDonationHistory!.receiptEmail}',style: getbody(color: AppColors.black),),
                        const Gap(10),
                        Row(

                          children: [
                            Text('Total Price: ${state.getDonationHistoryResponse.userDonationHistory!.totalPrice}',style: getbody(color: AppColors.black),),
                            const Spacer(),
                            Text(state.getDonationHistoryResponse.userDonationHistory!.status.toString(),style: getbody(color: AppColors.green),),
                          ]
                        )
                      ]
                    ),
                  ),
                );
              },
            );
          }
          return  Center(child: Text('No Donation History',style: getheadline(color: AppColors.black),));
        },
      ),
    );
  }
}
