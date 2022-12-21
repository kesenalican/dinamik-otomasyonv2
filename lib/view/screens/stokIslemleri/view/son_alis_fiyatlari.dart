import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SonAlisFiyatlari extends ConsumerWidget {
  final Stoklar stokModel;
  const SonAlisFiyatlari({Key? key, required this.stokModel}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var alisFiyatlari =
        ref.watch(stokAlisFiyatlariProvider(stokModel.stokKodu));
    return Scaffold(
      appBar: const CommonAppbar(whichPage: Constants.sonAlisFiyatlari),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: context.paddingDefault,
              padding: context.paddingDefault,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(MyColors.bg02),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  'Son Alış Fiyatları',
                  style: TextStyle(
                    color: Color(MyColors.bg01),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.dynamicHeight * 0.80,
              width: double.infinity,
              child: alisFiyatlari.when(
                  data: (data) {
                    List liste = data.map((e) => e).toList();
                    if (liste.isEmpty) {
                      return Center(
                          child: Text(
                        Constants.satisFaturasiBulunamadi,
                        style: purpleBoldTxtStyle,
                      ));
                    } else {
                      return ListView.builder(
                        itemCount: liste.length,
                        itemBuilder: (context, index) {
                          DateTime dateTime =
                              DateTime.parse(liste[index].tarih);
                          double brutFiyat = double.parse(
                              (liste[index].brutTutar).toStringAsFixed(2));
                          double netFiyat = double.parse(
                              (liste[index].netBirimFiyati).toStringAsFixed(2));
                          var formattedDate =
                              '${dateTime.year}/${dateTime.month}/${dateTime.day}';
                          return Column(
                            children: [
                              fiyatList(
                                  context: context,
                                  sirketAdi: liste[index].cariAdi,
                                  brutFiyati: brutFiyat,
                                  fiyati: netFiyat,
                                  miktar: liste[index].miktar,
                                  tarih: formattedDate),
                            ],
                          );
                        },
                      );
                    }
                  },
                  error: (err, stack) {
                    return showAlertDialog(
                      context: context,
                      hataBaslik: Constants.hataBaslik,
                      hataIcerik: err.toString(),
                    );
                  },
                  loading: () => const CommonLoading()),
            ),
          ],
        ),
      ),
    );
  }

  Widget fiyatList(
      {context,
      String? tarih,
      String? sirketAdi,
      double? fiyati,
      double? brutFiyati,
      double? miktar}) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(MyColors.bg01),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    sirketAdi!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    tarih!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Miktar: ${(miktar!).ceil()} '),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(' Brüt Fiyatı: ${brutFiyati!} TL'),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Net Fiyat: ${miktar * fiyati!} TL '),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
