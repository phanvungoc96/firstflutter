import 'package:json_annotation/json_annotation.dart';

part 'news_trending.g.dart';

@JsonSerializable()
class NewsTrending {
  @JsonKey(name: 'title', includeIfNull: false)
  final String? title;

  @JsonKey(name: 'img_url', includeIfNull: false)
  final String? imgUrl;

  @JsonKey(name: 'news_type', includeIfNull: false)
  final String? newsType;

  @JsonKey(name: 'hours', includeIfNull: false)
  final int? hours;

  NewsTrending({
    this.title,
    this.imgUrl,
    this.newsType,
    this.hours,
  });
  factory NewsTrending.fromJson(Map<String, dynamic> json) => _$NewsTrendingFromJson(json);

  Map<String, dynamic> toJson() => _$NewsTrendingToJson(this);
}
