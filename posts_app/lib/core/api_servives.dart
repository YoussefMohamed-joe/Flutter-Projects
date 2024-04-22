import 'dart:convert';

import 'package:posts_app/core/constants.dart';
import 'package:posts_app/posts_model/posts_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  

  Future<List<PostsModel>> getPosts() async {
    final url = Uri.parse(ApiConstants.baseUrl+ApiConstants.post);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonModel = jsonDecode(response.body) as List;
      List<PostsModel> posts = jsonModel.map((e) {
        return PostsModel.fromJson(e);
      }).toList();
      return posts;
    } else {
      throw Exception('Failed to load posts');
    }
  }
}