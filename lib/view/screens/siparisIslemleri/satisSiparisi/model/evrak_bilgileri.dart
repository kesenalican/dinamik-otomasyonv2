// To parse this JSON data, do
//
//     final evrakBilgileri = evrakBilgileriFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EvrakBilgileri evrakBilgileriFromMap(String str) =>
    EvrakBilgileri.fromMap(json.decode(str));

String evrakBilgileriToMap(EvrakBilgileri data) => json.encode(data.toMap());

class EvrakBilgileri {
  EvrakBilgileri({
    required this.ilkKayitNo,
    required this.seri,
    required this.siraNo,
    required this.sipTarihi,
    required this.teslimTarihi,
    required this.tipi,
    required this.siparisCinsi,
    required this.cariKodu,
    required this.cariIsmi,
    required this.miktar,
    required this.sipNetTutar,
    required this.kalanMiktar,
    required this.satirSayisi,
  });

  final String ilkKayitNo;
  final String seri;
  final int siraNo;
  final DateTime sipTarihi;
  final DateTime teslimTarihi;
  final String tipi;
  final String siparisCinsi;
  final String cariKodu;
  final String cariIsmi;
  final double miktar;
  final double sipNetTutar;
  final double kalanMiktar;
  final int satirSayisi;

  factory EvrakBilgileri.fromMap(Map<String, dynamic> json) => EvrakBilgileri(
        ilkKayitNo: json["ilkKayitNo"],
        seri: json["seri"],
        siraNo: json["siraNo"],
        sipTarihi: DateTime.parse(json["sipTarihi"]),
        teslimTarihi: DateTime.parse(json["teslimTarihi"]),
        tipi: json["tipi"],
        siparisCinsi: json["siparisCinsi"],
        cariKodu: json["cariKodu"],
        cariIsmi: json["cariIsmi"],
        miktar: json["miktar"],
        sipNetTutar: json["sipNetTutar"],
        kalanMiktar: json["kalanMiktar"],
        satirSayisi: json["satirSayisi"],
      );

  Map<String, dynamic> toMap() => {
        "ilkKayitNo": ilkKayitNo,
        "seri": seri,
        "siraNo": siraNo,
        "sipTarihi": sipTarihi.toIso8601String(),
        "teslimTarihi": teslimTarihi.toIso8601String(),
        "tipi": tipi,
        "siparisCinsi": siparisCinsi,
        "cariKodu": cariKodu,
        "cariIsmi": cariIsmi,
        "miktar": miktar,
        "sipNetTutar": sipNetTutar,
        "kalanMiktar": kalanMiktar,
        "satirSayisi": satirSayisi,
      };
}
