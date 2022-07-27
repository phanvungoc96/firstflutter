import 'dart:async';
import 'package:rxdart/rxdart.dart';
import '../models/news_trending.dart';
import '../repos/list_news_repo.dart';

abstract class BlocBase {
  void dispose();
}

class NewsTrendingBLoc extends BlocBase {
  final _newsTrendingCtrl = BehaviorSubject<List<NewsTrending>?>();

  Stream<List<NewsTrending>?> get newsTrendingStream => _newsTrendingCtrl.stream;

  Future<void> getNewsTrending() async {
    try {
      final res = await ListNewsTrendingRepo().getNewsTrending();
      if (res != null) {
        _newsTrendingCtrl.sink.add(res);
      }
    } catch (e) {
      _newsTrendingCtrl.sink.addError('Cannot fetch list posts right now!!!');
    }
  }

  @override
  void dispose() {
    _newsTrendingCtrl.close();
  }
}
