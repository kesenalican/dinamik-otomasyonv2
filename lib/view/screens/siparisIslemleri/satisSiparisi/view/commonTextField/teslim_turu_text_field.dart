import 'package:dinamik_otomasyon/Model/cari_personel.dart';
import 'package:dinamik_otomasyon/Model/teslim_turleri_model.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class TeslimTuruTextField extends ConsumerWidget {
  TextEditingController teslimTuruController;
  TeslimTuruTextField({
    super.key,
    required this.teslimTuruController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var teslimTurleri = ref.watch(teslimTuruProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: teslimTuruController,
        keyboardType: TextInputType.name,
        cursorColor: Color(MyColors.bg01),
        readOnly: true,
        style: TextStyle(
            color: Color(
          MyColors.bg01,
        )),
        decoration: InputDecoration(
          labelText: Constants.teslimTuru,
          labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(
                MyColors.bg01,
              )),
          prefixIcon: Icon(
            Icons.delivery_dining,
            color: Color(MyColors.bg01),
          ),
          suffix: InkWell(
            onTap: () {
              teslimTurleri.when(
                data: (data) {
                  List<TeslimTurleri> teslimTurleriList =
                      data.map((e) => e).toList();
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text(
                            Constants.teslimTuruSeciniz,
                            style: purpleBoldTxtStyle,
                          ),
                          children: [
                            SizedBox(
                              height: context.dynamicHeight * 0.4,
                              width: context.dynamicWidth * 0.5,
                              child: ListView.builder(
                                  itemCount: teslimTurleriList.length,
                                  itemBuilder: (context, index) {
                                    return SimpleDialogOption(
                                      onPressed: () {
                                        teslimTuruController.text =
                                            teslimTurleriList[index]
                                                .teslimTuruAdi
                                                .toString();
                                        Navigator.pop(
                                          context,
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              teslimTurleriList[index]
                                                  .teslimTuruKodu
                                                  .toString(),
                                              style: purpleTxtStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              teslimTurleriList[index]
                                                  .teslimTuruAdi,
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
