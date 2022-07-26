import 'package:flutter/material.dart';
import 'package:my_app/networks/networks_request.dart';

import '../../../../models/News.dart';
import '../../../../widgets/news_card.dart';
import '../audio_news.dart';

class NongPager extends StatefulWidget {
  const NongPager({Key? key}) : super(key: key);

  @override
  State<NongPager> createState() => _NongPagerState();
}

class _NongPagerState extends State<NongPager> {
  List<NewsModels> _newsData = [];
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    getNews();
  }

  void getNews() {
    setState(() {});
    NetWorksRequest.fetchNews('News').then((value) {
      setState(() {
        _newsData = value;
      });
    }).catchError((e) {
      print(e);
    });
  }

  Future<void> refreshNews() async {
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(225, 224, 229, 1)),
      child: RefreshIndicator(
        onRefresh: refreshNews,
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
              const AudioNews(),
              const SizedBox(height: 4),
              Column(
                children: <Widget>[
                  ..._newsData
                      .map((e) => Container(
                          margin: const EdgeInsets.only(bottom: 4),
                          child: NewsCard(news: e)))
                      .toList()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
