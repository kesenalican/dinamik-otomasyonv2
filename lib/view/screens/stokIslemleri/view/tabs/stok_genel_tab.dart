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
                hangiOzellik: Constants.barkodu,
                urunBilgi: stokModel.barkodu ?? ''),
            DetaySatir(
                hangiOzellik: Constants.urunKodu,
                urunBilgi: stokModel.stokKodu),
            DetaySatir(
                hangiOzellik: Constants.urunAdi, urunBilgi: stokModel.stokIsim),
            DetaySatir(
                hangiOzellik: Constants.bakiye,
                //Eldeki toplam Miktar
                urunBilgi: stokModel.stokMiktar.ceil().toString()),
            DetaySatir(
                hangiOzellik: Constants.birim,
                urunBilgi:
                    '${stokModel.stokBirim1} (1 ${stokModel.stokBirim1}) : ${stokModel.stokBirim3Katsayi.toInt()} adet'),
            stokModel.stokBirim2 != null
                ? DetaySatir(
                    hangiOzellik: Constants.birim2,
                    urunBilgi: stokModel.stokBirim2!)
                : const SizedBox(),
            stokModel.stokBirim3.isNotEmpty
                ? DetaySatir(
                    hangiOzellik: Constants.birim3,
                    urunBilgi: stokModel.stokBirim3)
                : const SizedBox(),
            DetaySatir(
                hangiOzellik: Constants.kdv,
                urunBilgi: '%${stokModel.perakendeVergiYuzde.ceil()}'),
            const DetaySatir(
                hangiOzellik: Constants.kategori, urunBilgi: 'kategori'),
            DetaySatir(
                hangiOzellik: Constants.anaGrup,
                urunBilgi: stokModel.stokAnaGrup),
            const DetaySatir(
              hangiOzellik: Constants.altGrup,
              urunBilgi: 'alt grup',
            ),
            DetaySatir(
                hangiOzellik: Constants.sektor,
                urunBilgi: stokModel.stokSektor),
            DetaySatir(
                hangiOzellik: Constants.reyon, urunBilgi: stokModel.stokReyon),
            DetaySatir(
                hangiOzellik: Constants.marka, urunBilgi: stokModel.stokMarka),
            DetaySatir(
                hangiOzellik: Constants.model, urunBilgi: stokModel.stokModel),
          ],
        ),
      ),
    );
  }
}
