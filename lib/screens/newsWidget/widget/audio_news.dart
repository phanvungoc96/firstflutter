import 'package:flutter/material.dart';
import 'package:my_app/screens/newsWidget/widget/nong_item.dart';

import '../Data/nong_news_data.dart';

class AudioNews extends StatelessWidget {
  const AudioNews({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 4,
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "AUDIO",
              textAlign: TextAlign.start,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 6,
            alignment: Alignment.center,
            child: ListView.builder(
                itemCount: dataImgUrl.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return NongItem(imgUrl: dataImgUrl[index].toString());
                })),
          ),
        ],
      ),
    );
  }
}
