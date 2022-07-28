part of 'news_bloc.dart';

@immutable
abstract class NewsState {}

class NewsInitial extends NewsState {}

class ListNewsLoading extends NewsState {}

class ListNewsLoaded extends NewsState {
  final List<NewsModels> news;

  ListNewsLoaded(this.news);
}

class ListNewsError extends NewsState {
  final String ms;
  ListNewsError(this.ms);
}
