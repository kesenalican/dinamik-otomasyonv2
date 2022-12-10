import 'dart:convert';

SormMerkezi sormMerkeziFromMap(String str) =>
    SormMerkezi.fromMap(json.decode(str));

String sormMerkeziToMap(SormMerkezi data) => json.encode(data.toMap());

class SormMerkezi {
  SormMerkezi({
    required this.merkezKodu,
    required this.merkezAdi,
  });

  final String merkezKodu;
  final String merkezAdi;

  factory SormMerkezi.fromMap(Map<String, dynamic> json) => SormMerkezi(
        merkezKodu: json['MerkezKodu'],
        merkezAdi: json['MerkezAdi'],
      );

  Map<String, dynamic> toMap() => {
        'MerkezKodu': merkezKodu,
        'MerkezAdi': merkezAdi,
      };
}
