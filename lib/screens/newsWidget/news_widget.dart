import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/profile/profile_bloc.dart';
import 'package:my_app/screens/map/user_map.dart';
import 'package:my_app/screens/newsWidget/widget/tabBarViewWidget/theo_doi_pager.dart';
import 'package:my_app/utils/constants.dart';

import './widget/tabBarViewWidget/nong_pager.dart';

class News extends StatelessWidget {
  const News({Key? key}) : super(key: key);
  static const routeName = '/news';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 17,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            title: const TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorWeight: 1,
              tabs: <Widget>[
                Tab(
                  text: "Theo dõi",
                ),
                Tab(
                  text: "Nóng",
                ),
                Tab(
                  text: "Mới",
                ),
                Tab(
                  text: "Tổng hợp",
                ),
                Tab(
                  text: "Bóng đá VN",
                ),
                Tab(
                  text: "Bóng đá QT",
                ),
                Tab(
                  text: "Độc và lạ",
                ),
                Tab(
                  text: "Tình yêu",
                ),
                Tab(
                  text: "Giải trí",
                ),
                Tab(
                  text: "Thế giới",
                ),
                Tab(
                  text: "Pháp luật",
                ),
                Tab(
                  text: "Xe 360",
                ),
                Tab(
                  text: "Công nghệ",
                ),
                Tab(
                  text: "Ẩm thực",
                ),
                Tab(
                  text: "Làm đẹp",
                ),
                Tab(
                  text: "Sức khỏe",
                ),
                Tab(
                  text: "Du lịch",
                ),
              ],
            ),
            elevation: 0,
            leading: IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: const Icon(Icons.menu),
            ),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/search');
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, UserMap.routeName);
                },
                icon: const Icon(Icons.location_on_outlined),
              ),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/profile');
                      },
                      icon: state is ProfileLoaded
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network(state.profileModel.avatar ?? ''),
                            )
                          : Icon(Icons.person));
                },
              )
            ],
            flexibleSpace: Container(
              decoration: const BoxDecoration(gradient: LinearGradient(colors: MyColor.colorHeader)),
            ),
          ),
        ),
        body: TabBarView(
          children: const <Widget>[
            TheoDoiPager(),
            NongPager(),
            NongPager(),
            NongPager(),
            NongPager(),
            NongPager(),
            NongPager(),
            NongPager(),
            NongPager(),
            NongPager(),
            NongPager(),
            NongPager(),
            NongPager(),
            NongPager(),
            NongPager(),
            NongPager(),
            NongPager(),
          ],
        ),
      ),
    );
  }
}

Widget buildPage(String text) => Center(child: Text(text));
