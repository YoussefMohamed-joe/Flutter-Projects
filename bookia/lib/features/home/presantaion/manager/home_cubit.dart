import 'package:bookia/core/constants/app_constants.dart';
import 'package:bookia/core/services/api_services.dart';
import 'package:bookia/features/home/data/Models/get_products_response/get_products_response.dart';
import 'package:bookia/features/home/presantaion/manager/home_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  getProducts() async {
    emit(GetProductsLoading());
    try{
      ApiServices.get(url: 'products').then((value) {
        var res = GetProductsResponse.fromJson(value);
        emit(GetProductsSuccess(res));
      });
    }catch(e){
      emit(GetProductsError(e.toString()));
    }
  }
}