import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/models/trending/news_trending.dart';
import 'package:my_app/utils/constants.dart';
import 'package:my_app/utils/extension.dart';
import 'package:my_app/widgets/header/header.dart';
import '../../blocs/trending/news_trending_bloc.dart';
import 'widgets/item_news_leading.dart';

class TrendingScreen extends StatefulWidget {
  static const routeName = '/trending';

  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  final _controller = ScrollController();
  List<NewsTrending> _currentNewsTrending = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsTrendingBloc>(context).add(GetNewsTrending());
    _controller.addListener(() {
      if (_controller.offset == _controller.position.maxScrollExtent) {
        BlocProvider.of<NewsTrendingBloc>(context).add(GetNewsTrending());
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  double getH(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double getW(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  SizedBox showMsg(BuildContext context, String msg) {
    return SizedBox(
      width: getW(context),
      height: getH(context),
      child: Center(child: Text(msg)),
    );
  }

  SizedBox showLoading(BuildContext context) {
    return SizedBox(
      width: getW(context),
      height: getH(context),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget buildTitle(String title) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Row(
        children: [
          const Icon(Icons.trending_up, color: MyColor.primary),
          SizedBox(width: 5),
          Text(title.toUpperCase()).medium(MyColor.primary),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header("Xu hướng"),
      backgroundColor: MyColor.lightGrey,
      body: BlocBuilder<NewsTrendingBloc, NewsTrendingState>(
        builder: (context, state) {
          if (state is NewsTrendingLoading && _currentNewsTrending.isEmpty) {
            return showLoading(context);
          } else if (state is NewsTrendingEmpty && _currentNewsTrending.isEmpty) {
            return showMsg(context, state.msg);
          } else if (state is NewsTrendingLoaded) {
            _currentNewsTrending.addAll(state.newsTrendingList);
          } else if (state is NewsTrendingError && _currentNewsTrending.isEmpty) {
            return showMsg(context, "có lỗi xảy ra, thử lại sau!");
          }
          final lastItemIndex = _currentNewsTrending.length - 1;
          return Column(
            children: [
              buildTitle("Xu hướng tìm kiếm"),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  controller: _controller,
                  padding: const EdgeInsets.all(8),
                  itemCount: _currentNewsTrending.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index >= lastItemIndex) {
                      return Container(
                        margin: EdgeInsets.only(top: 8),
                        height: 50,
                        child: Center(child: CircularProgressIndicator()),
                      );
                    }
                    return ItemNewsLeading(_currentNewsTrending[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
