import 'package:dio/dio.dart';

import 'package:dio/dio.dart';

import '../Models/post.dart';

class ApiService {
  String _url =
      "http://okphonewebapi-dev-fu.ap-southeast-1.elasticbeanstalk.com/api/";
  Dio _dio = Dio();

  ApiService() {
    _dio = Dio();
  }

  Future<List<Post>?> fetchPostData() async {
    try {
      Response response = await _dio.get(_url + "/post/user/get");
      ReponseData newsResponse = ReponseData.fromJson(response.data);
      return newsResponse.data;
    } on DioError catch (e) {
      print(e);
    }
  }
}
