import 'package:bookia/core/services/api_services.dart';
import 'package:bookia/core/services/local_storage.dart';
import 'package:bookia/features/cart/data/get_cart_response/get_cart_response.dart';
import 'package:bookia/features/cart/data/get_gover_response/get_gover_response.dart';
import 'package:bookia/features/cart/presentation/manager/cart_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartStates> {
  CartCubit() : super(CartInitial());
  late GetCartResponse getCartResponse;
  getAllCart() {
    emit(CartLoading());
    try {
      ApiServices.get(url: 'cart', headers: {
        'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
      }).then((value) {
        getCartResponse = GetCartResponse.fromJson(value);
        emit(CartSuccess(getCartResponse: getCartResponse));
      });
    } catch (e) {
      emit(CartError(error: e.toString()));
    }
  }

  addCart(int id) {
    emit(AddToCartLoading());
    try {
      ApiServices.post(url: 'add-to-cart', body: {
        'product_id': id,
      }, headers: {
        'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
      }).then((value) {
        emit(AddToCartSuccess());
      });
    } catch (e) {
      emit(AddToCartError(error: e.toString()));
    }
  }

  removeCart(int id) {
    emit(RemoveFromCartLoading());
    try {
      ApiServices.post(url: 'remove-from-cart', body: {
        'cart_item_id': id,
      }, headers: {
        'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
      }).then((value) {
        emit(RemoveFromCartSuccess());
      });
    } catch (e) {
      emit(RemoveFromCartError(error: e.toString()));
    }
  }

  postQuantity(int id, int quantity) {
    emit(CartQuantityLoading());
    try {
      ApiServices.post(url: 'update-cart', body: {
        'cart_item_id': id,
        'quantity': quantity,
      }, headers: {
        'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
      }).then((value) {
        emit(CartQuantitySuccess());
      });
    } catch (e) {
      emit(CartQuantityError(error: e.toString()));
    }
  }

  List<int> quantity = [];

  setQuantity(int index, int quant) {
    if (quantity.length < index + 1) {
      quantity.add(quant);
    } else {
      quantity[index] = quant;
    }
    emit(QuantityUpdatedState());
  }

  int getQuantity(int index) {
    return quantity[index];
  }

  addQuntity(int index) {
    quantity[index]++;
    emit(QuantityUpdatedState());
  }

  removeQuntity(int index) {
    if (quantity[index] > 1) {
      quantity[index]--;
    }
    emit(QuantityUpdatedState());
  }

  getGover() {
    ApiServices.get(
      url: 'governorates',
    ).then((value) {
      emit(GoveenaratedState(governorate: GetGoverResponse.fromJson(value)));
    });
  }
}
