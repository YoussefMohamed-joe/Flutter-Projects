import 'package:bookia/core/services/api_services.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/features/Profile/data/get_history_response/get_history_response.dart';
import 'package:bookia/features/Profile/data/get_profile_response/get_profile_response.dart';
import 'package:bookia/features/Profile/presentation/manager/profile_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitial());

  // get profile

  getProfile() {
    emit(GetProfileLoading());
    try {
      ApiServices.get(
        url: 'profile',
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
        },
      ).then((value) {
        emit(GetProfileSuccess(GetProfileResponse.fromJson(value)));
      });
    } catch (e) {
      emit(GetProfileError(e.toString()));
    }
  }

  updateProfile(
      {required String name,
      String? path,
      String? phone,
      String? address}) async {
    emit(UpdateProfileLoading());
    try {
      ApiServices.post(
        url: 'update-profile',
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getData('token')}}',
        },
        // FormData
        data: FormData.fromMap({
          'name': name,
          if (path != null)
            'image': await MultipartFile.fromFile(path,
                filename: path.split('/').last),
          'phone': phone,
          'address': address
        }),
      ).then((value) {
        emit(UpdateProfileSuccess());
      });
    } catch (e) {
      emit(UpdateProfileError(e.toString()));
    }
  }

  donationHistory() {
    emit(HistoryLoading());
    try {
      ApiServices.get(
        url: 'order-history',
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
        },
      ).then((value) {
        emit(HistorySuccess(GetHistoryResponse.fromJson(value)));
      });
    } catch (e) {
      emit(HistoryError(e.toString()));
    }
  }
}
