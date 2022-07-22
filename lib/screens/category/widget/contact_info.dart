import 'package:flutter/material.dart';
import 'package:my_app/utils/constants.dart';
import 'package:my_app/utils/extension.dart';

class ContactInfo extends StatelessWidget {
  const ContactInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text("Liên hệ").title(MyColor.grey),
          const SizedBox(height: 13),
          const Text("Đối tác chính thức").title(MyColor.grey),
          const SizedBox(height: 13),
          const Text("Điều khoản sử dụng").title(MyColor.grey),
          const SizedBox(height: 13),
          const Text("Chính sách bảo mật").title(MyColor.grey),
        ],
      ),
    );
  }
}
