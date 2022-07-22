import 'package:flutter/material.dart';
import 'package:my_app/models/category.dart';
import 'package:my_app/utils/dum_data.dart';
import 'package:my_app/utils/extension.dart';
import 'package:my_app/utils/img_helper.dart';

import '../../../utils/constants.dart';

class CategoryGridTwo extends StatelessWidget {
  const CategoryGridTwo({Key? key}) : super(key: key);

  List<Widget> generateView() {
    List<Widget> content = [];
    for (int i = 0; i < categoryList.length; i += 2) {
      content.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: renderItem(categoryList[i])),
          const SizedBox(width: 8),
          i + 2 == categoryList.length
              ? Expanded(child: renderItemAdd())
              : Expanded(child: renderItem(categoryList[i + 1]))
        ],
      ));
      content.add(const SizedBox(height: 8));
    }
    return content;
  }

  Widget renderItem(Category item) {
    return ImageHelper.instance().loadCacheImg(120, 120, item.urlImage, item, "Category Screen", buildItem);
  }

  Widget renderItemAdd() {
    // no need width because used flex (Expanded)
    return Container(
      height: 120,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: MyColor.grey),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.add_rounded, color: Colors.white),
          const Text("Thêm chuyên mục").medium(Colors.white)
        ],
      ),
    );
  }

  Container buildItem(double width, double height, ImageProvider imageProvider, Object itemData) {
    Category item = itemData as Category;
    return Container(
      height: width,
      width: height,
      decoration: BoxDecoration(
          borderRadius: MyShape.radius_5,
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.srgbToLinearGamma(),
          )),
      child: Center(
        child: Text(item.title).medium(Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    generateView();
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 8, right: 8, bottom: 8),
      child: Column(
        children: generateView(),
      ),
    );
  }
}
