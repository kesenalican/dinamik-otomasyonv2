// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class StokKodTextField extends StatelessWidget {
  CariViewModel cariViewModel = CariViewModel();
  TextEditingController stokKoduController;
  TextEditingController stokIsmiController;
  TextEditingController stokBirimController;
  TextEditingController stokFiyatController;
  StokKodTextField({
    super.key,
    required this.stokKoduController,
    required this.stokIsmiController,
    required this.stokBirimController,
    required this.stokFiyatController,
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
          controller: stokKoduController,
          cursorColor: Color(MyColors.bg01),
          style: TextStyle(
            color: Color(
              MyColors.bg01,
            ),
          ),
          decoration: InputDecoration(
            labelText: Constants.STOK_KODU,
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(
                MyColors.bg01,
              ),
            ),
            prefixIcon: Icon(
              Icons.production_quantity_limits,
              color: Color(MyColors.bg01),
            ),
            // suffix: InkWell(
            //   onTap: () {
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (context) => StokKartlari(
            //           detayaGitmesin: true,
            //           stokKoduController: stokKoduController,
            //           stokIsmiController: stokIsmiController,
            //           stokBirimController: stokBirimController,
            //           stokFiyatController: stokFiyatController,
            //         ),
            //       ),
            //     );
            //   },
            //   child: Icon(Icons.question_mark,
            //       size: 20,
            //       color: Color(
            //         MyColors.bg01,
            //       )),
            // ),
            errorBorder: CommonInputBorder.errorBorder,
            enabledBorder: CommonInputBorder.border,
            focusedBorder: CommonInputBorder.border,
          ),
        ));
  }
}
