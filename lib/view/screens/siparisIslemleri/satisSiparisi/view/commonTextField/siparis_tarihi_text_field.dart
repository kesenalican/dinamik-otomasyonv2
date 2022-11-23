import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class SiparisTarihiTextField extends HookWidget {
  const SiparisTarihiTextField({
    super.key,
    required this.siparisTarihiController,
  });

  final TextEditingController siparisTarihiController;

  @override
  Widget build(BuildContext context) {
    DateTime dateTimeBaslangic = DateTime.parse(DateTime.now().toString());
    DateTime dateTimeBitis = DateTime.parse(
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}");
    final dateTimeBitiss = useState(DateTime.parse(
        "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}"));
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
          labelText: "Sipariş Tarihi",
          labelStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w400,
            color: Color(
              MyColors.bg01,
            ),
          ),
          prefixIcon: IconButton(
            onPressed: () async {
              // siparisTarihiController.text =
              //     "${dateTimeBitis.year}-${dateTimeBitis.month}-${dateTimeBitis.day}";
              await showDatePicker(
                      context: context,
                      initialDate: dateTimeBitis,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(Constants.lastDateinApp))
                  .then((secilenTarih) {
                dateTimeBitiss.value = secilenTarih!;
                siparisTarihiController.text = dateTimeBitiss.value.toString();
              });
            },
            icon: const Icon(Icons.date_range),
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
