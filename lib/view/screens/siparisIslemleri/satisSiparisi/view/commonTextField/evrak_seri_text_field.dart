import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';

class EvrakSeriTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? field;
  final IconData? icon;
  final TextInputType? textInputType;
  final bool? isMandatory;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final bool? readOnly;
  static final GlobalKey<FormFieldState<String>> searchFormKey =
      GlobalKey<FormFieldState<String>>();
  final CariViewModel? cariViewModel = CariViewModel();

  EvrakSeriTextField({
    super.key,
    this.controller,
    this.field,
    this.icon,
    this.textInputType,
    this.readOnly,
    required this.validator,
    this.focusNode,
    searchFormKey,
    this.isMandatory,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth * 0.02,
          vertical: context.dynamicHeight * 0.007,
        ),
        child: TextFormField(
          key: searchFormKey,
          textInputAction: TextInputAction.next,
          validator: validator,
          focusNode: focusNode,
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
            errorBorder: CommonInputBorder.errorBorder,
            enabledBorder: CommonInputBorder.border,
            focusedBorder: CommonInputBorder.border,
          ),
        ));
  }
}
