import 'package:charity_app/core/constants/app_constants.dart';
import 'package:charity_app/core/functions/navigator.dart';
import 'package:charity_app/core/services/local_storage.dart';
import 'package:charity_app/core/widgets/nav_bar_view.dart';
import 'package:charity_app/features/data/Model/cart_model/cart_model.dart';
import 'package:charity_app/features/data/Model/get_donation_history_response/get_donation_history_response.dart';
import 'package:charity_app/features/data/Model/log_model/log_model.dart';
import 'package:charity_app/features/data/Model/organisations_model/organisations_model.dart';
import 'package:charity_app/features/data/Model/payment_stripe/payment_stripe.dart';
import 'package:charity_app/features/data/Model/register_model/register_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class ApiServices {
  static Future<LogModel?> postLogin(String email, String password) async {
    try {
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
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<RegisterModel?> postSignUp(String email, String password,
      String name, String phoneNumber, String confirmPassword) async {
    try {
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
    } catch (e) {
      return null;
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
    await Dio().post('${AppConstants.baseUrl}${AppConstants.cart}',
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
    try {
      var response =
          await Dio().get('${AppConstants.baseUrl}${AppConstants.cart}',
              options: Options(
                headers: {
                  'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
                },
              ));
      if (response.statusCode == 200) {
        return CartModel.fromJson(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future deleteAllCart() async {
    await Dio().delete('${AppConstants.baseUrl}${AppConstants.cart}',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
          },
        ));
  }

  static Future deleteCart(String id) async {
    await Dio().delete('${AppConstants.baseUrl}${AppConstants.cart}/$id',
        options: Options(
          headers: {
            'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
          },
        ));
  }

  static Future<void> makePayment(context) async {
    String? clientSecret;
    await getClientSecret().then((value) {
      clientSecret = value!.paymentIntent!.clientSecret;
    });

    await initializePaymentSheet(clientSecret!);
    await Stripe.instance.presentPaymentSheet();
    deleteAllCart();
    Future.delayed(const Duration(seconds: 1, milliseconds: 500)).then((value) {
      navigateTo(context, const NavBar(index: 0,));
    });
    
  }

  static Future<void> initializePaymentSheet(String clientSecret) async {
    await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
      paymentIntentClientSecret: clientSecret,
      merchantDisplayName: "Ziad",
    ));
  }

  static Future<PaymentStripe?> getClientSecret() async {
    var response =
        await Dio().get('${AppConstants.baseUrl}${AppConstants.payment}',
            options: Options(
              headers: {
                'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
              },
            ));
    if (response.statusCode == 200) {
      return PaymentStripe.fromJson(response.data);
    }
    return null;
  }

    static Future<GetDonationHistoryResponse?> getDonationHistoryResponse() async {
    var response =
        await Dio().get('${AppConstants.baseUrl}${AppConstants.donation}',
            options: Options(
              headers: {
                'Authorization': 'Bearer ${AppLocalStorage.getData('token')}',
              },
            ));
    if (response.statusCode == 200) {
      return GetDonationHistoryResponse.fromJson(response.data);
    }
    return null;
  }
}
