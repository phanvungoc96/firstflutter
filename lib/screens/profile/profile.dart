import 'package:flutter/material.dart';
import 'package:my_app/screens/profile/widgets/category_widget.dart';
import 'package:my_app/screens/profile/widgets/choose_type_news_card.dart';
import 'package:my_app/utils/constants.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);
  static const routeName = '/profile';

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  static const _containerHeight = 250;
  var isShowAppBar = false;
  var _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_listener);
  }

  void _listener() {
    double offset = _controller.offset;
    var direction = _controller.position.userScrollDirection;

    setState(() {
      isShowAppBar = offset >= _containerHeight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: bodyView(_controller),
      appBar: isShowAppBar
          ? AppBar(
              title: Row(
                children: const <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.pinimg.com/736x/dd/56/f8/dd56f888c5abbdc8b429afa07131d418.jpg',
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Hào Chí')
                ],
              ),
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(colors: MyColor.colorHeader)),
              ),
            )
          : null,
    );
  }

  Widget bodyView(ScrollController scrollController) => SingleChildScrollView(
        controller: scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                color: Colors.white,
                child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      Column(
                        children: [
                          bigAppBar(),
                          Container(
                              margin: EdgeInsets.only(top: 70),
                              child: CategoryWidget(category: 'ti')),
                        ],
                      ),
                      Positioned(
                        top: 250,
                        child: ChooseTypeNewsCard(),
                      )
                    ])),
            SizedBox(
              height: 8,
            ),
            CategoryWidget(category: 'cd'),
            SizedBox(
              height: 8,
            ),
            CategoryWidget(category: 'sp')
          ],
        ),
      );

  Widget bigAppBar() => LayoutBuilder(builder: (context, snapshot) {
        return Builder(builder: (context) {
          return Container(
            padding: EdgeInsets.only(bottom: 50, top: 50),
            height: 300,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    bottomRight: Radius.circular(12)),
                gradient: LinearGradient(colors: MyColor.colorHeader)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Navigator.canPop(context) == false
                    ? Container()
                    : IconButton(
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
          );
        });
      });
}
