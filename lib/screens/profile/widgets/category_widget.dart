import 'package:flutter/material.dart';
import 'package:my_app/screens/profile/datas/category_widget_datas.dart';

class CategoryWidget extends StatelessWidget {
  final String category;
  const CategoryWidget({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<CategoryWidgetModel> getDataByCategory() {
      switch (category) {
        case 'ti':
          {
            return tiData;
          }
        case 'cd':
          {
            return cdData;
          }
        case 'sp':
          {
            return spData;
          }
        default:
          return [];
      }
    }

    String getTitleByCategory() {
      switch (category) {
        case 'ti':
          {
            return 'Tiện ích';
          }
        case 'cd':
          {
            return 'Cài đặt';
          }
        case 'sp':
          {
            return 'Sản phầm';
          }
        default:
          return '';
      }
    }

    final List<CategoryWidgetModel> data = getDataByCategory();

    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                getTitleByCategory().toUpperCase(),
                style: TextStyle(color: Colors.green, fontSize: 20),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            ...data
                .map((e) => ListTile(
                      title: Text(e.title),
                      leading: e.leading != null ? Icon(e.leading) : null,
                      trailing: e.trailing,
                    ))
                .toList(),
          ]),
    );
  }
}
