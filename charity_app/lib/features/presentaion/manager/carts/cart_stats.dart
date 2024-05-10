import 'package:charity_app/features/data/Model/cart_model/cart_model.dart';

class CartStates {}

class CartrgInitialState extends CartStates {}

class CartConstantState extends CartStates {}

class CartLoadingState extends CartStates {}

class CartSuccessState extends CartStates {
  late CartModel newModel;
  CartSuccessState({required this.newModel});
}

class CartErrorState extends CartStates {
  final String error;
  CartErrorState({required this.error});
}
