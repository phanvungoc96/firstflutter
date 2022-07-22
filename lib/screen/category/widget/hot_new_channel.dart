import 'package:flutter/material.dart';
import 'package:my_app/utils/dum_data.dart';
import 'package:my_app/utils/extension.dart';
import '../../../model/new_channel.dart';
import '../../../utils/constants.dart';

class HotNewChannel extends StatelessWidget {
  const HotNewChannel({Key? key}) : super(key: key);

  Expanded buildItem(NewsChannel item) {
    return Expanded(
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: NetworkImage(item.urlImage),
            backgroundColor: Colors.transparent,
            radius: 24.0,
          ),
          const SizedBox(height: 4),
          Text(item.title).small(Colors.black),
        ],
      ),
    );
  }

  List<Widget> generateData() {
    List<Widget> content = [];
    for (var i = 0; i < newChannelList.length; i += 4) {
      content.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildItem(newChannelList[i]),
          buildItem(newChannelList[i + 1]),
          buildItem(newChannelList[i + 2]),
          buildItem(newChannelList[i + 3]),
        ],
      ));
      content.add(const SizedBox(height: 10));
    }
    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        children: [
          const Text("NGUỒN BÁO NỔI BẬT").mediumCenterLeft(MyColor.grey),
          const SizedBox(height: 8),
          ...generateData(),
          const SizedBox(height: 10),
          const Divider(thickness: 1, color: MyColor.lightGrey),
          const Text("Xem tất cả").small(Colors.grey)
        ],
      ),
    );
  }
}
