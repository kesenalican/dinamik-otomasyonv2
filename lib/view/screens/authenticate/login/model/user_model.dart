import 'dart:convert';

UserModel userModelFromMap(String str) => UserModel.fromMap(json.decode(str));

String userModelToMap(UserModel data) => json.encode(data.toMap());

class UserModel {
  UserModel({
    required this.kullaniciNo,
    required this.kullaniciKisaAdi,
    required this.kullaniciUzunAdi,
    required this.kullaniciAdi,
  });
  final int kullaniciNo;
  final String kullaniciKisaAdi;
  final String kullaniciUzunAdi;
  final String kullaniciAdi;

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        kullaniciNo: json['KULLANICI_NO'],
        kullaniciKisaAdi: json['KULLANICI_KISA_ADI'],
        kullaniciUzunAdi: json['KULLANICI_UZUN_ADI'],
        kullaniciAdi: json['KULLANICI_ADI'],
      );

  Map<String, dynamic> toMap() => {
        'KULLANICI_NO': kullaniciNo,
        'KULLANICI_KISA_ADI': kullaniciKisaAdi,
        'KULLANICI_UZUN_ADI': kullaniciUzunAdi,
        'KULLANICI_ADI': kullaniciAdi,
      };
}
