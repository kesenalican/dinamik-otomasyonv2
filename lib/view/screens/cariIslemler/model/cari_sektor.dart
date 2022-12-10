// To parse this JSON data, do
//
//     final cariSektorModel = cariSektorModelFromMap(jsonString);

import 'dart:convert';

CariSektorModel cariSektorModelFromMap(String str) =>
    CariSektorModel.fromMap(json.decode(str));

String cariSektorModelToMap(CariSektorModel data) => json.encode(data.toMap());

class CariSektorModel {
  CariSektorModel({
    required this.sektorKodu,
    required this.sektorIsmi,
  });

  final String sektorKodu;
  final String sektorIsmi;

  factory CariSektorModel.fromMap(Map<String, dynamic> json) => CariSektorModel(
        sektorKodu: json['SektorKodu'],
        sektorIsmi: json['SektorIsmi'],
      );

  Map<String, dynamic> toMap() => {
        'SektorKodu': sektorKodu,
        'SektorIsmi': sektorIsmi,
      };
}
