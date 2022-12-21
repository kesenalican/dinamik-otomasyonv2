import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';

showAlertDialog(
    {BuildContext? context, String? hataBaslik, String? hataIcerik}) {
  // set up the button
  Widget okButton = TextButton(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Color(MyColors.bg01)),
    ),
    child: const Text(
      Constants.ok,
      style: TextStyle(color: Colors.white),
    ),
    onPressed: () {
      Navigator.of(context!).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(
      hataBaslik!,
      style: purpleBoldTxtStyle,
    ),
    content: Text(
      hataIcerik!,
      style: purpleTxtStyle,
      overflow: TextOverflow.ellipsis,
    ),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context!,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
