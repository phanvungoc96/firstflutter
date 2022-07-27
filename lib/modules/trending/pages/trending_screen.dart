import 'package:flutter/material.dart';
import 'package:my_app/modules/trending/blocs/news_trending_bloc.dart';
import 'package:my_app/modules/trending/models/news_trending.dart';
import 'package:my_app/utils/constants.dart';
import 'package:my_app/utils/extension.dart';
import 'package:my_app/widgets/header/header.dart';

import '../../../screens/detail/detail.dart';
import '../../../screens/newsWidget/news_widget.dart';
import '../widgets/item_news_leading.dart';

class TrendingScreen extends StatefulWidget {
  static const routeName = '/trending';

  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  final _newsTrendingBloc = NewsTrendingBLoc();

  @override
  void initState() {
    super.initState();
    _newsTrendingBloc.getNewsTrending();
  }

  Widget newsTrending(String title, List<NewsTrending> listNewsTrending, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, DetailPage.routeName);
      },
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            buildTitle(title),
            SizedBox(height: 10),
            ...buildListItem(listNewsTrending),
          ],
        ),
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

  List<Widget> buildListItem(List<NewsTrending> newsTrending) {
    List<Widget> content = [];

    newsTrending.asMap().forEach((index, item) => {
          content.add(ItemNewsLeading(item)),
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
        child: StreamBuilder<List<NewsTrending>?>(
            stream: _newsTrendingBloc.newsTrendingStream,
            builder: (context, snapshot) {
              if (snapshot.data == null) {
                return const SizedBox(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              if (snapshot.hasError) {
                return const SizedBox(child: Center(child: Text('Something went wrong')));
              }

              return Column(
                children: [
                  newsTrending("Đang được quan tâm", snapshot.data!, context),
                  SizedBox(height: 10),
                  newsTrending("Nóng 24H", snapshot.data!, context),
                  SizedBox(height: 10),
                  newsTrending("Góc nhìn và phân tích", snapshot.data!, context),
                ],
              );
            }),
      ),
    );
  }
}
