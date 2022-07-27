import 'package:flutter/material.dart';
import 'package:my_app/screens/newsWidget/Data/follow_data.dart';

import '../../utils/constants.dart';

class SuggestFollow extends StatelessWidget {
  const SuggestFollow({Key? key}) : super(key: key);

  static const routeName = '/suggestFollow';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: MyColor.colorHeader)),
        ),
        title: const Text('Nguồn tin đề xuất'),
      ),
      body: ListView.builder(
        itemCount: followData.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            title: Text(followData[index].title),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                followData[index].urlImage,
              ),
            ),
            trailing: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Color.fromRGBO(27, 168, 159, 1),
              ),
              child: const Text(
                "Theo dõi",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
