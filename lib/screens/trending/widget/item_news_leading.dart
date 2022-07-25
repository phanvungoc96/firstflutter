import 'package:flutter/material.dart';
import 'package:my_app/utils/extension.dart';

import '../../../utils/constants.dart';

class ItemNewsLeading extends StatelessWidget {
  final String urlImage;
  final String text;
  final String newsType;
  final String hours;

  const ItemNewsLeading(
    this.urlImage,
    this.text,
    this.newsType,
    this.hours, {
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
            urlImage,
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
                Text(text, maxLines: 1, overflow: TextOverflow.ellipsis).title(Colors.black),
                Row(
                  children: [
                    Text(newsType).medium(MyColor.primary),
                    SizedBox(width: 3),
                    Text(" - $hours").medium(Colors.black26),
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
