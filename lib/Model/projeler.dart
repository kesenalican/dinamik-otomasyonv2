import 'dart:convert';

Projeler projelerFromMap(String str) => Projeler.fromMap(json.decode(str));

String projelerToMap(Projeler data) => json.encode(data.toMap());

class Projeler {
  Projeler({
    required this.projeKodu,
    required this.projeAdi,
  });

  final String projeKodu;
  final String projeAdi;

  factory Projeler.fromMap(Map<String, dynamic> json) => Projeler(
        projeKodu: json["projeKodu"],
        projeAdi: json["projeAdi"],
      );

  Map<String, dynamic> toMap() => {
        "projeKodu": projeKodu,
        "projeAdi": projeAdi,
      };
}
