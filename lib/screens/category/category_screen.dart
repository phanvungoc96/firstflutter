import 'package:flutter/material.dart';
import 'package:my_app/screens/category/widget/category_grid_two.dart';
import 'package:my_app/screens/category/widget/category_vertical_list.dart';
import 'package:my_app/screens/category/widget/type_display_list.dart';
import 'package:my_app/screens/category/widget/contact_info.dart';
import 'package:my_app/screens/category/widget/hot_new_channel.dart';
import 'package:my_app/utils/enum.dart';
import 'package:my_app/widgets/header/header.dart';
import '../../utils/constants.dart';
import 'widget/read_mode.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  Widget buildListTile(String title, IconData icon, tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  DisplayList type = DisplayList.gridTwo;

  void changeTypeDisplayList() {
    setState(() {
      if (type == DisplayList.gridTwo) {
        type = DisplayList.verticalList;
      } else {
        type = DisplayList.gridTwo;
      }
    });
  }

  IconButton buildIconRight(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_forward),
      tooltip: 'Arrow forward',
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Header(
          "Chuyên mục",
          iconRights: [buildIconRight(context)],
        ),
        backgroundColor: MyColor.lightGrey,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const ReadMode(),
              const SizedBox(height: 10),
              TypeDisplayList(type, changeTypeDisplayList),
              type == DisplayList.verticalList
                  ? const CategoryVerticalList()
                  : const CategoryGridTwo(),
              const SizedBox(height: 10),
              const HotNewChannel(),
              const SizedBox(height: 10),
              const ContactInfo()
            ],
          ),
        ));
  }
}
