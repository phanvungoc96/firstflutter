import 'package:flutter/material.dart';
import 'package:my_app/screens/category/category_screen.dart';
import 'package:my_app/screens/detail/detail.dart';
import 'package:my_app/screens/newsWidget/news_widget.dart';
import 'package:my_app/screens/profile/profile.dart';
import 'package:my_app/screens/search/search.dart';
import 'package:my_app/screens/tabScreens.dart';

import 'modules/trending/pages/trending_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widgets is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      // home: const News(),
      routes: {
        '/': (ctx) => TabsScreen(),
        DetailPage.routeName: (ctx) => DetailPage(),
        TrendingScreen.routeName: (ctx) => TrendingScreen(),
        News.routeName: (ctx) => News(),
        Search.routeName: (ctx) => Search(),
        Profile.routeName: (ctx) => Profile()
      },
      onGenerateRoute: (settings) {
        print(settings.arguments);
        return null;
        // if (settings.name == '/meal-detail') {
        //   return ...;
        // } else if (settings.name == '/something-else') {
        //   return ...;
        // }
        // return MaterialPageRoute(builder: (ctx) => CategoriesScreen(),);
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoryScreen(),
        );
      },
    );
  }
}
