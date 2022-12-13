import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SiparisTarihiTextField extends HookWidget {
  SiparisTarihiTextField({
    super.key,
    required this.siparisTarihiController,
    required this.orderDate,
  });

  final TextEditingController siparisTarihiController;
  DateTime orderDate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: context.dynamicWidth * 0.02,
        vertical: context.dynamicHeight * 0.007,
      ),
      child: TextFormField(
        validator: (value) => null,
        controller: siparisTarihiController,
        keyboardType: TextInputType.datetime,
        cursorColor: Color(MyColors.bg01),
        readOnly: true,
        style: TextStyle(
          color: Color(
            MyColors.bg01,
          ),
        ),
        decoration: InputDecoration(
          labelText: 'Sipariş Tarihi',
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(
              MyColors.bg01,
            ),
          ),
          suffix: InkWell(
            onTap: () async {
              await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime.now(),
                      builder: (context, child) {
                        return Theme(
                          data: Theme.of(context).copyWith(
                            colorScheme: ColorScheme.light(
                              primary: Color(
                                MyColors.bg01,
                              ),
                              onPrimary: Colors.white,
                              onSurface: Color(MyColors.bg01),
                            ),
                            textButtonTheme: TextButtonThemeData(
                              style: TextButton.styleFrom(
                                foregroundColor: Color(
                                  MyColors.bg01,
                                ),
                              ),
                            ),
                          ),
                          child: child!,
                        );
                      },
                      lastDate: DateTime(Constants.lastDateinApp))
                  .then((secilenTarih) {
                orderDate = secilenTarih!;
                print('SEÇTİĞİM TARİH == $secilenTarih');
                siparisTarihiController.text =
                    '${secilenTarih.year}-${secilenTarih.month}-${secilenTarih.day}';
              });
            },
            child: Icon(Icons.question_mark,
                size: 20,
                color: Color(
                  MyColors.bg01,
                )),
          ),
          prefixIcon: Icon(
            Icons.date_range,
            color: Color(MyColors.bg01),
          ),
          errorBorder: CommonInputBorder.errorBorder,
          enabledBorder: CommonInputBorder.border,
          focusedBorder: CommonInputBorder.border,
        ),
      ),
    );
  }
}
