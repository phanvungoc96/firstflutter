import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:my_app/modules/trending/models/news_trending.dart';
import 'package:my_app/modules/trending/repos/news_trending_repo.dart';
import '../../../networks/news_request.dart';
import '../../../networks/news_trending_request.dart';

part 'news_trending_event.dart';
part 'news_trending_state.dart';

class NewsTrendingBloc extends Bloc<NewsTrendingEvent, NewsTrendingState> {
  NewsTrendingBloc() : super(NewsTrendingInitial()) {
    on<NewsTrendingEvent>((event, emit) async {
      if (event is GetNewsTrending) {
        try {
          emit(NewsTrendingLoading());
          List<NewsTrending> data =
              await NewsTrendingRepo.instance.getNewsTrending();
          // List<NewsTrending> data = [
          //   NewsTrending(
          //       newsType: "Thời sự",
          //       imgUrl: "https://image.vtc.vn/upload/2022/07/20/ngu-dan-mat-tich-12444591.jpg",
          //       title: "Vụ ngư dân mất tích: Không thể đưa nạn nhân từ tàu cá sang tàu Cảnh sát biển",
          //       hours: "23 giờ")
          // ];
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
