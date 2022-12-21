import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/cari_kartlar.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';

class CariKodTextField extends StatelessWidget {
  final TextEditingController cariKodController;
  final TextEditingController cariIsimController;
  final CariViewModel cariViewModel = CariViewModel();
  CariKodTextField({
    super.key,
    required this.cariKodController,
    required this.cariIsimController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.dynamicWidth * 0.02,
          vertical: context.dynamicHeight * 0.007,
        ),
        child: TextFormField(
          validator: (value) {
            return cariViewModel.validateIsNotEmpty(value!);
          },
          readOnly: true,
          textInputAction: TextInputAction.next,
          controller: cariKodController,
          cursorColor: Color(MyColors.bg01),
          style: TextStyle(
            color: Color(
              MyColors.bg01,
            ),
          ),
          decoration: InputDecoration(
            labelText: Constants.cariKodu,
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(
                MyColors.bg01,
              ),
            ),
            prefixIcon: Icon(
              Icons.storefront,
              color: Color(MyColors.bg01),
            ),
            suffix: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CariKartlar(
                        detayaGitmesin: true,
                        cariIsmiController: cariIsimController,
                        cariKodController: cariKodController),
                  ),
                );
              },
              child: Icon(Icons.question_mark,
                  size: 20,
                  color: Color(
                    MyColors.bg01,
                  )),
            ),
            errorBorder: CommonInputBorder.errorBorder,
            enabledBorder: CommonInputBorder.border,
            focusedBorder: CommonInputBorder.border,
          ),
        ));
  }
}
