import 'package:flutter/material.dart';

import '../../detail/bottomModal.dart';

class FollowWidget extends StatelessWidget {
  final bool isLogedIn;
  const FollowWidget({Key? key, this.isLogedIn = false}) : super(key: key);

  void showModal(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return GestureDetector(
          onTap: () {}, // Closing the sheet.
          behavior: HitTestBehavior.opaque,
          child: LoginType(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
          child: Icon(
            !isLogedIn ? Icons.person : Icons.dashboard_customize_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          !isLogedIn
              ? "Đăng nhập để đọc mục theo dõi"
              : 'Theo dõi thêm nguồn để có thêm thông tin trong danh sách',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        ElevatedButton(
          onPressed: () => {
            if (isLogedIn)
              {Navigator.pushNamed(context, '/suggestFollow')}
            else
              showModal(context)
          },
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
          child: Text(
            !isLogedIn ? "Đăng nhập ngay" : "Xem nguồn tin đề xuất",
            style: TextStyle(fontSize: 14, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
