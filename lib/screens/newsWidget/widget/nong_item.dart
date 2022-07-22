import 'package:flutter/material.dart';

class NongItem extends StatelessWidget {
  final String imgUrl;
  const NongItem({Key? key, required this.imgUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8, top: 8),
      width: MediaQuery.of(context).size.width / 1.3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          imgUrl,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
