import 'package:flutter/material.dart';
import 'package:my_app/models/news_model.dart';
import 'package:my_app/screens/newsWidget/Data/nong_news_data.dart';

import '../audio_news.dart';
import '../news_card.dart';

class NongPager extends StatefulWidget {
  const NongPager({Key? key}) : super(key: key);

  @override
  State<NongPager> createState() => _NongPagerState();
}

class _NongPagerState extends State<NongPager> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.grey),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color.fromRGBO(0, 144, 153, 1),
                Color.fromRGBO(0, 128, 163, 1),
                Color.fromRGBO(0, 125, 163, 1),
                Color.fromRGBO(0, 106, 154, 1),
                Color.fromRGBO(0, 93, 152, 1),
              ])),
              width: double.infinity,
              child: IconButton(
                onPressed: () {},
                icon: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        primary: Colors.transparent, elevation: 0),
                    child: Row(
                      children: const <Widget>[
                        Icon(Icons.cloud_upload),
                        Padding(
                          padding: EdgeInsets.only(left: 12),
                          child: Text("Chọn địa phương"),
                        )
                      ],
                    )),
              ),
            ),
            NewsCard(
              news: NewsModel(
                  "Vụ Tịnh thất Bồng Lai: 5 bị cáo khai mồ côi, ông Lê Tùng Vân nói chờ được... lấy vợ",
                  "https://static-images.vnncdn.net/files/publish/2022/7/20/tinh-that-bong-lai-11-306.jpg",
                  "Tin tức",
                  "1 giờ"),
            ),
            const AudioNews(),
            const SizedBox(height: 4),
            Column(
              children: <Widget>[
                ...dataNews
                    .map((e) => Container(
                        margin: const EdgeInsets.only(bottom: 4),
                        child: NewsCard(news: e)))
                    .toList()
              ],
            )
          ],
        ),
      ),
    );
  }
}
