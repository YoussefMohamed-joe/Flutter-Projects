import 'package:bookia/features/cart/data/get_cart_response/get_cart_response.dart';

class CartStates {}

class CartInitial extends CartStates {}

class CartLoading extends CartStates {}

class CartSuccess extends CartStates {
  final GetCartResponse getCartResponse;
  CartSuccess({required this.getCartResponse});
}

class CartError extends CartStates {
  final String error;
  CartError({required this.error});
}

class AddToCartLoading extends CartStates {}

class AddToCartSuccess extends CartStates {}

class AddToCartError extends CartStates {
  final String error;
  AddToCartError({required this.error});
}

class RemoveFromCartLoading extends CartStates {}

class RemoveFromCartSuccess extends CartStates {}

class RemoveFromCartError extends CartStates {
  final String error;
  RemoveFromCartError({required this.error});
}

class CartQuantitySuccess extends CartStates {}

class CartQuantityError extends CartStates {
  final String error;
  CartQuantityError({required this.error});
} 

class CartQuantityLoading extends CartStates {}

class QuantityUpdatedState extends CartStates {}