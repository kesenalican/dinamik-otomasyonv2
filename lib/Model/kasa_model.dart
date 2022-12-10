// To parse this JSON data, do
//
//     final kasaModel = kasaModelFromMap(jsonString);

import 'dart:convert';

KasaModel kasaModelFromMap(String str) => KasaModel.fromMap(json.decode(str));

String kasaModelToMap(KasaModel data) => json.encode(data.toMap());

class KasaModel {
  KasaModel({
    required this.kasaKodu,
    required this.kasaIsmi,
    required this.firmaNo,
    required this.kasaTipi,
    required this.bakiyeHareketSayisi,
  });

  final String kasaKodu;
  final String kasaIsmi;
  final int firmaNo;
  final String kasaTipi;
  final double bakiyeHareketSayisi;

  factory KasaModel.fromMap(Map<String, dynamic> json) => KasaModel(
        kasaKodu: json['kasaKodu'],
        kasaIsmi: json['kasaIsmi'],
        firmaNo: json['FirmaNo'],
        kasaTipi: json['kasaTipi'],
        bakiyeHareketSayisi: json['bakiyeHareketSayisi'].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'kasaKodu': kasaKodu,
        'kasaIsmi': kasaIsmi,
        'FirmaNo': firmaNo,
        'kasaTipi': kasaTipi,
        'bakiyeHareketSayisi': bakiyeHareketSayisi,
      };
}
