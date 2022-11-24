import 'package:flutter/material.dart';

import '../styles/colors.dart';

// ignore: must_be_immutable
class CommonAppbar extends StatefulWidget implements PreferredSizeWidget {
  String? whichPage;

  CommonAppbar({Key? key, required this.whichPage}) : super(key: key);

  @override
  State<CommonAppbar> createState() => _CommonAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CommonAppbarState extends State<CommonAppbar> {
  @override
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        widget.whichPage!,
        style:
            TextStyle(color: Color(MyColors.bg01), fontWeight: FontWeight.w600),
      ),
      iconTheme: IconThemeData(color: Color(MyColors.bg01), size: 30),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }
}
