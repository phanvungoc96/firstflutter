import 'package:flutter/material.dart';

class AnotherNewsCard extends StatelessWidget {
  const AnotherNewsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = [
      'Trưởng công an huyện Đức Hòa nói về cáo buộc bắt cóc Diễm My',
      'World',
    ];
    return Container(
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
                        margin: const EdgeInsets.only(right: 10),
                        height: MediaQuery.of(context).size.width / 3,
                        child: Image(
                          height: MediaQuery.of(context).size.width / 3,
                          width: MediaQuery.of(context).size.width / 3,
                          image: NetworkImage(
                              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        ),
                      ),
                      Expanded(
                          child: SizedBox(
                              height: MediaQuery.of(context).size.width / 4,
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e,
                                    maxLines: 2,
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
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
                                        margin: const EdgeInsets.only(left: 8),
                                        child: Text('2 ngày'),
                                      )
                                    ],
                                  )
                                ],
                              ))),
                    ])))
                .toList(),
          ],
        ));
  }
}
