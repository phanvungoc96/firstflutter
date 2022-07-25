import 'package:flutter/material.dart';

class TimNhanhCard extends StatelessWidget {
  final void Function(String) setKeyWord;

  const TimNhanhCard({Key? key, required this.setKeyWord}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> btnData = [
      'Libero',
      'Impedit',
      'Ut ut cumque illo quisquam culpa maxime',
      'Sequi harum',
      'Minus',
      'Eos dolorem quis'
    ];

    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      padding: EdgeInsets.all(12),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerLeft,
            child: const Text(
              "TÌM NHANH",
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 8,
              direction: Axis.horizontal,
              children: btnData
                  .map((e) => OutlinedButton(
                        onPressed: () => setKeyWord(e),
                        style: OutlinedButton.styleFrom(primary: Colors.grey),
                        child: Text(e),
                      ))
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
