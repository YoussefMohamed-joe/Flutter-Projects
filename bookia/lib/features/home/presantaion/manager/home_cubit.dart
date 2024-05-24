import 'package:bookia/core/services/api_services.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/features/bookmark/data/get_wishlist_response/get_wishlist_response.dart';
import 'package:bookia/features/home/data/Models/get_products_response/get_products_response.dart';
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
}
