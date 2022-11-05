// To parse this JSON data, do
//
//     final enCokSatilanUrunler = enCokSatilanUrunlerFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EnCokSatilanUrunlerModel enCokSatilanUrunlerFromMap(String str) =>
    EnCokSatilanUrunlerModel.fromMap(json.decode(str));

String enCokSatilanUrunlerToMap(EnCokSatilanUrunlerModel data) =>
    json.encode(data.toMap());

class EnCokSatilanUrunlerModel {
  EnCokSatilanUrunlerModel({
    required this.stokkodu,
    required this.miktar,
    required this.deger,
  });

  final String stokkodu;
  final double miktar;
  final double deger;

  factory EnCokSatilanUrunlerModel.fromMap(Map<String, dynamic> json) =>
      EnCokSatilanUrunlerModel(
        stokkodu: json["STOKKODU"],
        miktar: json["MIKTAR"],
        deger: json["DEGER"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "STOKKODU": stokkodu,
        "MIKTAR": miktar,
        "DEGER": deger,
      };
}
