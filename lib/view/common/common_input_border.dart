// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:dinamik_otomasyon/view/styles/colors.dart';

// ignore: must_be_immutable
class CommonInputBorder extends StatelessWidget {
  String labelText;
  IconData icon;
  CommonInputBorder({
    super.key,
    required this.labelText,
    required this.icon,
  });

  CommonInputBorder copyWith({
    String? labelText,
    IconData? icon,
  }) {
    return CommonInputBorder(
      labelText: labelText ?? this.labelText,
      icon: icon ?? this.icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      cursorColor: Color(MyColors.bg01),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(
              MyColors.bg01,
            )),
        prefixIcon: Icon(
          icon,
          color: Color(MyColors.bg01),
        ),
        enabledBorder: border,
        focusedBorder: border,
      ),
    );
  }

  static final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Color(
        MyColors.bg01,
      ),
    ),
  );
}
