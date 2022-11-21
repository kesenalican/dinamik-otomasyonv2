// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dinamik_otomasyon/Model/kur_model.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';

import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class KurTextField extends ConsumerWidget {
  TextEditingController dovizController;
  KurTextField({
    super.key,
    required this.dovizController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var dovizKurlari = ref.watch(kurlarProvider);
    CariViewModel cariViewModel = CariViewModel();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          return cariViewModel.validateIsNotEmpty(value!);
        },
        controller: dovizController,
        keyboardType: TextInputType.name,
        cursorColor: Color(MyColors.bg01),
        readOnly: true,
        style: TextStyle(
            color: Color(
          MyColors.bg01,
        )),
        decoration: InputDecoration(
          labelText: Constants.dovizKuruSeciniz,
          labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(
                MyColors.bg01,
              )),
          prefixIcon: Icon(
            Icons.monetization_on_outlined,
            color: Color(MyColors.bg01),
          ),
          suffix: InkWell(
            onTap: () {
              dovizKurlari.when(
                data: (data) {
                  List<Kurlar> kurList = data.map((e) => e).toList();
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text(
                            "Döviz Kuru Seçiniz",
                            style: purpleBoldTxtStyle,
                          ),
                          children: [
                            SizedBox(
                              height: context.dynamicHeight * 0.4,
                              width: context.dynamicWidth * 0.5,
                              child: ListView.builder(
                                  itemBuilder: (context, index) {
                                return SimpleDialogOption(
                                  onPressed: () {
                                    dovizController.text = kurList[index]
                                        .kurOrjinalIsmi
                                        .toString();
                                    Navigator.pop(
                                      context,
                                      Kurlar(
                                        kurNumarasi: kurList[index].kurNumarasi,
                                        kurSembolu: kurList[index].kurSembolu,
                                        kurOrjinalIsmi:
                                            kurList[index].kurOrjinalIsmi,
                                      ),
                                    );
                                  },
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          kurList[index].kurSembolu,
                                          style: purpleTxtStyle,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          kurList[index].kurOrjinalIsmi,
                                          style: purpleTxtStyle,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }),
                            ),
                          ],
                        );
                      });
                },
                error: (err, stack) => showAlertDialog(
                    context: context, hataBaslik: "hata", hataIcerik: "hata"),
                loading: () => const CommonLoading(),
              );
            },
            child: Icon(Icons.question_mark,
                size: 20,
                color: Color(
                  MyColors.bg01,
                )),
          ),
          enabledBorder: CommonInputBorder.border,
          focusedBorder: CommonInputBorder.border,
        ),
      ),
    );
  }
}
