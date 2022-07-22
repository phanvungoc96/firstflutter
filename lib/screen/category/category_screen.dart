import 'package:flutter/material.dart';
import 'package:my_app/screen/category/widget/category_grid_two.dart';
import 'package:my_app/screen/category/widget/category_vertical_list.dart';
import 'package:my_app/screen/category/widget/type_display_list.dart';
import 'package:my_app/screen/category/widget/contact_info.dart';
import 'package:my_app/screen/category/widget/hot_new_channel.dart';
import 'package:my_app/utils/enum.dart';
import '../../utils/constants.dart';
import 'widget/header_category.dart';
import 'widget/read_mode.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  const CategoryScreen({Key? key, required this.title}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: MyColor.lightGrey,
          appBar: const HeaderCategory(),
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                const ReadMode(),
                const SizedBox(height: 10),
                TypeDisplayList(type, changeTypeDisplayList),
                type == DisplayList.verticalList ? const CategoryVerticalList() : const CategoryGridTwo(),
                const SizedBox(height: 10),
                const HotNewChannel(),
                const SizedBox(height: 10),
                const ContactInfo()
              ],
            ),
          )),
    );
  }
}
