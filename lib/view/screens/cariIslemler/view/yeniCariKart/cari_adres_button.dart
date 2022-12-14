import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_adres_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/service/cari_services.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CariNewAdressButton extends ConsumerWidget {
  final TextEditingController cariKoduController;
  final TextEditingController adresKoduController;
  const CariNewAdressButton(
      {super.key,
      required this.cariKoduController,
      required this.adresKoduController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        if (cariKoduController.text == '') {
          showAlertDialog(
            context: context,
            hataBaslik: 'Hata',
            hataIcerik: 'Önce Cari Kodu Giriniz!',
          );
          return;
        }
        var cariAdresList =
            ref.watch(cariAdresProvider(cariKoduController.text));
        showDialog(
            context: context,
            builder: (context) {
              return SimpleDialog(
                title: Text(
                  'Adres Kartları',
                  style: purpleBoldTxtStyle,
                ),
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/yeniCariAdres',
                          arguments: cariKoduController);
                    },
                    icon: Icon(
                      Icons.add,
                      color: Color(MyColors.bg01),
                    ),
                  ),
                  SizedBox(
                    height: context.dynamicHeight * 0.4,
                    width: context.dynamicWidth * 0.5,
                    child: cariAdresList.when(
                      data: (data) {
                        List<CariAdresModel> cariAdresler =
                            data.map((e) => e).toList();
                        // if (cariAdresler.isNotEmpty) {
                        return ListView.builder(
                          itemCount: cariAdresler.length,
                          itemBuilder: (context, index) {
                            return SimpleDialogOption(
                              onPressed: () {
                                Navigator.of(context).pop(
                                  adresKoduController.text =
                                      cariAdresler[index].adrAdresNo.toString(),
                                );
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      cariAdresler[index].adrAdresNo.toString(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      cariAdresler[index].adrUlke,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      cariAdresler[index].adrIl,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                        // } else {
                        //   return Text("Cari Adres Ekle");
                        // }
                      },
                      error: (err, stack) => showAlertDialog(
                        context: context,
                        hataBaslik: 'hata',
                        hataIcerik: 'hata',
                      ),
                      loading: () => const CommonLoading(),
                    ),
                  ),
                ],
              );
            });
      },
      child: Icon(Icons.add,
          color: Color(
            MyColors.bg01,
          )),
    );
  }
}
