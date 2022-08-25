import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:my_app/models/trending/news_trending.dart';
import 'package:my_app/utils/constants.dart';
import 'package:my_app/utils/extension.dart';
import 'package:my_app/widgets/header/header.dart';
import '../../blocs/trending/news_trending_bloc.dart';
import 'widgets/item_news_leading.dart';
import 'package:http/http.dart' as http;

class TrendingScreen extends StatefulWidget {
  static const routeName = '/trending';

  const TrendingScreen({Key? key}) : super(key: key);

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  final _controller = ScrollController();
  int _capacityLimit = 550000; // 500kb
  List<NewsTrending> _currentNewsTrending = [];
  int _sumCapacity = 0;
  Map<int, String> _itemsRendered = {};

  @override
  void initState() {
    super.initState();
    print("get news");
    BlocProvider.of<NewsTrendingBloc>(context).add(GetNewsTrending());
    _controller.addListener(() {
      print(_sumCapacity);
      // detect when scroll to last position
      // if (_controller.offset == _controller.position.maxScrollExtent) {
      //   BlocProvider.of<NewsTrendingBloc>(context).add(GetNewsTrending());
      // }
      //detect when scroll down
      if (_controller.position.userScrollDirection == ScrollDirection.reverse && _sumCapacity > _capacityLimit) {
        BlocProvider.of<NewsTrendingBloc>(context).add(GetNewsTrending());
        _capacityLimit *= 2;
      }
    });
  }

  @override
  void deactivate() {
    super.deactivate();
    BlocProvider.of<NewsTrendingBloc>(context).add(ClearNewsTrending());
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

  Future<void> calculateCapacity(String url, int index) async {
    if (!_itemsRendered.containsKey(index)) {
      Response r = await http.head(Uri.parse(url));
      final capacity = r.headers["content-length"];
      _sumCapacity += int.parse(capacity!);
      print("index - $index - capacity: $capacity - sumCapacity: $_sumCapacity");
      // add index of Item as key into Map to check, if key(item) is
      // exist(already sum capacity) -> not sum capacity
      _itemsRendered[index] = index.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header("Xu hướng"),
      backgroundColor: MyColor.lightGrey,
      body: BlocBuilder<NewsTrendingBloc, NewsTrendingState>(
        builder: (context, state) {
          if (state is NewsTrendingLoading && _currentNewsTrending.isEmpty) {
            print(" loading: ${_currentNewsTrending.length}");
            return showLoading(context);
          }
          if (state is NewsTrendingEmpty && _currentNewsTrending.isEmpty) {
            return showMsg(context, state.msg);
          }
          if (state is NewsTrendingLoaded) {
            print("loaded ${state.newsTrendingList.length}");
            _currentNewsTrending.addAll(state.newsTrendingList);
          }
          if (state is NewsTrendingError && _currentNewsTrending.isEmpty) {
            return showMsg(context, "có lỗi xảy ra, thử lại sau!");
          }
          final lastItemIndex = _currentNewsTrending.length - 1;
          return _currentNewsTrending.isNotEmpty
              ? Column(
                  children: [
                    buildTitle("Xu hướng tìm kiếm"),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        controller: _controller,
                        padding: const EdgeInsets.all(8),
                        itemCount: _currentNewsTrending.length,
                        itemBuilder: (BuildContext context, int index) {
                          print("called itemBuilder");
                          if (index >= lastItemIndex) {
                            return Container(
                              margin: EdgeInsets.only(top: 8),
                              height: 50,
                              child: Center(child: CircularProgressIndicator()),
                            );
                          }
                          calculateCapacity(_currentNewsTrending[index].imgUrl ?? "", index);
                          return ItemNewsLeading(_currentNewsTrending[index]);
                        },
                      ),
                    ),
                  ],
                )
              : SizedBox();
        },
      ),
    );
  }
}
