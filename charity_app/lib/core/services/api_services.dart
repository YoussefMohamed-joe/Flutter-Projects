import 'package:charity_app/core/constants/app_constants.dart';
import 'package:charity_app/features/Model/log_model/log_model.dart';
import 'package:charity_app/features/Model/organisations_model/organisations_model.dart';
import 'package:charity_app/features/Model/register_model/register_model.dart';
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
    var response = await Dio().get('${AppConstants.baseUrl}${AppConstants.organizations}');
    if (response.statusCode == 200) {
      return OrganisationsModel.fromJson(response.data);
    }
    return null;
  }
}
