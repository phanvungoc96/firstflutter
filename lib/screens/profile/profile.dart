import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/blocs/profile/profile_bloc.dart';
import 'package:my_app/screens/profile/widgets/appbar_widget.dart';
import 'package:my_app/screens/profile/widgets/category_widget.dart';
import 'package:my_app/screens/profile/widgets/choose_type_news_card.dart';
import 'package:my_app/utils/constants.dart';
import 'package:my_app/widgets/loading_text_shimmer/loading_text_shimmer.dart';

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
              title: BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileLoading) {
                    return LoadingTextShimmer();
                  } else if (state is ProfileLoaded) {
                    return AppBarWidget(
                      urlImg: state.profileModel.avatar ?? '',
                      name: state.profileModel.name ?? '',
                      isSmall: true,
                    );
                  } else {
                    return AppBarWidget();
                  }
                },
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
            CategoryWidget(category: 'sp'),
            SizedBox(
              height: 8,
            ),
            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoaded) {
                  return Container(
                    color: Colors.white,
                    child: ListTile(
                      onTap: () {
                        BlocProvider.of<ProfileBloc>(context).add(Logout());
                      },
                      trailing: null,
                      leading: null,
                      title: const Text(
                        'Đăng xuất',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                } else {
                  return SizedBox();
                }
              },
            )
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
                    child: BlocBuilder<ProfileBloc, ProfileState>(
                      builder: (context, state) {
                        if (state is ProfileLoaded) {
                          return AppBarWidget(
                            name: state.profileModel.name ?? '',
                            urlImg: state.profileModel.avatar ?? '',
                          );
                        } else if (state is ProfileLoading) {
                          return LoadingTextShimmer(
                            textStyle: TextStyle(fontSize: 30),
                          );
                        } else {
                          return AppBarWidget();
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        });
      });
}
