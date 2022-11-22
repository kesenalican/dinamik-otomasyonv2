import 'dart:convert';

OdemePlani odemePlaniFromMap(String str) =>
    OdemePlani.fromMap(json.decode(str));

String odemePlaniToMap(OdemePlani data) => json.encode(data.toMap());

class OdemePlani {
  OdemePlani({
    required this.odemePlanNo,
    required this.odemePlanKod,
    required this.odemePlanAdi,
  });

  final int odemePlanNo;
  final String odemePlanKod;
  final String odemePlanAdi;

  factory OdemePlani.fromMap(Map<String, dynamic> json) => OdemePlani(
        odemePlanNo: json["OdemePlanNo"],
        odemePlanKod: json["OdemePlanKod"],
        odemePlanAdi: json["OdemePlanAdi"],
      );

  Map<String, dynamic> toMap() => {
        "OdemePlanNo": odemePlanNo,
        "OdemePlanKod": odemePlanKod,
        "OdemePlanAdi": odemePlanAdi,
      };
}
