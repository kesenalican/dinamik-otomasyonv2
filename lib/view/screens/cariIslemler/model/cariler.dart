import 'dart:convert';

Cariler carilerFromMap(String str) => Cariler.fromMap(json.decode(str));

String carilerToMap(Cariler data) => json.encode(data.toMap());

class Cariler {
  Cariler({
    required this.cariKodu,
    this.cariUnvani1,
    this.cariUnvani2,
    this.cariVDaireAdi,
    this.cariVDaireNo,
    this.cariEmail,
    this.cariCepTel,
    this.cariBakiye,
  });

  
  final String cariKodu;
  final String? cariUnvani1;
  final String? cariUnvani2;
  final String? cariVDaireAdi;
  final String? cariVDaireNo;
  final String? cariEmail;
  final String? cariCepTel;
  final double? cariBakiye;


  factory Cariler.fromMap(Map<String, dynamic> json) => Cariler(
        cariKodu: json['CariKodu'],
        cariUnvani1: json['CariUnvani1'],
        cariUnvani2: json['CariUnvani2'],
        cariVDaireAdi: json['CariVDaireAdi'],
        cariVDaireNo: json['CariVDaireNo'],
        cariEmail: json['CariEmail'],
        cariCepTel: json['CariCepTel'],
        cariBakiye: json['CariBakiye'],
      );

  Map<String, dynamic> toMap() => {
        'CariKodu': cariKodu,
        'CariUnvani1': cariUnvani1,
        'CariUnvani2': cariUnvani2,
        'CariVDaireAdi': cariVDaireAdi,
        'CariVDaireNo': cariVDaireNo,
        'CariEmail': cariEmail,
        'CariCepTel': cariCepTel,
        'CariBakiye': cariBakiye,
      };
}
