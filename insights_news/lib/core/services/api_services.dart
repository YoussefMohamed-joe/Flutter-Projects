import 'package:dio/dio.dart';
import 'package:insights_news/core/constants/app_constants.dart';
import 'package:insights_news/features/Model/new_model/new_model.dart';

class ApiServices{

  static Future<NewModel?> getNewsCategory() async{

    var response = await Dio().get('${AppConstants.baseUrl}${AppConstants.topHeadlines}?country=us&&category=sports&&apiKey=${AppConstants.apiKey}');
    if(response.statusCode == 200){
      return NewModel.fromJson(response.data);
    }
    return null;
  }
}