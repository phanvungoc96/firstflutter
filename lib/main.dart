import 'package:flutter/material.dart';
import 'package:my_app/screens/category/category_screen.dart';

import 'screens/newsWidget/news_widget.dart';

import './detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const News(),
    );
  }
}
