import 'package:flutter/material.dart';
import 'package:my_app/utils/extension.dart';
import '../../../utils/constants.dart';

class Header extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? iconLeft;
  final List<Widget>? iconRights;

  const Header(
    this.title, {
    Key? key,
    this.iconLeft,
    this.iconRights,
  }) : super(key: key);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: iconLeft == null ? false : true,
      leading: iconLeft,
      actions: iconRights,
      flexibleSpace: Container(
        decoration: const BoxDecoration(gradient: LinearGradient(colors: MyColor.colorHeader)),
      ),
      title: Text(title).medium(Colors.white),
    );
  }
}
