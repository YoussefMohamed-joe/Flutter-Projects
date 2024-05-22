import 'user_donation_history.dart';

class GetDonationHistoryResponse {
  String? status;
  UserDonationHistory? userDonationHistory;

  GetDonationHistoryResponse({this.status, this.userDonationHistory});

  factory GetDonationHistoryResponse.fromJson(Map<String, dynamic> json) {
    return GetDonationHistoryResponse(
      status: json['status'] as String?,
      userDonationHistory: json['userDonationHistory'] == null
          ? null
          : UserDonationHistory.fromJson(
              json['userDonationHistory'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'userDonationHistory': userDonationHistory?.toJson(),
      };
}
