import 'package:bookia/features/bookmark/data/get_wishlist_response/get_wishlist_response.dart';
import 'package:bookia/features/home/data/Models/get_categories_response/get_categories_response.dart';
import 'package:bookia/features/home/data/Models/get_products_response/get_products_response.dart';
import 'package:bookia/features/home/data/Models/get_sliders_response/get_sliders_response.dart';
import 'package:bookia/features/home/data/Models/show_categories_response/show_categories_response.dart';

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

class GetSlidersSuccess extends HomeStates {
  final GetSlidersResponse getSlidersResponse;
  GetSlidersSuccess(this.getSlidersResponse);
}

class GetSlidersError extends HomeStates {
  final String error;
  GetSlidersError(this.error);
}

class GetSlidersLoading extends HomeStates {}

class GetCategoriesLoading extends HomeStates {}

class GetCategoriesSuccess extends HomeStates {
  final GetCategoriesResponse getCategoriesResponse;
  GetCategoriesSuccess(this.getCategoriesResponse);
}

class GetCategoriesError extends HomeStates {
  final String error;
  GetCategoriesError(this.error);
}

class GetCategoriesViewLoading extends HomeStates {}

class GetCategoriesViewSuccess extends HomeStates {
  final ShowCategoriesResponse showCategoriesResponse;
  GetCategoriesViewSuccess(this.showCategoriesResponse);
}

class GetCategoriesViewError extends HomeStates {
  final String error;
  GetCategoriesViewError(this.error);
}

class PlaceOrderLoading extends HomeStates {}

class PlaceOrderSuccess extends HomeStates {}

class PlaceOrderError extends HomeStates {
  final String error;
  PlaceOrderError(this.error);
}


class SearchLoading extends HomeStates {}

class SearchSuccess extends HomeStates {}

class SearchError extends HomeStates {
  final String error;
  SearchError(this.error);
} 