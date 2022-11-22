import 'dart:convert';

CariPersonel cariPersonelFromMap(String str) =>
    CariPersonel.fromMap(json.decode(str));

String cariPersonelToMap(CariPersonel data) => json.encode(data.toMap());

class CariPersonel {
  CariPersonel({
    required this.cariPersonelKodu,
    required this.cariPersonelAdi,
    required this.cariPersonelSoyadi,
    required this.kasiyer,
  });

  final String cariPersonelKodu;
  final String cariPersonelAdi;
  final String cariPersonelSoyadi;
  final String kasiyer;

  factory CariPersonel.fromMap(Map<String, dynamic> json) => CariPersonel(
        cariPersonelKodu: json["cariPersonelKodu"],
        cariPersonelAdi: json["cariPersonelAdi"],
        cariPersonelSoyadi: json["cariPersonelSoyadi"],
        kasiyer: json["kasiyer"],
      );

  Map<String, dynamic> toMap() => {
        "cariPersonelKodu": cariPersonelKodu,
        "cariPersonelAdi": cariPersonelAdi,
        "cariPersonelSoyadi": cariPersonelSoyadi,
        "kasiyer": kasiyer,
      };
}
