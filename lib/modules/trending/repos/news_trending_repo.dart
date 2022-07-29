import 'dart:convert';
import 'package:my_app/modules/trending/models/news_trending.dart';
import '../../../networks/news_trending_request.dart';
import 'package:http/http.dart' as http;

const assetKey = 'assets/news.json';

class NewsTrendingRepo {
  NewsTrendingRepo._privateConstructor();
  static const String url = "https://62da21679eedb699636737fb.mockapi.io/news/NewsCard";

  // Singleton class
  static final NewsTrendingRepo instance = NewsTrendingRepo._privateConstructor();

  Future<List<NewsTrending>?> getNewsTrending() async {
    try {
      // final json = await rootBundle.loadString(assetKey);
      // final res = jsonDecode(json);
      // List data = res['data'];
      // return data.map((json) => NewsTrending.fromJson(json)).toList();
      final data = await NewsTrendingRequest.getNewsTrending();
      return data;
    } catch (e) {
      throw Exception();
    }
  }
}
