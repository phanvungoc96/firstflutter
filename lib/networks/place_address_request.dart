import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_app/models/trending/news_trending.dart';

class NewsTrendingRequest {
  final String urlNewsTrending = "https://62da21679eedb699636737fb.mockapi.io/news/NewsCard";

  List<NewsTrending> parseNews(String req) {
    var list = json.decode(req) as List<dynamic>;
    List<NewsTrending> news = list.map((e) => NewsTrending.fromJson(e)).toList();
    return news;
  }

  Future<List<NewsTrending>> getNewsTrending() async {
    final response = await http.get(Uri.parse(urlNewsTrending));
    if (response.statusCode == 200) {
      return compute(parseNews, response.body);
    } else if (response.statusCode == 404) {
      throw Exception('Lỗi');
    } else {
      throw Exception('Không thể lấy tin tức ');
    }
  }
}
