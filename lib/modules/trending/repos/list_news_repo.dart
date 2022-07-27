import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/news_trending.dart';

const assetKey = 'assets/news.json';

class ListNewsTrendingRepo {
  Future<List<NewsTrending>?> getNewsTrending() async {
    try {
      final json = await rootBundle.loadString(assetKey);
      final res = jsonDecode(json);

      List data = res['data'];

      return data.map((json) => NewsTrending.fromJson(json)).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }
}
