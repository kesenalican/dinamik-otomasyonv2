// To parse this JSON data, do
//
//     final stokSatisFiyatlari = stokSatisFiyatlariFromMap(jsonString);

import 'dart:convert';

StokSatisFiyatlari stokSatisFiyatlariFromMap(String str) =>
    StokSatisFiyatlari.fromMap(json.decode(str));

String stokSatisFiyatlariToMap(StokSatisFiyatlari data) =>
    json.encode(data.toMap());

class StokSatisFiyatlari {
  StokSatisFiyatlari({
    required this.tarih,
    required this.cariKodu,
    required this.cariAdi,
    required this.miktar,
    required this.birimAdi,
    required this.brutBirimFiyati,
    required this.netBirimFiyati,
    required this.brutTutar,
  });

  final DateTime tarih;
  final String cariKodu;
  final String cariAdi;
  final double miktar;
  final String birimAdi;
  final double brutBirimFiyati;
  final double netBirimFiyati;
  final double brutTutar;

  factory StokSatisFiyatlari.fromMap(Map<String, dynamic> json) =>
      StokSatisFiyatlari(
        tarih: DateTime.parse(json['Tarih']),
        cariKodu: json['CariKodu'],
        cariAdi: json['CariAdi'],
        miktar: json['Miktar'],
        birimAdi: json['BirimAdi'],
        brutBirimFiyati: json['BrutBirimFiyati'].toDouble(),
        netBirimFiyati: json['NetBirimFiyati'].toDouble(),
        brutTutar: json['BrutTutar'].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'Tarih': tarih.toIso8601String(),
        'CariKodu': cariKodu,
        'CariAdi': cariAdi,
        'Miktar': miktar,
        'BirimAdi': birimAdi,
        'BrutBirimFiyati': brutBirimFiyati,
        'NetBirimFiyati': netBirimFiyati,
        'BrutTutar': brutTutar,
      };
}
