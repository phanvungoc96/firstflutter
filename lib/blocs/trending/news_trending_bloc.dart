import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_app/models/trending/news_trending.dart';
import 'package:my_app/screens/trending/repo/news_trending_repo.dart';
import '../../networks/news_request.dart';
import '../../networks/news_trending_request.dart';

part 'news_trending_event.dart';
part 'news_trending_state.dart';

class NewsTrendingBloc extends Bloc<NewsTrendingEvent, NewsTrendingState> {
  NewsTrendingBloc() : super(NewsTrendingInitial()) {
    on<NewsTrendingEvent>((event, emit) async {
      if (event is GetNewsTrending) {
        try {
          emit(NewsTrendingLoading());
          List<NewsTrending> data = await NewsTrendingRepo.instance.getNewsTrending();
          if (data.isNotEmpty) {
            emit(NewsTrendingLoaded(data));
          } else {
            emit(NewsTrendingEmpty("Chưa có bảng tin nào hôm nay!"));
          }
        } catch (e) {
          emit(NewsTrendingError("Có lỗi xảy ra : call api getNewsTrending()"));
        }
      }
    });
  }
}
