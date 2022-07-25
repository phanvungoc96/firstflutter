import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/News.dart';

class NetWorksRequest {
  static const String url = "https://62da21679eedb699636737fb.mockapi.io/news/";

  static List<NewsModels> parseNews(String req) {
    var list = json.decode(req) as List<dynamic>;
    List<NewsModels> news = list.map((e) => NewsModels.fromJson(e)).toList();
    return news;
  }

  static Future<List<NewsModels>> fetchNews(String model) async {
    final response = await http.get(Uri.parse(url + model));
    if (response.statusCode == 200) {
      return compute(parseNews, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Lỗi');
    } else {
      throw Exception('Không thể lấy tin tức ');
    }
  }
}
