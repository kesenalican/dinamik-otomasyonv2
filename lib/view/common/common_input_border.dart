import 'package:flutter/material.dart';

import 'package:dinamik_otomasyon/view/styles/colors.dart';

class CommonInputBorder extends StatelessWidget {
  final String labelText;
  final IconData icon;
  const CommonInputBorder({
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
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
            fontSize: 15,
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

  static final errorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Colors.red,
    ),
  );

  static final border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide(
      color: Color(
        MyColors.bg01,
      ),
    ),
  );
}
