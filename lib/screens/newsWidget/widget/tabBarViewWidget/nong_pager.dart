import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/news/news_bloc.dart';
import 'package:my_app/widgets/loading_text_shimmer/loading_text_shimmer.dart';

import '../../../../widgets/news_card.dart';
import '../audio_news.dart';

class NongPager extends StatefulWidget {
  const NongPager({Key? key}) : super(key: key);

  @override
  State<NongPager> createState() => _NongPagerState();
}

class _NongPagerState extends State<NongPager> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews();
  }

  void getNews() {
    BlocProvider.of<NewsBloc>(context).add(GetListNews());
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
              BlocConsumer<NewsBloc, NewsState>(
                builder: (context, state) {
                  if (state is ListNewsLoading) {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: LoadingTextShimmer(
                          textStyle: TextStyle(fontSize: 25),
                        ));
                  } else if (state is ListNewsLoaded) {
                    return SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: state.news
                            .map((e) => Container(
                                margin: const EdgeInsets.only(bottom: 4),
                                child: NewsCard(news: e)))
                            .toList(),
                      ),
                    );
                  } else {
                    return SizedBox();
                  }
                },
                listener: (context, state) {
                  if (state is ListNewsError) {
                    final snackBar = SnackBar(
                      content: Text(state.ms),
                    );

                    // Find the ScaffoldMessenger in the widget tree
                    // and use it to show a SnackBar.
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
