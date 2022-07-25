import 'package:flutter/material.dart';
import 'package:my_app/screens/videos/videoPlayer.dart';

class Videos extends StatelessWidget {
  const Videos({Key? key}) : super(key: key);
  Widget renderCategory(BuildContext context, String title) {
    return Container(
      height: 84,
      alignment: Alignment.bottomCenter,
      padding: const EdgeInsets.only(bottom: 8),
      width: MediaQuery.of(context).size.width / 4,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.blue,
          image: DecorationImage(
              image: NetworkImage(
                  "https://storage.googleapis.com/gd-wagtail-prod-assets/original_images/MDA2018_inline_03.jpg"),
              fit: BoxFit.fill)),
      child: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
      ),
    );
    // Column(
    //   children: [
    //     Image(
    //       fit: BoxFit.fitWidth,
    //       height: MediaQuery.of(context).size.width / 4,
    //       width: MediaQuery.of(context).size.width / 4,
    //       image: NetworkImage(
    //           'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
    //     ),
    //     // Positioned.fill(child: Text(title))
    //   ],
    // );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: MediaQuery.of(context).size.width / 3.5,
          backgroundColor: Colors.white,
          title: TabBar(
            labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.all(0),
            isScrollable: true,
            indicatorColor: Colors.transparent,
            indicatorWeight: 1,
            tabs: <Widget>[
              renderCategory(context, 'Mới'),
              renderCategory(context, 'OMG'),
              renderCategory(context, 'TEK'),
              renderCategory(context, 'FB'),
              renderCategory(context, 'CNC'),
            ],
          ),
          elevation: 0,
        ),
        body: TabBarView(
          children: [
            VideoPlayerScreen(),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
            buildPage('Theo dõi'),
          ],
        ),
      ),
    );
  }
}

Widget buildPage(String text) => Center(child: Text(text));
