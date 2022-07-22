import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
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
              onPressed: () {},
              child: Text(
                "Đóng",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchTextField() => Expanded(
        child: TextField(
          textInputAction: TextInputAction.search,
        ),
      );
}
