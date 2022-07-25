import 'package:flutter/material.dart';
import 'package:my_app/screens/trending/trending_screen.dart';
import 'package:my_app/screens/videos/videoTab.dart';

import './newsWidget/news_widget.dart';
import './category/category_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'page': News(),
      'title': 'News',
    },
    {
      'page': Videos(),
      'title': 'Video',
    },
    {
      'page': TrendingScreen(),
      'title': 'Xu hướng',
    },
    {
      'page': TrendingScreen(),
      'title': 'Cá nhân',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: CategoryScreen(),
        body: _pages[_selectedPageIndex]['page'] as Widget,
        bottomNavigationBar: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(0, 144, 153, 1),
              Color.fromRGBO(0, 128, 163, 1),
              Color.fromRGBO(0, 125, 163, 1),
              Color.fromRGBO(0, 106, 154, 1),
              Color.fromRGBO(0, 93, 152, 1),
            ])),
            height: 72,
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: BottomNavigationBar(
                onTap: _selectPage,
                backgroundColor: Colors.transparent,
                unselectedItemColor: Colors.white,
                selectedItemColor: Colors.yellow,
                currentIndex: _selectedPageIndex,
                showUnselectedLabels: true,
                iconSize: 24,
                items: const [
                  BottomNavigationBarItem(
                    backgroundColor: Colors.transparent,
                    icon: Icon(Icons.newspaper),
                    label: 'Tin tức',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.transparent,
                    icon: Icon(Icons.play_arrow),
                    label: 'Video',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.transparent,
                    icon: Icon(Icons.trending_up),
                    label: 'Xu hướng',
                  ),
                  BottomNavigationBarItem(
                    backgroundColor: Colors.transparent,
                    icon: Icon(Icons.account_circle),
                    label: 'Cá nhân',
                  ),
                ],
              ),
            )));
  }
}
