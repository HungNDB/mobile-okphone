import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:okphone/Api/api.dart';

import '../models/post.dart';

class PostsProvider with ChangeNotifier {
  List<Post> _postList = [];

  List<Post> get orderDetailList {
    return [..._postList];
  }

  List<Post> get leagueMatches {
    return [..._postList];
  }

  static List<Post>? parsePagePost(Map<String, dynamic> responseBody) {
    final parsedData = ReponseData.fromJson(responseBody);
    return parsedData.data;
  }

  Future<List<Post>> fetchPost() async {
    var options = BaseOptions(
      baseUrl:
          "http://okphonewebapi-dev-fu.ap-southeast-1.elasticbeanstalk.com/api/",
    );
    try {
      Dio dio = Dio(options);
      dio.interceptors.add(DioCacheManager(CacheConfig(
              baseUrl:
                  "http://okphonewebapi-dev-fu.ap-southeast-1.elasticbeanstalk.com/api/"))
          .interceptor);
      var response = await dio.get('/post/user/get',
          options: buildCacheOptions(
            Duration(days: 3),
            maxStale: Duration(days: 7),
            forceRefresh: true,
          ));
      if (response.statusCode == 200) {
        _postList = parsePagePost(response.data)!;
        return _postList;
        //notifyListeners();
      } else {
        print("An error occurred");
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print("ERROR RESPONSE + ${e.response!.data}");
        print("ERROR HEADER + ${e.response!.headers}");
        print("ERROR OPTIONS + ${e.response!.requestOptions}");
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
    return _postList;
  }
}
