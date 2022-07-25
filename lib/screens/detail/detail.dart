import 'package:flutter/material.dart';
import 'package:my_app/models/News.dart';

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
          onTap: () {},
          behavior: HitTestBehavior.opaque,
          child: LoginType(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    NewsModels item = ModalRoute.of(context)?.settings.arguments as NewsModels;

    var data = [
      'Trưởng công an huyện Đức Hòa nói về cáo buộc bắt cóc Diễm My',
      'World',
    ];
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
                onPressed: () => {print("Click on back button")}),
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
                      Container(
                          padding: const EdgeInsets.only(
                              left: 12, right: 12, top: 12, bottom: 12),
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              Text(
                                item.title ?? '',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  item.createdAt ?? "",
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey),
                                ),
                              ),
                              Text(
                                item.subTitle ?? '',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                                child: Center(
                                    child: Image(
                                  image: NetworkImage(item.imgUrl ??
                                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                )),
                              ),
                              Text(
                                item.content ?? '',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.only(top: 12, bottom: 12),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Colors.grey[300],
                                  ),
                                  padding: const EdgeInsets.all(8),
                                  child: Text(
                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                                    textAlign: TextAlign.center,
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700]),
                                  ),
                                ),
                              ),
                            ],
                          )),
                      Container(
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          padding: const EdgeInsets.only(
                            left: 12,
                            top: 12,
                            bottom: 12,
                            right: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(bottom: 8),
                                child: Text(
                                  'Video',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                              Center(
                                  child: Image(
                                height: 100,
                                image: NetworkImage(
                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                              )),
                              Row(
                                children: [
                                  Image(
                                    height: 24,
                                    width: 24,
                                    image: NetworkImage(
                                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 8),
                                    child: Text(
                                      '37 phut',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey[500]),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 8),
                                child: Text(
                                  'Báo hại "Tiếng Anh" là gì?',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ),
                            ],
                          )),
                      Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(
                            12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tin khac'),
                              ...data
                                  .map((e) => Container(
                                      margin: const EdgeInsets.only(top: 10),
                                      child: Row(children: [
                                        Container(
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              3,
                                          child: Image(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            image: NetworkImage(
                                                'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                          ),
                                        ),
                                        Expanded(
                                            child: SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    4,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      e,
                                                      maxLines: 2,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Row(
                                                      children: [
                                                        Image(
                                                          height: 32,
                                                          width: 32,
                                                          image: NetworkImage(
                                                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                                        ),
                                                        Container(
                                                          margin:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 8),
                                                          child: Text('2 ngày'),
                                                        )
                                                      ],
                                                    )
                                                  ],
                                                ))),
                                      ])))
                                  .toList(),
                            ],
                          ))
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
