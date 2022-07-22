import 'package:flutter/material.dart';
import 'package:my_app/utils/enum.dart';
import 'package:my_app/utils/extension.dart';
import '../../../utils/constants.dart';

class TypeDisplayList extends StatelessWidget {
  final DisplayList _type;
  final Function _changeTypeDisplayList;
  const TypeDisplayList(this._type, this._changeTypeDisplayList, {Key? key}) : super(key: key);

  Container buildChangeModeRead() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Thay đổi").small(MyColor.green),
          IconButton(
            onPressed: () => _changeTypeDisplayList(),
            icon: _type == DisplayList.verticalList
                ? const Icon(Icons.format_list_bulleted_rounded)
                : const Icon(Icons.grid_view),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return buildChangeModeRead();
  }
}
