import 'package:dinamik_otomasyon/view/common/detay_satir.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:dinamik_otomasyon/core/constants/constant.dart';

class CariGenelTab extends ConsumerWidget {
  final Cariler cariList;

  const CariGenelTab({Key? key, required this.cariList}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          DetaySatir(
              hangiOzellik: Constants.cariKodu, urunBilgi: cariList.cariKodu),
          DetaySatir(
              hangiOzellik: Constants.cariUnvani,
              urunBilgi: cariList.cariUnvani1),
          DetaySatir(
              hangiOzellik: Constants.vergiDairesi,
              urunBilgi: cariList.cariVDaireAdi),
          DetaySatir(
              hangiOzellik: Constants.vergiNo,
              urunBilgi: cariList.cariVDaireNo),
          DetaySatir(
              hangiOzellik: Constants.bakiye,
              urunBilgi: cariList.cariBakiye == 0
                  ? cariList.cariBakiye!.ceil().toString()
                  : '${cariList.cariBakiye} TL'),
          DetaySatir(
              hangiOzellik: Constants.eFatura, urunBilgi: 'cariList.efatura'),
          DetaySatir(
              hangiOzellik: Constants.temsilci, urunBilgi: 'cariList.temsilci'),
          DetaySatir(hangiOzellik: Constants.grup, urunBilgi: 'cariList.grup'),
          DetaySatir(
              hangiOzellik: Constants.sektor, urunBilgi: 'cariList.sektor'),
          DetaySatir(
              hangiOzellik: Constants.bolge, urunBilgi: 'cariList.bolge'),
          DetaySatir(
              hangiOzellik: Constants.eMail, urunBilgi: cariList.cariEmail),
        ],
      ),
    );
  }
}
