// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_trending.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewsTrending _$NewsTrendingFromJson(Map<String, dynamic> json) => NewsTrending(
      title: json['title'] as String?,
      imgUrl: json['img_url'] as String?,
      newsType: json['news_type'] as String?,
      hours: json['hours'] as int?,
    );

Map<String, dynamic> _$NewsTrendingToJson(NewsTrending instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('title', instance.title);
  writeNotNull('img_url', instance.imgUrl);
  writeNotNull('news_type', instance.newsType);
  writeNotNull('hours', instance.hours);
  return val;
}
