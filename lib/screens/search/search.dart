import 'package:flutter/material.dart';
import 'package:my_app/screens/search/widgets/tim_nhanh_widget.dart';
import 'package:my_app/widgets/news_card.dart';

import '../../models/News.dart';
import '../../networks/networks_request.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final _searchText = TextEditingController();
  List<NewsModels> _newsDisplay = [];
  List<NewsModels> _newsData = [];

  @override
  void initState() {
    super.initState();
    NetWorksRequest.fetchNews('News').then((value) {
      print(value);
      setState(() {
        _newsData = value;
      });
    }).catchError((e) {
      print(e);
    });
  }

  void searchFunction(String keyWord) {
    var text = keyWord.toLowerCase();
    setState(() {
      _searchText.text = keyWord;
      if (text.isEmpty) {
        _newsDisplay = [];
      } else {
        _newsDisplay = querySearch(text);
      }
    });
  }

  List<NewsModels> querySearch(String text) {
    return _newsData.where((element) {
      var newE = element.title?.toLowerCase();
      if (newE != null) {
        return newE.contains(text);
      } else {
        throw Exception();
      }
    }).toList();
  }

  void onSearching(String query) {
    var text = query.toLowerCase();
    setState(() {
      if (text.isEmpty) {
        _newsDisplay = [];
      } else {
        _newsDisplay = querySearch(text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromRGBO(0, 144, 153, 1),
              Color.fromRGBO(0, 128, 163, 1),
              Color.fromRGBO(0, 125, 163, 1),
              Color.fromRGBO(0, 106, 154, 1),
              Color.fromRGBO(0, 93, 152, 1),
            ])),
          ),
          toolbarHeight: MediaQuery.of(context).size.height / 15,
          title: searchTextField(),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                "Đóng",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
        body: body(),
      ),
    );
  }

  Widget searchTextField() => Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(0, 0, 0, 0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        height: MediaQuery.of(context).size.height / 20,
        child: TextField(
          onChanged: onSearching,
          textInputAction: TextInputAction.search,
          style: TextStyle(color: Colors.white),
          controller: _searchText,
          decoration: InputDecoration(
              hintText: 'Tìm kiếm',
              prefixIcon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: Colors.grey[300],
              ),
              suffixIcon: IconButton(
                  onPressed: () => searchFunction(''),
                  icon: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ))),
        ),
      );

  Widget body() => Container(
        color: const Color.fromRGBO(225, 224, 229, 1),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              TimNhanhCard(
                setKeyWord: searchFunction,
              ),
              ..._newsDisplay.map((e) => NewsCard(news: e)).toList()
            ],
          ),
        ),
      );
}
