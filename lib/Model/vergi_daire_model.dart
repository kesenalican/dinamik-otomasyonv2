import 'package:meta/meta.dart';
import 'dart:convert';

VergiDaireModel vergiDaireModelFromMap(String str) =>
    VergiDaireModel.fromMap(json.decode(str));

String vergiDaireModelToMap(VergiDaireModel data) => json.encode(data.toMap());

class VergiDaireModel {
  VergiDaireModel({
    required this.vergiDaireKodu,
    required this.vergiDaireAdi,
    required this.vergiDaireIl,
  });

  final String vergiDaireKodu;
  final String vergiDaireAdi;
  final String vergiDaireIl;

  factory VergiDaireModel.fromMap(Map<String, dynamic> json) => VergiDaireModel(
        vergiDaireKodu: json["VergiDaireKodu"],
        vergiDaireAdi: json["VergiDaireAdi"],
        vergiDaireIl: json["VergiDaireIl"],
      );

  Map<String, dynamic> toMap() => {
        "VergiDaireKodu": vergiDaireKodu,
        "VergiDaireAdi": vergiDaireAdi,
        "VergiDaireIl": vergiDaireIl,
      };
}
