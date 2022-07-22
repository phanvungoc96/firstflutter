import 'package:flutter/material.dart';
import '../../../utils/constants.dart';

class HeaderCategory extends StatelessWidget implements PreferredSizeWidget {
  const HeaderCategory({
    Key? key,
  }) : super(key: key);

  IconButton buildIconRight(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_forward),
      tooltip: 'Arrow forward',
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: [buildIconRight(context)],
      flexibleSpace: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: MyColor.colorHeader)),
      ),
      title: const Text("Category"),
      // flexibleSpace: Container(
      //   decoration: const BoxDecoration(
      //       gradient: LinearGradient(colors: [
      //     Color.fromRGBO(0, 144, 153, 1),
      //     Color.fromRGBO(0, 128, 163, 1),
      //     Color.fromRGBO(0, 125, 163, 1),
      //     Color.fromRGBO(0, 106, 154, 1),
      //     Color.fromRGBO(0, 93, 152, 1),
      //   ])),
      // ),
    );
  }
}
