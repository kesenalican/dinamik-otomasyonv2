// To parse this JSON data, do
//
//     final cariBakiye = cariBakiyeFromMap(jsonString);

import 'dart:convert';

CariBakiye cariBakiyeFromMap(String str) =>
    CariBakiye.fromMap(json.decode(str));

String cariBakiyeToMap(CariBakiye data) => json.encode(data.toMap());

class CariBakiye {
  CariBakiye({
    this.anaDovizBorc = 0,
    this.anaDovizAlacak = 0,
    this.altDovizBorc = 0,
    this.altDovizAlacak = 0,
    this.orjDovizBorc = 0,
    this.orjDovizAlacak = 0,
  });

  double? anaDovizBorc;
  double? anaDovizAlacak;
  double? altDovizBorc;
  double? altDovizAlacak;
  double? orjDovizBorc;
  double? orjDovizAlacak;

  factory CariBakiye.fromMap(Map<String, dynamic> json) => CariBakiye(
        anaDovizBorc: json['anaDovizBorc'] ?? 0,
        anaDovizAlacak: json['anaDovizAlacak'] ?? 0,
        altDovizBorc: json['altDovizBorc'] ?? 0,
        altDovizAlacak: json['altDovizAlacak'] ?? 0,
        orjDovizBorc: json['orjDovizBorc'] ?? 0,
        orjDovizAlacak: json['orjDovizAlacak'] ?? 0,
      );

  Map<String, dynamic> toMap() => {
        'anaDovizBorc': anaDovizBorc,
        'anaDovizAlacak': anaDovizAlacak,
        'altDovizBorc': altDovizBorc,
        'altDovizAlacak': altDovizAlacak,
        'orjDovizBorc': orjDovizBorc,
        'orjDovizAlacak': orjDovizAlacak,
      };
}
