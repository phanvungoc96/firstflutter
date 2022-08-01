import 'package:my_app/models/trending/news_trending.dart';
import '../../../networks/news_trending_request.dart';

const assetKey = 'assets/news.json';

class NewsTrendingRepo {
  NewsTrendingRepo._privateConstructor();

  // Singleton class
  static final NewsTrendingRepo instance = NewsTrendingRepo._privateConstructor();

  Future<List<NewsTrending>> getNewsTrending() async {
    try {
      return await NewsTrendingRequest().getNewsTrending();
    } catch (e) {
      throw Exception();
    }
  }
}
