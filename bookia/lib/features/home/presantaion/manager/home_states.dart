import 'package:bookia/features/bookmark/data/get_wishlist_response/get_wishlist_response.dart';
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

class AddBookmarkSuccessState extends HomeStates {}

class AddBookmarkErrorState extends HomeStates {
  final String error;

  AddBookmarkErrorState(this.error);
}

class AddBookmarkLoadingState extends HomeStates {}

class RemoveBookmarkSuccessState extends HomeStates {}

class RemoveBookmarkErrorState extends HomeStates {
  final String error;
  RemoveBookmarkErrorState(this.error);
}

class RemoveBookmarkLoadingState extends HomeStates {}

class GetWhishListSuccess extends HomeStates {
  final GetWishlistResponse getWishlistResponse;
  GetWhishListSuccess(this.getWishlistResponse);
}

class GetWhishListError extends HomeStates {
  final String error;
  GetWhishListError(this.error);
}

class GetWhishListLoading extends HomeStates {}
