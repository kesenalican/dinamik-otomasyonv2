// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/common/common_dropdown.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';

// ignore: must_be_immutable
class CommonTypes extends StatelessWidget {
  String hareketTipi;
  List<String> listOfTypes;
  CommonTypes({
    Key? key,
    required this.hareketTipi,
    required this.listOfTypes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: context.dynamicWidth * 0.05,
        ),
        Text(
          hareketTipi,
          style: purpleBoldTxtStyle,
        ),
        SizedBox(
          width: context.dynamicWidth * 0.05,
        ),
        Expanded(
          flex: 1,
          child: CommonDropDown(list: listOfTypes, listName: hareketTipi),
        ),
      ],
    );
  }
}
