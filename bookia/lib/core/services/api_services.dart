import 'package:bookia/core/constants/app_constants.dart';
import 'package:dio/dio.dart';

class ApiServices {
  static late Dio dio;
  init() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiConstat.baseUrl,
      ),
    );
  }

  static get(
      {required String url,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? body}) async {
    var res = await dio.get(
      url,
      queryParameters: body,
      options: Options(headers: headers),
    );
    return res.data;
  }

  static post(
      {required String url,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? body}) async {
    var res = await dio.post(
      url,
      queryParameters: body,
      options: Options(headers: headers),
    );
    return res.data;
  }

  static delete(
      {required String url,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? body}) async {
    var res = await dio.delete(
      url,
      queryParameters: body,
      options: Options(headers: headers),
    );
    return res.data;
  }

  static put(
      {required String url,
      Map<String, dynamic>? headers,
      Map<String, dynamic>? body}) async {
    var res = await dio.put(
      url,
      queryParameters: body,
      options: Options(headers: headers),
    );
    return res.data;
  }
}
