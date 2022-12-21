import 'package:dinamik_otomasyon/Model/cari_personel_tanimlari.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class CariPersonelTextField extends ConsumerWidget {
  TextEditingController cariPersonelController;
  CariPersonelTextField({
    super.key,
    required this.cariPersonelController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewmodel = ref.watch(satisSiparisViewModel);

    var cariPersoneller =
        ref.watch(cariPersonelProvider(viewmodel.alisMi ? 1 : 0));
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: cariPersonelController,
        keyboardType: TextInputType.name,
        cursorColor: Color(MyColors.bg01),
        readOnly: true,
        style: TextStyle(
            color: Color(
          MyColors.bg01,
        )),
        decoration: InputDecoration(
          labelText:
              viewmodel.alisMi ? Constants.satinAlmaci : Constants.satici,
          labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(
                MyColors.bg01,
              )),
          prefixIcon: Icon(
            Icons.person,
            color: Color(MyColors.bg01),
          ),
          suffix: InkWell(
            onTap: () {
              cariPersoneller.when(
                data: (data) {
                  List<CariPersonelTanimlari> cariPersonellerList =
                      data.map((e) => e).toList();
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text(
                            viewmodel.alisMi
                                ? Constants.satinAlmaciSeciniz
                                : Constants.saticiSeciniz,
                            style: purpleBoldTxtStyle,
                          ),
                          children: [
                            SizedBox(
                              height: context.dynamicHeight * 0.4,
                              width: context.dynamicWidth * 0.5,
                              child: ListView.builder(
                                  itemCount: cariPersonellerList.length,
                                  itemBuilder: (context, index) {
                                    return SimpleDialogOption(
                                      onPressed: () {
                                        cariPersonelController.text =
                                            cariPersonellerList[index]
                                                .cariPersonelAdi
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
                                              cariPersonellerList[index]
                                                  .cariPersonelKodu
                                                  .toString(),
                                              style: purpleTxtStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              cariPersonellerList[index]
                                                  .cariPersonelAdi,
                                              style: purpleTxtStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              cariPersonellerList[index]
                                                  .cariPersonelSoyadi,
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
                    context: context,
                    hataBaslik: 'Hata',
                    hataIcerik: err.toString()),
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
