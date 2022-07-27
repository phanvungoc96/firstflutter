import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_app/models/News.dart';
import 'package:my_app/networks/news_request.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc() : super(ListNewsLoading()) {
    on<NewsEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is GetListNews) {
        try {
          List<NewsModels> newsData = await NewsRequest.fetchNews();
          if (newsData.isNotEmpty) {
            emit(ListNewsLoaded(newsData));
          } else {
            throw Exception('Không có dữ liệu');
          }
        } catch (e) {
          emit(ListNewsError(e.toString()));
        }
      }
    });
  }
}
