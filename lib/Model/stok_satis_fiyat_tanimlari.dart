import 'dart:convert';

StokSatisFiyatListeleri stokSatisFiyatListeleriFromMap(String str) =>
    StokSatisFiyatListeleri.fromMap(json.decode(str));

String stokSatisFiyatListeleriToMap(StokSatisFiyatListeleri data) =>
    json.encode(data.toMap());

class StokSatisFiyatListeleri {
  StokSatisFiyatListeleri({
    required this.siraNo,
    required this.aciklama,
  });

  final int siraNo;
  final String aciklama;

  factory StokSatisFiyatListeleri.fromMap(Map<String, dynamic> json) =>
      StokSatisFiyatListeleri(
        siraNo: json['sira_no'],
        aciklama: json['aciklama'],
      );

  Map<String, dynamic> toMap() => {
        'sira_no': siraNo,
        'aciklama': aciklama,
      };
}
