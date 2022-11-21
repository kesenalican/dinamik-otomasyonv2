// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_save.model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? field;
  final IconData? icon;
  final TextInputType? textInputType;
  final bool? isMandatory;
  String? Function(String?)? validator;
  final bool? readOnly;
  CariViewModel? cariViewModel;

  CommonTextField({
    Key? key,
    this.controller,
    this.field,
    this.icon,
    this.textInputType,
    this.readOnly,
    required this.validator,
    this.isMandatory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth * 0.02,
          vertical: context.dynamicHeight * 0.007,
        ),
        child: TextFormField(
          validator: validator,
          readOnly: readOnly ?? false,
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
        ));
  }
}
