import 'package:charity_app/features/data/Model/get_donation_history_response/get_donation_history_response.dart';

class DonationHistoryStates {}

class DonationHistoryLoadingState extends DonationHistoryStates {}

class DonationHistorySuccessState extends DonationHistoryStates {
  GetDonationHistoryResponse getDonationHistoryResponse;
  DonationHistorySuccessState({required this.getDonationHistoryResponse});
}

class DonationHistoryErrorState extends DonationHistoryStates {}

class DonationHistoryInitialState extends DonationHistoryStates {}