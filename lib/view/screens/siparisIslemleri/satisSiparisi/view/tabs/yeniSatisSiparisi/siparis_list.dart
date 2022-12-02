import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_button.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/stok_detay.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/stok_karti.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SiparisListesi extends ConsumerWidget {
  const SiparisListesi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var siparisModel = ref.watch(satisSiparisViewModel);
    return SingleChildScrollView(
        child: Column(
      children: [
        InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StokKartlari(
                            detayaGitmesin: true,
                          )));
            },
            child: CommonButton(buttonName: "Ürün Ekle +")),
        InkWell(
            onTap: () {}, child: CommonButton(buttonName: "İskonto Ekle +")),
        SizedBox(
          height: context.dynamicHeight * 0.6,
          child: ListView.builder(
            itemCount: siparisModel.siparisler.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Future.delayed(const Duration(milliseconds: 500), () {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              "Ne yapmak istiyorsunuz?",
                              style: purpleTxtStyle,
                            ),
                            actions: [
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(MyColors.bg01)),
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => StokDetay(
                                              stokModel:
                                                  siparisModel.savedStok!)));
                                },
                                child: Text(
                                  "Detay",
                                  style: whiteTxtStyle,
                                ),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(MyColors.bg01)),
                                ),
                                onPressed: () {
                                  siparisModel.deleteItemToSiparisList(
                                      siparisModel.siparisler[index]);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Sil",
                                  style: whiteTxtStyle,
                                ),
                              ),
                            ],
                          );
                        });
                  });
                },
                child: Container(
                  margin: EdgeInsets.symmetric(
                      vertical: context.dynamicHeight * 0.005,
                      horizontal: context.dynamicWidth * 0.03),
                  child: Card(
                    elevation: 4,
                    color: Color(MyColors.bg),
                    margin: EdgeInsets.zero,
                    child: Padding(
                      padding: EdgeInsets.all(context.dynamicHeight * 0.01),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  siparisModel.siparisler[index].sipStokAd,
                                  style: TextStyle(
                                    color: Color(MyColors.bg01),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 15,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                ),
                                SizedBox(
                                  height: context.dynamicHeight * 0.01,
                                ),
                                Text(
                                  siparisModel.siparisler[index].sipStokKod
                                      .toString(),
                                  style: TextStyle(
                                    color: Color(MyColors.bg01),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  siparisModel.savedCari!.cariUnvani1!,
                                  style: TextStyle(
                                    color: Color(MyColors.bg01),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),

                          //FİYAT
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(
                                      context.dynamicHeight * 0.006),
                                  child: Text(
                                    "Adet: ${siparisModel.siparisler[index].sipMiktar}",
                                    style: TextStyle(
                                      color: Color(MyColors.bg01),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  "${siparisModel.siparisler[index].sipTutar.toStringAsFixed(2)} ${siparisModel.savedStok!.stokKur == "Türk Lirası" ? "TL" : "${siparisModel.savedStok!.stokKur}"}",
                                  style: TextStyle(
                                    color: Color(MyColors.bg01),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        // SizedBox(
        //   height: context.dynamicHeight * 0.05,
        // ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceAround,
        //   children: [
        //     Text(
        //       "Toplam Satır = ${siparisModel.siparisler.length}",
        //       style: purpleTxtStyle,
        //     ),
        //     Text(
        //       "Toplam Tutar = ${siparisModel.anaToplamTutar.toStringAsFixed(2)}",
        //       style: purpleTxtStyle,
        //       overflow: TextOverflow.ellipsis,
        //     ),
        //   ],
        // ),
      ],
    ));
  }
}
