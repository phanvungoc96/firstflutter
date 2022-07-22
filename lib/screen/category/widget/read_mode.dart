import 'package:flutter/material.dart';
import 'package:my_app/utils/enum.dart';
import 'package:my_app/utils/extension.dart';
import '../../../utils/constants.dart';

class ReadMode extends StatelessWidget {
  const ReadMode({Key? key}) : super(key: key);

  Expanded buildButton(String text, Button status, BuildContext context) {
    return Expanded(
      flex: 1,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: status == Button.unSelected ? MyColor.lightGrey : MyColor.green,
          shape: MyShape.shape_5,
        ),
        onPressed: () {
          Navigator.of(context).pop(status);
        },
        child: Text(
          text,
        ).medium(status == Button.unSelected ? MyColor.grey : Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Column(
        children: [
          const Text("CHỌN CHẾ ĐỘ ĐỌC").mediumCenterLeft(MyColor.grey),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildButton("Danh sách lớn", Button.unSelected, context),
              const SizedBox(width: 10),
              buildButton("Danh sách nhỏ", Button.selected, context),
            ],
          )
        ],
      ),
    );
  }
}
