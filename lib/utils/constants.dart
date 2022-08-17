import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyColor {
  static const Color grey = Color.fromRGBO(130, 130, 132, 1);
  static const Color lightGrey = Color.fromRGBO(239, 239, 241, 1);
  static const Color green = Color.fromRGBO(0, 136, 134, 1);
  static const Color primary = Color.fromRGBO(0, 144, 153, 1);
  static const List<Color> colorHeader = [
    Color.fromRGBO(0, 144, 153, 1),
    Color.fromRGBO(0, 128, 163, 1),
    Color.fromRGBO(0, 125, 163, 1),
    Color.fromRGBO(0, 106, 154, 1),
    Color.fromRGBO(0, 93, 152, 1),
  ];
}

class MyShape {
  static const shape_5 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  );

  static const shape_8 = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );

  static BorderRadius radius_5 = BorderRadius.circular(5.0);
  static BorderRadius radius_8 = BorderRadius.circular(8.0);
}

class MyShadow {
  static List<BoxShadow> shadow = [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
    )
  ];
}
