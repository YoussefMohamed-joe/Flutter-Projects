import 'package:charity_app/core/services/api_services.dart';
import 'package:charity_app/features/data/Model/cart_model/cart_model.dart';
import 'package:charity_app/features/presentaion/manager/carts/cart_stats.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartrgInitialState());
   static CartModel? newModel;
  int totalPrice = 0;
  getAllCarts() {
          
    emit(CartConstantState());
    try {

      ApiServices.getAllCarts()
          .then((value) {
        newModel = value!;
        totalPrice = 0;
        for(int i = 0;i<newModel!.userCarts!.length;i++){
          totalPrice += newModel!.userCarts![i].totalPrice!;
        }
        emit(CartSuccessState(newModel: newModel!,totalPrice: totalPrice));
      });
    } catch (e) {
      emit(CartErrorState(error: e.toString()));
    }
  }
}