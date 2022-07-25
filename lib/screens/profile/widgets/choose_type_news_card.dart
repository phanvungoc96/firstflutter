import 'package:flutter/material.dart';

class ChooseTypeNewsCard extends StatelessWidget {
  const ChooseTypeNewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
              spacing: 8,
              runSpacing: 8,
              direction: Axis.horizontal,
              children: const <Widget>[
                ItemType(
                    title: 'Đã đánh dấu', iconData: Icons.ads_click_outlined),
                ItemType(
                  title: 'Đang theo dõi',
                  iconData: Icons.check_circle_outline,
                ),
                ItemType(
                  title: 'Đọc online',
                  iconData: Icons.online_prediction_outlined,
                ),
                ItemType(
                  title: 'Đọc gần đây',
                  iconData: Icons.access_time_outlined,
                ),
              ]),
        ),
      ),
    );
  }
}

class ItemType extends StatelessWidget {
  final String title;
  final IconData iconData;
  const ItemType({
    Key? key,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return SizedBox(
        width: constraint.maxWidth / 2 - 4,
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.greenAccent,
              child: Icon(
                iconData,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 8),
            Text(title)
          ],
        ),
      );
    });
  }
}
