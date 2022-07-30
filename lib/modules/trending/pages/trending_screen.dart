import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/modules/trending/blocs/news_trending_bloc.dart';
import 'package:my_app/modules/trending/models/news_trending.dart';
import 'package:my_app/utils/constants.dart';
import 'package:my_app/utils/extension.dart';
import 'package:my_app/widgets/header/header.dart';

import '../../../networks/news_trending_request.dart';
import '../../../screens/detail/detail.dart';
import '../widgets/item_news_leading.dart';

class TrendingScreen extends StatefulWidget {
  static const routeName = '/trending';

  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsTrendingBloc>(context).add(GetNewsTrending());
  }

  double getH(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double getW(BuildContext context) {
    return MediaQuery.of(context).size.width;
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
        child: BlocBuilder<NewsTrendingBloc, NewsTrendingState>(
          builder: (context, state) {
            if (state is NewsTrendingLoading) {
              return SizedBox(
                width: getW(context),
                height: getH(context),
                child: Center(child: CircularProgressIndicator()),
              );
            } else if (state is NewsTrendingEmpty) {
              return SizedBox(
                width: getW(context),
                height: getH(context),
                child: Center(child: Text(state.msg)),
              );
            } else if (state is NewsTrendingLoaded) {
              return Column(children: [
                newsTrending("Đang được quan tâm", state.newsTrendingList, context),
                SizedBox(height: 10),
                newsTrending("Nóng 24H", state.newsTrendingList, context),
                SizedBox(height: 10),
                newsTrending("Góc nhìn và phân tích", state.newsTrendingList, context),
              ]);
            } else {
              return SizedBox(
                width: getW(context),
                height: getH(context),
                child: Center(child: Text("có lỗi xảy ra, thử lại sau!")),
              );
            }
          },
        ),
      ),
    );
  }
}
