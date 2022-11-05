// To parse this JSON data, do
//
//     final depo = depoFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Depo depoFromMap(String str) => Depo.fromMap(json.decode(str));

String depoToMap(Depo data) => json.encode(data.toMap());

class Depo {
  Depo({
    required this.depNo,
    required this.depAdi,
  });

  final int depNo;
  final String depAdi;

  factory Depo.fromMap(Map<String, dynamic> json) => Depo(
        depNo: json["dep_no"],
        depAdi: json["dep_adi"],
      );

  Map<String, dynamic> toMap() => {
        "dep_no": depNo,
        "dep_adi": depAdi,
      };
}
