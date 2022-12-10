// To parse this JSON data, do
//
//     final stokAnaGrup = stokAnaGrupFromMap(jsonString);

import 'dart:convert';

List<StokAnaGrup> stokAnaGrupFromMap(String str) =>
    List<StokAnaGrup>.from(json.decode(str).map((x) => StokAnaGrup.fromMap(x)));

String stokAnaGrupToMap(List<StokAnaGrup> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class StokAnaGrup {
  final String sanIsim;

  StokAnaGrup({
    required this.sanIsim,
  });

  factory StokAnaGrup.fromMap(Map<String, dynamic> json) => StokAnaGrup(
        sanIsim: json['san_isim'],
      );

  Map<String, dynamic> toMap() => {
        'san_isim': sanIsim,
      };
}
