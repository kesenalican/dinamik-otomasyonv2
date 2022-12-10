import 'dart:convert';

FirmaModel firmaModelFromMap(String str) =>
    FirmaModel.fromMap(json.decode(str));

String firmaModelToMap(FirmaModel data) => json.encode(data.toMap());

class FirmaModel {
  FirmaModel({
    required this.siraNo,
    required this.firmaUnvan,
  });

  final int siraNo;
  final String firmaUnvan;

  factory FirmaModel.fromMap(Map<String, dynamic> json) => FirmaModel(
        siraNo: json['SiraNo'],
        firmaUnvan: json['FirmaUnvan'],
      );

  Map<String, dynamic> toMap() => {
        'SiraNo': siraNo,
        'FirmaUnvan': firmaUnvan,
      };
}
