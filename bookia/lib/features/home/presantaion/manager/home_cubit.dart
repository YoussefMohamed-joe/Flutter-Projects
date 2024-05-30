import 'package:bookia/core/services/api_services.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/features/bookmark/data/get_wishlist_response/get_wishlist_response.dart';
import 'package:bookia/features/home/data/Models/get_categories_response/get_categories_response.dart';
import 'package:bookia/features/home/data/Models/get_products_response/get_products_response.dart';
import 'package:bookia/features/home/data/Models/get_search_response/get_search_response.dart';
import 'package:bookia/features/home/data/Models/get_sliders_response/get_sliders_response.dart';
import 'package:bookia/features/home/data/Models/show_categories_response/show_categories_response.dart';
import 'package:bookia/features/home/presantaion/manager/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  late GetProductsResponse getProductsResponse;
  late GetWishlistResponse getWishlistResponse;
  getProducts() async {
    emit(GetProductsLoading());
    try {
      ApiServices.get(url: 'products').then((value) {
        getProductsResponse = GetProductsResponse.fromJson(value);

        emit(GetProductsSuccess(getProductsResponse));
      });
    } catch (e) {
      emit(GetProductsError(e.toString()));
    }
  }

  addBookmark(int id) {
    emit(AddBookmarkLoadingState());
    try {
      ApiServices.post(url: 'add-to-wishlist', body: {
        'product_id': id,
      }, headers: {
        'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
      }).then((value) {
        emit(AddBookmarkSuccessState());
      });
    } catch (e) {
      emit(AddBookmarkErrorState(e.toString()));
    }
  }

  getWhishList() {
    emit(GetWhishListLoading());
    try {
      ApiServices.get(url: 'wishlist', headers: {
        'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
      }).then((value) {
        getWishlistResponse = GetWishlistResponse.fromJson(value);
        emit(GetWhishListSuccess(getWishlistResponse));
      });
    } catch (e) {
      emit(GetWhishListError(e.toString()));
    }
  }

  removeBookmark(int id) {
    emit(RemoveBookmarkLoadingState());
    try {
      ApiServices.post(url: 'remove-from-wishlist', body: {
        'product_id': id,
      }, headers: {
        'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
      }).then((value) {
        emit(RemoveBookmarkSuccessState());
      });
    } catch (e) {
      emit(RemoveBookmarkErrorState(e.toString()));
    }
  }

  getSliders() {
    emit(GetSlidersLoading());
    try {
      ApiServices.get(url: 'sliders').then((value) {
        emit(GetSlidersSuccess(GetSlidersResponse.fromJson(value)));
      });
    } catch (e) {
      emit(GetSlidersError(e.toString()));
    }
  }

  getcategories() {
    emit(GetCategoriesLoading());
    try {
      ApiServices.get(url: 'categories').then((value) {
        emit(GetCategoriesSuccess(GetCategoriesResponse.fromJson(value)));
      });
    } catch (e) {
      emit(GetCategoriesError(e.toString()));
    }
  }

  static late ShowCategoriesResponse showCategoriesResponse;
  showcategories(int id) {
    emit(GetCategoriesViewLoading());
    try {
      ApiServices.get(url: 'categories/$id').then((value) {
        showCategoriesResponse = ShowCategoriesResponse.fromJson(value);
        emit(GetCategoriesViewSuccess(showCategoriesResponse));
      });
    } catch (e) {
      emit(GetCategoriesViewError(e.toString()));
    }
  }

  placeOrder(
      {required String name,
      required String email,
      required String phone,
      required String governorateId,
      required String address}) {
    emit(PlaceOrderLoading());
    try {
      ApiServices.post(
        url: 'place-order',
        body: {
          'name': name,
          'email': email,
          'phone': phone,
          'governorate_id': governorateId,
          'address': address
        },
        headers: {
          'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
        },
      ).then((value) {
        emit(PlaceOrderSuccess());
      });
    } catch (e) {
      emit(PlaceOrderError(e.toString()));
    }
  }

  static late GetSearchResponse searchResponse;
    search(String id) {
    emit(SearchLoading());
    try {
      ApiServices.get(url: 'products-search?name=$id').then((value) {
        searchResponse = GetSearchResponse.fromJson(value);
        emit(SearchSuccess());
      });
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}
