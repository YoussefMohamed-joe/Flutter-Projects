import 'package:bookia/features/home/data/Models/get_products_response/get_products_response.dart';

class HomeStates {}

class HomeInitial extends HomeStates {}

class GetProductsLoading extends HomeStates {}

class GetProductsSuccess extends HomeStates {

  final GetProductsResponse getProductsResponse;
  GetProductsSuccess(this.getProductsResponse);
}

class GetProductsError extends HomeStates {

  final String error;
  GetProductsError(this.error);
}