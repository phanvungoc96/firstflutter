import 'package:flutter/material.dart';

enum Button { selected, unSelected }

enum DisplayList { gridTwo, verticalList }

enum TypeButtonMap {
  DIRECTION(Icons.directions, "Đường đi"),
  CALL(Icons.call, "Gọi"),
  SAVE(Icons.bookmark_border, "Lưu"),
  SHARE(Icons.share, "Chia sẻ");

  const TypeButtonMap(this.iconName, this.text);
  final IconData iconName;
  final String text;
}
