import 'package:charity_app/core/constants/app_constants.dart';
import 'package:charity_app/core/services/local_storage.dart';
import 'package:charity_app/features/data/Model/cart_model/cart_model.dart';
import 'package:charity_app/features/data/Model/log_model/log_model.dart';
import 'package:charity_app/features/data/Model/organisations_model/organisations_model.dart';
import 'package:charity_app/features/data/Model/register_model/register_model.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static Future<LogModel?> postLogin(String email, String password) async {
    var response = await Dio().post(
      '${AppConstants.baseUrl}${AppConstants.login}',
      data: {
        "email": email,
        "password": password,
      },
    );
    if (response.statusCode == 200) {
      return LogModel.fromJson(response.data);
    }
    return null;
  }

  static Future<RegisterModel?> postSignUp(String email, String password,
      String name, String phoneNumber, String confirmPassword) async {
    var response = await Dio().post(
      '${AppConstants.baseUrl}${AppConstants.signUp}',
      data: {
        "name": name,
        "email": email,
        "password": password,
        "passwordConfirm": confirmPassword,
        "phoneNumber": phoneNumber
      },
    );
    if (response.statusCode == 201) {
      return RegisterModel.fromJson(response.data);
    }
    return null;
  }

  static Future<OrganisationsModel?> getOrg() async {
    var response =
        await Dio().get('${AppConstants.baseUrl}${AppConstants.organizations}');
    if (response.statusCode == 200) {
      return OrganisationsModel.fromJson(response.data);
    }
    return null;
  }

  static Future postCart(
      String organizationId, String donationItemId, int quantity) async {
    await Dio().post(
      '${AppConstants.baseUrl}${AppConstants.cart}',
      
      data: {
        "organizationId": organizationId,
        "donationItemId": donationItemId,
        "quantity": quantity
      },
      options: Options(
  headers: {
    'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
  },
    ));

    return null;
  }

  static Future<CartModel?> getAllCarts() async {
    var response =
        await Dio().get('${AppConstants.baseUrl}${AppConstants.cart}',options: Options(
  headers: {
    'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
  },
    ));
    if (response.statusCode == 200) {
      return CartModel.fromJson(response.data);
    }else if (response.statusCode == 404){
      return null;
    }
    return null;
  }

    static Future deleteCart(String id) async {
    await Dio().delete('${AppConstants.baseUrl}${AppConstants.cart}/$id',options: Options(
  headers: {
    'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
  },
    ));
    
  }
}
