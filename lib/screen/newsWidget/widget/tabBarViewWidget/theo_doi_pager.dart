import 'package:flutter/material.dart';

class TheoDoiPager extends StatelessWidget {
  const TheoDoiPager({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromRGBO(225, 224, 229, 1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 60,
            height: 60,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color.fromRGBO(0, 205, 60, 1),
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 40,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          const Text(
            "Đăng nhập để đọc mục theo dõi",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          ElevatedButton(
            onPressed: () {},
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.symmetric(horizontal: 24)),
              backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromRGBO(27, 168, 159, 1)),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                    color: Color.fromRGBO(27, 168, 159, 1),
                    width: 2.0,
                  ),
                ),
              ),
            ),
            child: const Text(
              "Đăng nhập ngay",
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
