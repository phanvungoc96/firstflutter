import 'package:flutter/material.dart';
import 'package:my_app/models/News.dart';

class NewsDetailsItem extends StatelessWidget {
  final NewsModels item;
  const NewsDetailsItem({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:
            const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 12),
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
              margin: const EdgeInsets.only(top: 12, bottom: 12),
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
            const SizedBox(height: 8),
            Text(
              item.content ?? '',
              style: TextStyle(color: Colors.black),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 12),
              child: Center(
                  child: Image(
                image: NetworkImage(item.imgUrl ??
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
              )),
            ),
            Text(
              item.subContent ?? '',
              style: TextStyle(fontSize: 14, color: Colors.black),
            ),
            Container(
              margin: const EdgeInsets.only(top: 12, bottom: 12),
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
        ));
  }
}
