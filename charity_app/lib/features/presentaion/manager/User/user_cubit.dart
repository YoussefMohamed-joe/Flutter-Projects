import 'package:charity_app/core/constants/app_constants.dart';
import 'package:charity_app/core/services/api_services.dart';
import 'package:charity_app/core/services/local_storage.dart';
import 'package:charity_app/features/data/Model/log_model/log_model.dart';
import 'package:charity_app/features/data/Model/register_model/register_model.dart';
import 'package:charity_app/features/presentaion/manager/User/user_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterModelCubit extends Cubit<RegStates> {
  RegisterModelCubit() : super(RegInitialState());
  late RegisterModel newModel;

  postSignUp(String email, String password, String name, String phoneNumber,
      String confirmPassword) async {
    emit(RegLoadingState());

    try{
    await Dio().post('${AppConstants.baseUrl}${AppConstants.signUp}', data: {
      "name": name,
      "email": email,
      "password": password,
      "passwordConfirm": confirmPassword,
      "phoneNumber": phoneNumber
    }).then((value) {
        newModel = RegisterModel.fromJson(value.data);
        emit(RegSuccessState());
          AppLocalStorage.cashData('name', newModel.data!.user!.name);
          AppLocalStorage.cashData('token', newModel.token);
    });
    } on DioException catch(e) {
      emit(RegErrorState(error: e.response!.data['message']));
    }
  }
}

class LogCubit extends Cubit<LogStates> {
  LogCubit() : super(LogInitialState());
  late LogModel newModel;

  postLogin(String email, String password) {
    emit(LogLoadingState());

    try {
      ApiServices.postLogin(email, password).then((value) {
        if (value == null) {
          emit(LogErrorState(error: 'Incorrect Email or Password.'));
        } else {
          newModel = value;
          emit(LogSuccessState());
          AppLocalStorage.cashData('name', newModel.data!.user!.name);
          AppLocalStorage.cashData('token', newModel.token);
        }
      });
    } catch (e) {
      emit(LogErrorState(error: e.toString()));
    }
  }
}
