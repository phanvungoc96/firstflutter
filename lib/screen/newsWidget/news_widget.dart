import 'package:flutter/material.dart';
import 'package:my_app/screen/newsWidget/widget/tabBarViewWidget/theo_doi_pager.dart';
import 'package:my_app/screens/search/search.dart';

import './widget/tabBarViewWidget/nong_pager.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: DefaultTabController(
      length: 17,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.height / 15,
          title: const TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            isScrollable: true,
            indicatorColor: Colors.white,
            indicatorWeight: 1,
            tabs: <Widget>[
              Tab(
                text: "Theo dõi",
              ),
              Tab(
                text: "Nóng",
              ),
              Tab(
                text: "Mới",
              ),
              Tab(
                text: "Tổng hợp",
              ),
              Tab(
                text: "Bóng đá VN",
              ),
              Tab(
                text: "Bóng đá QT",
              ),
              Tab(
                text: "Độc và lạ",
              ),
              Tab(
                text: "Tình yêu",
              ),
              Tab(
                text: "Giải trí",
              ),
              Tab(
                text: "Thế giới",
              ),
              Tab(
                text: "Pháp luật",
              ),
              Tab(
                text: "Xe 360",
              ),
              Tab(
                text: "Công nghệ",
              ),
              Tab(
                text: "Ẩm thực",
              ),
              Tab(
                text: "Làm đẹp",
              ),
              Tab(
                text: "Sức khỏe",
              ),
              Tab(
                text: "Du lịch",
              ),
            ],
          ),
          elevation: 0,
          leading: const Icon(Icons.menu),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Search()));
              },
              icon: const Icon(Icons.search),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.person))
          ],
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(0, 144, 153, 1),
              Color.fromRGBO(0, 128, 163, 1),
              Color.fromRGBO(0, 125, 163, 1),
              Color.fromRGBO(0, 106, 154, 1),
              Color.fromRGBO(0, 93, 152, 1),
            ])),
          ),
        ),
        body: TabBarView(
          children: [
            const TheoDoiPager(),
            const NongPager(),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi')
          ],
        ),
      ),
    ));
  }
}

Widget buildPage(String text) => Center(child: Text(text));
