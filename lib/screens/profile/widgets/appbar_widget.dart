import 'package:flutter/material.dart';

import '../../detail/bottomModal.dart';

class AppBarWidget extends StatelessWidget {
  final String name;
  final String urlImg;
  final bool isSmall;

  const AppBarWidget(
      {Key? key, this.name = 'Unknow', this.urlImg = '', this.isSmall = false})
      : super(key: key);

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
    return GestureDetector(
      onTap: urlImg.isEmpty ? () => showModal(context) : () {},
      child: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            //or 15.0
            child: SizedBox(
              height: isSmall ? 40 : 60,
              width: isSmall ? 40 : 60,
              child: urlImg.isEmpty
                  ? Icon(Icons.person)
                  : Image.network(
                      urlImg,
                    ),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            name,
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          )
        ],
      ),
    );
  }
}
