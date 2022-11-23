import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_save.model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommonIskTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? field;
  final IconData? icon;
  final TextInputType? textInputType;
  final bool? isMandatory;
  String? Function(String?)? validator;
  final bool? readOnly;
  void Function(String?)? onFieldSubmit;
  CariViewModel? cariViewModel;

  CommonIskTextField(
      {Key? key,
      this.controller,
      this.field,
      this.icon,
      this.textInputType,
      this.readOnly,
      required this.validator,
      this.isMandatory,
      this.onFieldSubmit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth * 0.02,
          vertical: context.dynamicHeight * 0.001,
        ),
        child: SizedBox(
          width: context.dynamicWidth * 0.4,
          child: TextFormField(
            validator: validator,
            readOnly: readOnly ?? false,
            onFieldSubmitted: onFieldSubmit,
            controller: controller,
            keyboardType: textInputType,
            textAlign: TextAlign.start,
            cursorColor: Color(MyColors.bg01),
            style: TextStyle(
              color: Color(
                MyColors.bg01,
              ),
              height: 1.0,
            ),
            decoration: InputDecoration(
              isDense: true, // Added this
              contentPadding: context.paddingDefault,
              labelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color(
                  MyColors.bg01,
                ),
              ),

              //errorBorder: CommonInputBorder.errorBorder,
              //enabledBorder: CommonInputBorder.border,
              //focusedBorder: CommonInputBorder.border,
            ),
          ),
        ));
  }
}
