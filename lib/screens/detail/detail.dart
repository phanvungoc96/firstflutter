import 'package:flutter/material.dart';
import 'package:my_app/models/News.dart';
import 'package:my_app/screens/detail/wigets/Anorther_news_card.dart';
import 'package:my_app/screens/detail/wigets/news_details_item_card.dart';
import 'package:my_app/screens/detail/wigets/video_item.dart';

import './bottomModal.dart';

class DetailPage extends StatefulWidget {
  static const routeName = '/detail';
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int number = 0;

  void showModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return GestureDetector(
          onTap: () => Navigator.of(ctx).pop(), // Closing the sheet.
          behavior: HitTestBehavior.opaque,
          child: LoginType(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    NewsModels item = ModalRoute.of(context)?.settings.arguments as NewsModels;
    return Scaffold(
        appBar: AppBar(
            title: Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Centers horizontally
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Centers vertically
                children: <Widget>[
                  Text(
                    "Việt Nam Báo",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    color: Colors.black,
                    onPressed: () => showModal(context),
                  ),
                ]),
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => {
                      Navigator.pop(context),
                    }),
            actions: <Widget>[
              IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Colors.black,
                  ),
                  onPressed: () => {print("Click on settings button")}),
            ]),
        body: Container(
            color: Colors.grey[300],
            child: RefreshIndicator(
              color: Colors.white,
              backgroundColor: Colors.blue,
              strokeWidth: 4.0,
              onRefresh: resfreshEventList,
              child: SingleChildScrollView(
                  reverse: false,
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      NewsDetailsItem(item: item),
                      const SizedBox(height: 8),
                      VideoItem(),
                      const SizedBox(height: 8),
                      AnotherNewsCard()
                    ],
                  )),
            )));
  }

  Future<Null> resfreshEventList() async {
    await Future.delayed(Duration(seconds: 2));

    // setState(() {
    //   events = EventsList();
    // });
    setState(() {
      number = number + 1;
    });
    print("Refresh Pressed");
    return null;
  }
}
