import 'package:flutter/material.dart';
import 'package:my_app/screens/profile/widgets/category_widget.dart';
import 'package:my_app/screens/profile/widgets/choose_type_news_card.dart';
import 'package:my_app/utils/constants.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);
  static const routeName = '/profile';
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: MediaQuery.of(context).size.height / 5,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: MyColor.colorHeader)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IconButton(
              iconSize: 30,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0), //or 15.0
                    child: SizedBox(
                      height: 60,
                      width: 60,
                      child: Image.network(
                        'https://i.pinimg.com/736x/dd/56/f8/dd56f888c5abbdc8b429afa07131d418.jpg',
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Hào Chí',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
      elevation: 0,
    );

    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white, appBar: appBar, body: bodyView()),
    );
  }

  Widget bodyView() => SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const <Widget>[
              ChooseTypeNewsCard(),
              SizedBox(
                height: 8,
              ),
              CategoryWidget(category: 'ti'),
              CategoryWidget(category: 'cd'),
              CategoryWidget(category: 'sp')
            ],
          ),
        ),
      );
}
