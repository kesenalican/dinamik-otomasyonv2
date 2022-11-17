import 'package:dinamik_otomasyon/view/common/detay_satir.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dinamik_otomasyon/core/constants/constant.dart';

class CariGenelTab extends ConsumerWidget {
  Cariler cariList;

  CariGenelTab({Key? key, required this.cariList}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DetaySatir(
              hangiOzellik: Constants.CARI_KODU, urunBilgi: cariList.cariKodu),
          DetaySatir(
              hangiOzellik: Constants.CARI_UNVANI,
              urunBilgi: cariList.cariUnvani1),
          DetaySatir(
              hangiOzellik: Constants.VERGI_DAIRE,
              urunBilgi: cariList.cariVDaireAdi),
          DetaySatir(
              hangiOzellik: Constants.VERGINO,
              urunBilgi: cariList.cariVDaireNo),
          DetaySatir(
              hangiOzellik: Constants.BAKIYE,
              urunBilgi: cariList.cariBakiye == 0
                  ? cariList.cariBakiye!.ceil().toString()
                  : cariList.cariBakiye.toString() + " TL"),
          DetaySatir(
              hangiOzellik: Constants.EFATURA, urunBilgi: "cariList.efatura"),
          DetaySatir(
              hangiOzellik: Constants.TEMSILCI, urunBilgi: "cariList.temsilci"),
          DetaySatir(hangiOzellik: Constants.GRUP, urunBilgi: "cariList.grup"),
          DetaySatir(
              hangiOzellik: Constants.SEKTOR, urunBilgi: "cariList.sektor"),
          DetaySatir(
              hangiOzellik: Constants.BOLGE, urunBilgi: "cariList.bolge"),
          DetaySatir(
              hangiOzellik: Constants.EMAIL, urunBilgi: cariList.cariEmail),
        ],
      ),
    );
  }
}
