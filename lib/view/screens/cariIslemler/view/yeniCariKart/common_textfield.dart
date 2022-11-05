// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? field;
  final IconData? icon;
  final TextInputType? textInputType;
  final Function validator;
  const CommonTextField({
    Key? key,
    this.controller,
    this.field,
    this.icon,
    this.textInputType,
    required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? "$field Boş Olamaz!" : null,
        readOnly: field == "Vergi Dairesi" || field == "Vergi Daire Kodu"
            ? true
            : false,
        controller: controller,
        keyboardType: textInputType,
        cursorColor: Color(MyColors.bg01),
        style: TextStyle(
          color: Color(
            MyColors.bg01,
          ),
        ),
        decoration: InputDecoration(
          labelText: field,
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(
              MyColors.bg01,
            ),
          ),
          prefixIcon: Icon(
            icon,
            color: Color(MyColors.bg01),
          ),
          enabledBorder: CommonInputBorder.border,
          focusedBorder: CommonInputBorder.border,
        ),
      ),
    );
  }
}
