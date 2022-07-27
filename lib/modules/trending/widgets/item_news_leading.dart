import 'package:flutter/material.dart';
import 'package:my_app/utils/extension.dart';
import '../../../utils/constants.dart';
import '../models/news_trending.dart';

class ItemNewsLeading extends StatelessWidget {
  final NewsTrending newsTrending;

  const ItemNewsLeading(
    this.newsTrending, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            width: 120,
            height: 80,
            newsTrending.imgUrl ?? "",
            fit: BoxFit.cover,
            filterQuality: FilterQuality.medium,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: SizedBox(
            height: 90,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(newsTrending.title ?? "").title(Colors.black, line: 2),
                Row(
                  children: [
                    Text(newsTrending.newsType ?? "").medium(MyColor.primary),
                    SizedBox(width: 3),
                    Text(" - ${newsTrending.hours}").medium(Colors.black26),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
