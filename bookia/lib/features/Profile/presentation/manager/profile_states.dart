import 'package:bookia/features/Profile/data/get_history_response/get_history_response.dart';
import 'package:bookia/features/Profile/data/get_profile_response/get_profile_response.dart';

final class ProfileStates {}

final class ProfileInitial extends ProfileStates {}

// get profile

final class GetProfileLoading extends ProfileStates {}

final class GetProfileSuccess extends ProfileStates {
  final GetProfileResponse getProfileResponse;

  GetProfileSuccess(this.getProfileResponse);
}

final class GetProfileError extends ProfileStates {
  final String error;

  GetProfileError(this.error);
}

final class UpdateProfileLoading extends ProfileStates {}

final class UpdateProfileSuccess extends ProfileStates {}

final class UpdateProfileError extends ProfileStates {
  final String error;

  UpdateProfileError(this.error);
}

final class HistoryLoading extends ProfileStates {}

final class HistorySuccess extends ProfileStates {
  final GetHistoryResponse gethistory;

  HistorySuccess(this.gethistory);
}

final class HistoryError extends ProfileStates {
  final String error;

  HistoryError(this.error);
}
