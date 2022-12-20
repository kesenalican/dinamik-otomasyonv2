import 'dart:convert';

CariPersonelTanimlari cariPersonelTanimlariFromMap(String str) =>
    CariPersonelTanimlari.fromMap(json.decode(str));

String cariPersonelTanimlariToMap(CariPersonelTanimlari data) =>
    json.encode(data.toMap());

class CariPersonelTanimlari {
  CariPersonelTanimlari({
    required this.cariPersonelKodu,
    required this.cariPersonelAdi,
    required this.cariPersonelSoyadi,
    required this.kasiyer,
    required this.personelTipi,
  });

  final String cariPersonelKodu;
  final String cariPersonelAdi;
  final String cariPersonelSoyadi;
  final String kasiyer;
  final int personelTipi;

  factory CariPersonelTanimlari.fromMap(Map<String, dynamic> json) =>
      CariPersonelTanimlari(
        cariPersonelKodu: json['cari_personel_kodu'],
        cariPersonelAdi: json['cari_personel_adi'],
        cariPersonelSoyadi: json['cari_personel_soyadi'],
        kasiyer: json['kasiyer'],
        personelTipi: json['personelTipi'],
      );

  Map<String, dynamic> toMap() => {
        'cari_personel_kodu': cariPersonelKodu,
        'cari_personel_adi': cariPersonelAdi,
        'cari_personel_soyadi': cariPersonelSoyadi,
        'kasiyer': kasiyer,
        'personelTipi': personelTipi,
      };
}
