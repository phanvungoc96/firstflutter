import 'package:flutter/material.dart';
import 'package:my_app/utils/constants.dart';
import 'package:my_app/utils/dum_data.dart';
import 'package:my_app/utils/extension.dart';

class CategoryVerticalList extends StatelessWidget {
  const CategoryVerticalList({Key? key}) : super(key: key);

  List<Widget> generateData() {
    List<Widget> content = [];
    categoryList.asMap().forEach((index, item) {
      content.add(buildItem(index, item.title));
      content.add(const Divider(color: MyColor.lightGrey, thickness: 1));
    });
    content.add(const Text("Xem tất cả").small(Colors.grey));
    return content;
  }

  Widget buildItem(int index, String title) {
    return Row(
      children: [
        Container(
          width: 32,
          height: 32,
          decoration: BoxDecoration(color: MyColor.lightGrey, borderRadius: BorderRadius.circular(10)),
          child: Center(child: Text("$index").medium(MyColor.grey)),
        ),
        const SizedBox(width: 10),
        Text(title).medium(Colors.black)
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    print("build vertival list");
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        children: generateData(),
      ),
    );
  }
}
