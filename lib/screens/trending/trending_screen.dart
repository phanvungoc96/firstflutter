import 'package:flutter/material.dart';
import 'package:my_app/screens/newsWidget/Data/nong_news_data.dart';
import 'package:my_app/screens/trending/widget/item_news_leading.dart';
import 'package:my_app/utils/constants.dart';
import 'package:my_app/utils/extension.dart';
import 'package:my_app/widgets/header/header.dart';

import '../../models/news_model.dart';

class TrendingScreen extends StatelessWidget {
  static const routeName = '/trending';

  const TrendingScreen({Key? key}) : super(key: key);

  Widget newsTrending(String title, List<NewsModel> dataNews) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          buildTitle(title),
          SizedBox(height: 10),
          ...buildListItem(dataNews),
        ],
      ),
    );
  }

  Row buildTitle(String title) {
    return Row(
      children: [
        const Icon(Icons.trending_up, color: MyColor.primary),
        SizedBox(width: 5),
        Text(title.toUpperCase()).medium(MyColor.primary),
      ],
    );
  }

  List<Widget> buildListItem(List<NewsModel> dataNews) {
    List<Widget> content = [];

    dataNews.asMap().forEach((index, item) => {
          content.add(ItemNewsLeading(item.imgUrl, item.title, item.newsType, item.hours)),
          content.add(Divider(thickness: 1, color: Colors.black12)),
        });
    content.add(const Text("Đọc thêm").small(Colors.black));
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header("Xu hướng"),
      backgroundColor: MyColor.lightGrey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            newsTrending("Đang được quan tâm", dataNews),
            SizedBox(height: 10),
            newsTrending("Nóng 24H", dataNews),
            SizedBox(height: 10),
            newsTrending("Góc nhìn và phân tích", dataNews),
          ],
        ),
      ),
    );
  }
}
