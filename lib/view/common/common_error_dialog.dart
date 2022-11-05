import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:flutter/material.dart';

showAlertDialog(
    {BuildContext? context, String? hataBaslik, String? hataIcerik}) {
  // set up the button
  Widget okButton = TextButton(
    child: const Text(Constants.OK),
    onPressed: () {
      Navigator.of(context!).pop();
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(hataBaslik!),
    content: Text(hataIcerik!),
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
