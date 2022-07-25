import 'package:flutter/material.dart';
import 'package:my_app/models/News.dart';

class NewsCard extends StatelessWidget {
  final NewsModels news;

  const NewsCard({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          elevation: 0,
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/detail', arguments: news);
        },
        child: Column(
          children: <Widget>[
            Image.network(news.imgUrl!),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    news.newsType!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  Text(
                    news.createdAt!,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                  )
                ],
              )),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              news.title!,
              style: const TextStyle(fontSize: 16, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
