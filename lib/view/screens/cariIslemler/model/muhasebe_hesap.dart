// To parse this JSON data, do
//
//     final muhasebeHesapModel = muhasebeHesapModelFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MuhasebeHesapModel muhasebeHesapModelFromMap(String str) => MuhasebeHesapModel.fromMap(json.decode(str));

String muhasebeHesapModelToMap(MuhasebeHesapModel data) => json.encode(data.toMap());

class MuhasebeHesapModel {
    MuhasebeHesapModel({
        required this.muhHesapKodu,
        required this.muhHesapIsim,
    });

    final String muhHesapKodu;
    final String muhHesapIsim;

    factory MuhasebeHesapModel.fromMap(Map<String, dynamic> json) => MuhasebeHesapModel(
        muhHesapKodu: json["MuhHesapKodu"],
        muhHesapIsim: json["MuhHesapIsim"],
    );

    Map<String, dynamic> toMap() => {
        "MuhHesapKodu": muhHesapKodu,
        "MuhHesapIsim": muhHesapIsim,
    };
}
