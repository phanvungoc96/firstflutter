part of 'news_trending_bloc.dart';

abstract class NewsTrendingEvent {}

class GetNewsTrending extends NewsTrendingEvent {}

class ClearNewsTrending extends NewsTrendingEvent {}
