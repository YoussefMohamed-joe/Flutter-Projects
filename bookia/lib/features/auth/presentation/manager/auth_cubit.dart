
import 'package:bookia/core/constants/app_constants.dart';
import 'package:bookia/features/auth/data/models/post_auth_response/data.dart';
import 'package:bookia/features/auth/data/models/post_auth_response/post_auth_response.dart';
import 'package:bookia/features/auth/presentation/manager/auth_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitialState());

  void login() {
    emit(LoginLoadingState());
  }

  void register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation}) async{
    emit(RegisterLoadingState());
    try{
      await Dio().post('$ApiConstat.baseUrl$ApiConstat.register',
      data: 
      {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': passwordConfirmation
      }
      ).then((value){
        var res = PostAuthResponse.fromJson(value.data);
        emit(RegisterSuccessState(res));
      });
    }catch(e){

  }
}

}