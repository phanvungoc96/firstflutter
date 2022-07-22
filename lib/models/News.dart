class NewsModels {
  String? createdAt;
  String? title;
  String? imgUrl;
  String? newsType;
  String? id;

  NewsModels({this.createdAt, this.title, this.imgUrl, this.newsType, this.id});

  NewsModels.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    title = json['title'];
    imgUrl = json['imgUrl'];
    newsType = json['newsType'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['title'] = title;
    data['imgUrl'] = imgUrl;
    data['newsType'] = newsType;
    data['id'] = id;
    return data;
  }
}
