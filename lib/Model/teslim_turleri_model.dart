import 'dart:convert';

TeslimTurleri teslimTurleriFromMap(String str) =>
    TeslimTurleri.fromMap(json.decode(str));

String teslimTurleriToMap(TeslimTurleri data) => json.encode(data.toMap());

class TeslimTurleri {
  TeslimTurleri({
    required this.teslimTuruKodu,
    required this.teslimTuruAdi,
  });

  final String teslimTuruKodu;
  final String teslimTuruAdi;

  factory TeslimTurleri.fromMap(Map<String, dynamic> json) => TeslimTurleri(
        teslimTuruKodu: json['teslimTuruKodu'],
        teslimTuruAdi: json['teslimTuruAdi'],
      );

  Map<String, dynamic> toMap() => {
        'teslimTuruKodu': teslimTuruKodu,
        'teslimTuruAdi': teslimTuruAdi,
      };
}
