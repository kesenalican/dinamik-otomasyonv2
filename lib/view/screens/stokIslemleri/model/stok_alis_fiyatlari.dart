// To parse this JSON data, do
//
//     final stokAlisFiyatlari = stokAlisFiyatlariFromMap(jsonString);

import 'dart:convert';

StokAlisFiyatlari stokAlisFiyatlariFromMap(String str) =>
    StokAlisFiyatlari.fromMap(json.decode(str));

String stokAlisFiyatlariToMap(StokAlisFiyatlari data) =>
    json.encode(data.toMap());

class StokAlisFiyatlari {
  StokAlisFiyatlari({
    this.tarih,
    required this.cariKodu,
    this.cariAdi,
    this.miktar,
    this.birimAdi,
    this.brutBirimFiyati,
    this.netBirimFiyati,
    this.brutTutar,
  });

  final String? tarih;
  final String cariKodu;
  final String? cariAdi;
  final double? miktar;
  final String? birimAdi;
  final double? brutBirimFiyati;
  final double? netBirimFiyati;
  final double? brutTutar;

  factory StokAlisFiyatlari.fromMap(Map<String, dynamic> json) =>
      StokAlisFiyatlari(
        tarih: json['Tarih'],
        cariKodu: json['CariKodu'],
        cariAdi: json['CariAdi'],
        miktar: json['Miktar'],
        birimAdi: json['BirimAdi'],
        brutBirimFiyati: json['BrutBirimFiyati'],
        netBirimFiyati: json['NetBirimFiyati'],
        brutTutar: json['BrutTutar'],
      );

  Map<String, dynamic> toMap() => {
        'Tarih': tarih,
        'CariKodu': cariKodu,
        'CariAdi': cariAdi,
        'Miktar': miktar,
        'BirimAdi': birimAdi,
        'BrutBirimFiyati': brutBirimFiyati,
        'NetBirimFiyati': netBirimFiyati,
        'BrutTutar': brutTutar,
      };
}
