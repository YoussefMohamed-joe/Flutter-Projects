import 'data.dart';

class RegisterModel {
  String? status;
  String? token;
  Data? data;

  RegisterModel({this.status, this.token, this.data});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json['status'] as String?,
        token: json['token'] as String?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'token': token,
        'data': data?.toJson(),
      };
}
