// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginType extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  LoginType({Key? key}) : super(key: key);

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(25.0),
          topRight: const Radius.circular(25.0),
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: Text(
                'Đăng nhập để theo dõi'.toUpperCase(),
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[500]),
              ),
            ),
            TextButton(
                onPressed: () => {},
                child: Container(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[500],
                    borderRadius: BorderRadius.all(
                      const Radius.circular(25.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.messenger_rounded,
                        color: Colors.white,
                      ),
                      Text(
                        'Đăng nhập qua zalo (miễn phí)',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                )),
            TextButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(
                      const Radius.circular(25.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.phone_android,
                        color: Colors.black,
                      ),
                      Text(
                        'Đăng nhập bằng SMS',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                )),
            TextButton(
                onPressed: () {},
                child: Container(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.all(
                      const Radius.circular(25.0),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.apple,
                        color: Colors.white,
                      ),
                      Text(
                        'Đăng nhập bằng Apple',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    ));
  }
}
