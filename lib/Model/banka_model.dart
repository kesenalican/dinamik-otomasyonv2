// To parse this JSON data, do
//
//     final bankalar = bankalarFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Bankalar bankalarFromMap(String str) => Bankalar.fromMap(json.decode(str));

String bankalarToMap(Bankalar data) => json.encode(data.toMap());

class Bankalar {
  Bankalar({
    required this.banKod,
    required this.banIsmi,
  });

  final String banKod;
  final String banIsmi;

  factory Bankalar.fromMap(Map<String, dynamic> json) => Bankalar(
    banKod: json["ban_kod"],
    banIsmi: json["ban_ismi"],
  );

  Map<String, dynamic> toMap() => {
    "ban_kod": banKod,
    "ban_ismi": banIsmi,
  };
}
