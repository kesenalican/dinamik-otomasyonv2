import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/detay_satir.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';

class StokGenel extends ConsumerWidget {
  final Stoklar stokModel;

  const StokGenel({
    Key? key,
    required this.stokModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: context.dynamicHeight * 0.8,
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DetaySatir(
                hangiOzellik: Constants.URUN_KODU,
                urunBilgi: stokModel.stokKodu),
            DetaySatir(
                hangiOzellik: Constants.URUN_ADI,
                urunBilgi: stokModel.stokIsim),
            DetaySatir(
                hangiOzellik: Constants.BAKIYE,
                //Eldeki toplam Miktar
                urunBilgi: stokModel.stokMiktar.ceil().toString()),
            DetaySatir(
                hangiOzellik: Constants.BIRIM,
                urunBilgi:
                    "${stokModel.stokBirim1} (1 ${stokModel.stokBirim1}) : ${stokModel.stokBirim3Katsayi.toInt()} adet"),
            DetaySatir(
                hangiOzellik: Constants.BIRIM_2,
                urunBilgi: "stokModel.stokBirim2!"),
            DetaySatir(
                hangiOzellik: Constants.BIRIM_3,
                urunBilgi: stokModel.stokBirim3),
            DetaySatir(
                hangiOzellik: Constants.KDV,
                urunBilgi: "%${stokModel.perakendeVergiYuzde.ceil()}"),
            DetaySatir(hangiOzellik: Constants.KATEGORI, urunBilgi: "kategori"),
            DetaySatir(
                hangiOzellik: Constants.ANA_GRUP,
                urunBilgi: stokModel.stokAnaGrup),
            DetaySatir(
              hangiOzellik: Constants.ALT_GRUP,
              urunBilgi: "alt grup",
            ),
            DetaySatir(
                hangiOzellik: Constants.SEKTOR,
                urunBilgi: stokModel.stokSektor),
            DetaySatir(
                hangiOzellik: Constants.REYON, urunBilgi: stokModel.stokReyon),
            DetaySatir(
                hangiOzellik: Constants.MARKA, urunBilgi: stokModel.stokMarka),
            DetaySatir(
                hangiOzellik: Constants.MODEL, urunBilgi: stokModel.stokModel),
          ],
        ),
      ),
    );
  }
}
