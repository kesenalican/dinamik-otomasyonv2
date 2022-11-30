import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_button.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
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
        SizedBox(
          height: context.dynamicHeight * 0.6,
          child: ListView.builder(
            itemCount: siparisModel.siparisler.length,
            itemBuilder: (context, index) {
              return Container(
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
                                  fontSize: 12,
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
                                  fontSize: 10,
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
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                "${siparisModel.siparisler[index].sipTutar} TL",
                                style: TextStyle(
                                  color: Color(MyColors.bg01),
                                  fontSize: 10,
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
              );
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Toplam Satır = ${siparisModel.siparisler.length}",
              style: purpleTxtStyle,
            ),
            Text(
              "Toplam Tutar = ${siparisModel.toplamTutar}",
              style: purpleTxtStyle,
            ),
          ],
        ),
      ],
    ));
  }
}
