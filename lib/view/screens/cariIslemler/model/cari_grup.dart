// To parse this JSON data, do
//
//     final cariGrupModel = cariGrupModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CariGrupModel cariGrupModelFromMap(String str) =>
    CariGrupModel.fromMap(json.decode(str));

String cariGrupModelToMap(CariGrupModel data) => json.encode(data.toMap());

class CariGrupModel {
  CariGrupModel({
    required this.cariGrupKodu,
    required this.cariGrupIsmi,
  });

  final String cariGrupKodu;
  final String cariGrupIsmi;

  factory CariGrupModel.fromMap(Map<String, dynamic> json) => CariGrupModel(
        cariGrupKodu: json["CariGrupKodu"],
        cariGrupIsmi: json["CariGrupIsmi"],
      );

  Map<String, dynamic> toMap() => {
        "CariGrupKodu": cariGrupKodu,
        "CariGrupIsmi": cariGrupIsmi,
      };
}
