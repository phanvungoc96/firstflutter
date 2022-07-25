class NewsModels {
  String? createdAt;
  String? title;
  String? imgUrl;
  String? newsType;
  String? id;
  String? subTitle;
  String? content;
  String? subContent;

  NewsModels({
    this.createdAt,
    this.title,
    this.imgUrl,
    this.newsType,
    this.id,
    this.content,
    this.subTitle,
    this.subContent,
  });

  NewsModels.fromJson(Map<String, dynamic> json) {
    createdAt = json['createdAt'];
    title = json['title'];
    imgUrl = json['imgUrl'];
    newsType = json['newsType'];
    id = json['id'];
    subTitle = json['subTitle'];
    content = json['content'];
    subContent = json['subContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['createdAt'] = createdAt;
    data['title'] = title;
    data['imgUrl'] = imgUrl;
    data['newsType'] = newsType;
    data['id'] = id;
    data['content'] = content;
    data['subTitile'] = subTitle;
    data['subContent'] = subContent;
    return data;
  }
}
