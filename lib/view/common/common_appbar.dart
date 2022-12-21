import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../styles/colors.dart';

class CommonAppbar extends StatefulWidget implements PreferredSizeWidget {
  final String? whichPage;

  const CommonAppbar({Key? key, required this.whichPage}) : super(key: key);

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
      //TELEFONUN WIFI CUBUGU&SARJ IKONLARININ RENKLERI
      systemOverlayStyle: SystemUiOverlayStyle.light,
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
