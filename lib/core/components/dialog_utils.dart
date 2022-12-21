import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

// showAlertDialog(BuildContext context, String title, String message,
//     {String? buttonText, Function? callback}) {
//   // set up the button
//   Widget okButton = TextButton(
//     child: Text(
//       buttonText ?? 'TAMAM',
//       style: TextStyle(
//         color: Color(
//           MyColors.bg01,
//         ),
//       ),
//     ),
//     onPressed: () {
//       if (callback != null) {
//         callback.call();
//       }
//       Navigator.pop(context);
//     },
//   );

//   // set up the AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: Text(
//       title,
//       style: TextStyle(
//         color: Color(
//           MyColors.bg01,
//         ),
//       ),
//     ),
//     content: Text(
//       message,
//       style: TextStyle(
//         color: Color(
//           MyColors.bg01,
//         ),
//       ),
//     ),
//     actions: [
//       okButton,
//     ],
//   );

//   // show the dialog
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
//   );
// }

showToast(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.white30,
      textColor: Color(
        MyColors.bg01,
      ),
      fontSize: 14.0);
}

void showProgressDialog(BuildContext context) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            content: Builder(
              builder: (context) {
                return Container(
                  height: 100,
                  width: 100,
                  alignment: Alignment.center,
                  child: const CommonLoading()
                );
              },
            ),
          ));
}

void dismissDialog(BuildContext context) {
  Navigator.pop(context);
}
