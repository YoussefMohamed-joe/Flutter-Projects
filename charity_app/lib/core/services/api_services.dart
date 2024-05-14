
import 'dart:developer';

import 'package:charity_app/core/constants/app_constants.dart';
import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/services/local_storage.dart';
import 'package:charity_app/core/widgets/nav_bar_view.dart';
import 'package:charity_app/features/data/Model/cart_model/cart_model.dart';
import 'package:charity_app/features/data/Model/log_model/log_model.dart';
import 'package:charity_app/features/data/Model/organisations_model/organisations_model.dart';
import 'package:charity_app/features/data/Model/register_model/register_model.dart';

import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

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
      log(response.data.toString());
      return LogModel.fromJson(response.data);
    }else if (response.statusCode == 400) {
     log(response.data.toString());
    return null;
    }
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


  static Future<void> makePayment(context,int amount,String currency) async {
    try{
    String clientSecret = await getClientSecret((amount*100).toString(),currency);
    await initializePaymentSheet(clientSecret);
    await Stripe.instance.presentPaymentSheet();
    navigateTo(context, const NavBar());
    }
    catch(e){
      throw Exception(e.toString());
    }
    
  }
 static Future<void> initializePaymentSheet(String clientSecret) async {
    
    await Stripe.instance.initPaymentSheet(paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: clientSecret,
      merchantDisplayName: "joe",
    ));

  }

  static Future<String> getClientSecret(String amount,String currency) async {
    var response = await Dio().post(
      'https://api.stripe.com/v1/payment_intents',
      data: {
        "amount": amount,
        "currency": currency
      },
      options: Options(
  headers: {
    'Authorization': 'Bearer ${AppConstants.secretKey}',
    'Content-Type': 'application/x-www-form-urlencoded',
  },
    ));
    return response.data['client_secret'];
  }

  static Future getPayment() async {
    await Dio().get(
      'https://checkout.stripe.com/c/pay/cs_test_a1rm5nMhid7ZbjLrn4niIhrMAiDQG5U4ISko3OmNWywzGxzSSno3mn6Q70#fidkdWxOYHwnPyd1blpxYHZxWjA0VTFqfDNDfTx8VHJIfXFBc1xMdE1yYGxtMjRwaXZ3d3R3PDJXSTNvMEJrVjd9SENLZ0BdMWlPf21fazJWMFY3dHF%2FXURQPGxGUX91MFxoR09pb3VzNU4xNTVPV2dLRkFfTicpJ2N3amhWYHdzYHcnP3F3cGApJ2lkfGpwcVF8dWAnPyd2bGtiaWBabHFgaCcpJ2BrZGdpYFVpZGZgbWppYWB3dic%2FcXdwYHgl',

      options: Options(
  headers: {
    'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
  },
    ));

    return null;
  }
}
