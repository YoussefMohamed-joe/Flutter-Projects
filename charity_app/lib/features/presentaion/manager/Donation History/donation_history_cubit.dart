
import 'package:charity_app/core/services/api_services.dart';
import 'package:charity_app/features/presentaion/manager/Donation%20History/donation_history_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoantionHistoryCubit extends Cubit<DonationHistoryStates> {
  DoantionHistoryCubit() : super(DonationHistoryInitialState());

  donationHistory() {
    emit(DonationHistoryLoadingState());
    try{
      ApiServices.getDonationHistoryResponse().then((value) {
        emit(DonationHistorySuccessState(getDonationHistoryResponse: value!));
      });
    }catch(e){  
      emit(DonationHistoryErrorState());
  }
  }
}