import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/evrak_bilgileri.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/service/satis_siparisi_service.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EvrakNoTextField extends ConsumerWidget {
  final TextEditingController evrakNoController;
  const EvrakNoTextField({
    super.key,
    required this.evrakNoController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var evraklar = ref.watch(evrakBilgileriProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: key,
        controller: evrakNoController,
        keyboardType: TextInputType.name,
        cursorColor: Color(MyColors.bg01),
        textInputAction: TextInputAction.next,
        readOnly: false,
        style: TextStyle(
            color: Color(
          MyColors.bg01,
        )),
        decoration: InputDecoration(
          labelText: Constants.evrakNo,
          labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(
                MyColors.bg01,
              )),
          prefixIcon: Icon(
            Icons.paste_rounded,
            color: Color(MyColors.bg01),
          ),
          suffix: InkWell(
            onTap: () {
              evraklar.when(
                data: (data) {
                  List<EvrakBilgileri> evrakList = data.map((e) => e).toList();
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text(
                            'Proje',
                            style: purpleBoldTxtStyle,
                          ),
                          children: [
                            SizedBox(
                              height: context.dynamicHeight * 0.4,
                              width: context.dynamicWidth * 0.5,
                              child: ListView.builder(
                                  itemCount: evrakList.length,
                                  itemBuilder: (context, index) {
                                    return SimpleDialogOption(
                                      onPressed: () {
                                        evrakNoController.text =
                                            evrakList[index].siraNo.toString();
                                        Navigator.pop(
                                          context,
                                          EvrakBilgileri(
                                            ilkKayitNo:
                                                evrakList[index].ilkKayitNo,
                                            seri: evrakList[index].seri,
                                            siraNo: evrakList[index].siraNo,
                                            sipTarihi:
                                                evrakList[index].sipTarihi,
                                            teslimTarihi:
                                                evrakList[index].teslimTarihi,
                                            tipi: evrakList[index].tipi,
                                            siparisCinsi:
                                                evrakList[index].siparisCinsi,
                                            cariKodu: evrakList[index].cariKodu,
                                            cariIsmi: evrakList[index].cariIsmi,
                                            miktar: evrakList[index].miktar,
                                            sipNetTutar:
                                                evrakList[index].sipNetTutar,
                                            kalanMiktar:
                                                evrakList[index].kalanMiktar,
                                            satirSayisi:
                                                evrakList[index].satirSayisi,
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              evrakList[index].tipi,
                                              style: purpleTxtStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              evrakList[index].seri,
                                              style: purpleTxtStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              evrakList[index]
                                                  .siraNo
                                                  .toString(),
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
                    context: context, hataBaslik: 'hata', hataIcerik: 'hata'),
                loading: () => const CommonLoading(),
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
      ),
    );
  }
}
