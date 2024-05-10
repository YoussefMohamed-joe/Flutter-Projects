import 'package:charity_app/core/services/api_services.dart';
import 'package:charity_app/features/data/Model/cart_model/cart_model.dart';
import 'package:charity_app/features/presentaion/manager/carts/cart_stats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartrgInitialState());
   CartModel? newModel;

  getAllCarts() {
          
    emit(CartConstantState());
    try {

      ApiServices.getAllCarts()
          .then((value) {
        newModel = value!;
        
        emit(CartSuccessState(newModel: newModel!));
      });
    } catch (e) {
      emit(CartErrorState(error: e.toString()));
    }
  }
}