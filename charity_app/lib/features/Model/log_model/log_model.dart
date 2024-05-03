import 'data.dart';

class LogModel {
  String? status;
  String? token;
  Data? data;

  LogModel({this.status, this.token, this.data});

  factory LogModel.fromJson(Map<String, dynamic> json) => LogModel(
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
