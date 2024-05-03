import 'package:charity_app/core/services/api_services.dart';
import 'package:charity_app/features/Model/register_model/register_model.dart';
import 'package:charity_app/features/manager/User/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterModelCubit extends Cubit<RegStates> {
  RegisterModelCubit() : super(RegInitialState());
  late RegisterModel newModel;

  postMovies(String email, String password, String name, String phoneNumber,String confirmPassword) {
  emit(RegLoadingState());

    try{  
      ApiServices.postSignUp(email, password, name, phoneNumber, confirmPassword).then((value) {
        newModel = value!;
        emit(RegSuccessState());
      });
    }catch(e){
      emit(RegErrorState(error: e.toString()));
    }
  }
}