// To parse this JSON data, do
//
//     final kurlar = kurlarFromMap(jsonString);

import 'dart:convert';

Kurlar kurlarFromMap(String str) => Kurlar.fromMap(json.decode(str));

String kurlarToMap(Kurlar data) => json.encode(data.toMap());

class Kurlar {
  Kurlar({
    required this.kurNumarasi,
    required this.kurSembolu,
    required this.kurOrjinalIsmi,
  });

  final int kurNumarasi;
  final String kurSembolu;
  final String kurOrjinalIsmi;

  factory Kurlar.fromMap(Map<String, dynamic> json) => Kurlar(
        kurNumarasi: json["KUR_NUMARASI"],
        kurSembolu: json["KUR_SEMBOLU"],
        kurOrjinalIsmi: json["KUR_ORJINAL_ISMI"],
      );

  Map<String, dynamic> toMap() => {
        "KUR_NUMARASI": kurNumarasi,
        "KUR_SEMBOLU": kurSembolu,
        "KUR_ORJINAL_ISMI": kurOrjinalIsmi,
      };
}
