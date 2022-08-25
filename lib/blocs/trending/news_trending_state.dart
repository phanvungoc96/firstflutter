part of 'news_trending_bloc.dart';

@immutable
abstract class NewsTrendingState extends Equatable {}
// Equatable compare old and new state are the same? avoid emit state duplicate

class NewsTrendingInitial extends NewsTrendingState {
  @override
  List<Object?> get props => [];
}

class NewsTrendingLoading extends NewsTrendingState {
  @override
  List<Object?> get props => [];
}

class NewsTrendingLoaded extends NewsTrendingState {
  final List<NewsTrending> newsTrendingList;

  NewsTrendingLoaded(this.newsTrendingList);

  @override
  List<Object?> get props => [...newsTrendingList];
}

class NewsTrendingEmpty extends NewsTrendingState {
  final String msg;

  NewsTrendingEmpty(this.msg);

  @override
  List<Object?> get props => [msg];
}

class NewsTrendingError extends NewsTrendingState {
  final String errMsg;

  NewsTrendingError(this.errMsg);

  @override
  List<Object?> get props => [errMsg];
}
