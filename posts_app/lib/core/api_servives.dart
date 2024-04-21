import 'package:posts_app/core/constants.dart';
import 'package:posts_app/posts_model/posts_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  

  Future<List<PostsModel>> getPosts() async {
    final url = Uri.parse(ApiConstants.baseUrl+ApiConstants.post);

  }
}