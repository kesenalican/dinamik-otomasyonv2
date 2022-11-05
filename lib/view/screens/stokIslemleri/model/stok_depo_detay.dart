import 'dart:convert';

StokDepoDetay stokDepoDetayFromMap(String str) =>
    StokDepoDetay.fromMap(json.decode(str));

String stokDepoDetayToMap(StokDepoDetay data) => json.encode(data.toMap());

class StokDepoDetay {
  StokDepoDetay({
    required this.sdpDepoKod,
    required this.sdpDepoNo,
  });

  final String sdpDepoKod;
  final int sdpDepoNo;

  factory StokDepoDetay.fromMap(Map<String, dynamic> json) => StokDepoDetay(
        sdpDepoKod: json["sdp_depo_kod"],
        sdpDepoNo: json["sdp_depo_no"],
      );

  Map<String, dynamic> toMap() => {
        "sdp_depo_kod": sdpDepoKod,
        "sdp_depo_no": sdpDepoNo,
      };
}
