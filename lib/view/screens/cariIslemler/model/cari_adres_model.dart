import 'dart:convert';

CariAdresModel cariAdresModelFromMap(String str) =>
    CariAdresModel.fromMap(json.decode(str));

String cariAdresModelToMap(CariAdresModel data) => json.encode(data.toMap());

class CariAdresModel {
  CariAdresModel({
    required this.adrCreateUser,
    required this.adrCariKod,
    required this.adrAdresNo,
    required this.adrCadde,
    required this.adrMahalle,
    required this.adrSokak,
    required this.adrIlce,
    required this.adrIl,
    required this.adrUlke,
    required this.adrTelUlkeKodu,
    required this.adrTelModem,
  });

  final int? adrDbCno = 0;
  final int? adrSpecReCno = 0;
  final bool? adrIptal = false;
  final int? adrFileid = 0;
  final bool? adrHidden = false;
  final bool? adrKilitli = false;
  final bool? adrDegisti = false;
  final int? adrChecksum = 0;
  final int adrCreateUser;
  final DateTime adrCreateDate = DateTime.now();
  final int adrLastupUser = 0;
  final DateTime adrLastupDate = DateTime.now();
  final String? adrSpecial1 = "";
  final String? adrSpecial2 = "";
  final String? adrSpecial3 = "";
  final String adrCariKod;
  final int adrAdresNo;
  final bool adrAprintFl = false;
  final String adrCadde;
  final String adrMahalle;
  final String adrSokak;
  final String? adrSemt = "";
  final String? adrAptNo = "";
  final String? adrDaireNo = "";
  final String? adrPostaKodu = "";
  final String adrIlce;
  final String adrIl;
  final String adrUlke;
  final String? adrAdresKodu = "";
  final String adrTelUlkeKodu;
  final String? adrTelBolgeKodu = "";
  final String? adrTelNo1 = "";
  final String? adrTelNo2 = "";
  final String adrTelFaxno = "";
  final String adrTelModem;
  final String adrYonKodu = "";
  final int adrUzaklikKodu = 0;
  final String adrTemsilciKodu = "";
  final String adrOzelNot = "";
  final int adrZiyaretperyodu = 0;
  final int adrZiyaretgunu = 0;
  final int adrGpsEnlem = 0;
  final int adrGpsBoylam = 0;
  final int adrZiyarethaftasi = 0;
  final bool adrZiygunu21 = false;
  final bool adrZiygunu22 = false;
  final bool adrZiygunu23 = false;
  final bool adrZiygunu24 = false;
  final bool adrZiygunu25 = false;
  final bool adrZiygunu26 = false;
  final bool adrZiygunu27 = false;
  final String adrEfaturaAlias = "";
  final String adrEirsaliyeAlias = "";

  factory CariAdresModel.fromMap(Map<String, dynamic> json) => CariAdresModel(
        adrCreateUser: json["adr_create_user"],
        adrCariKod: json["adr_cari_kod"],
        adrAdresNo: json["adr_adres_no"],
        adrCadde: json["adr_cadde"],
        adrMahalle: json["adr_mahalle"],
        adrSokak: json["adr_sokak"],
        adrIlce: json["adr_ilce"],
        adrIl: json["adr_il"],
        adrUlke: json["adr_ulke"],
        adrTelUlkeKodu: json["adr_tel_ulke_kodu"],
        adrTelModem: json["adr_tel_modem"],
      );

  Map<String, dynamic> toMap() => {
        "adr_DBCno": adrDbCno,
        "adr_SpecRECno": adrSpecReCno,
        "adr_iptal": adrIptal,
        "adr_fileid": adrFileid,
        "adr_hidden": adrHidden,
        "adr_kilitli": adrKilitli,
        "adr_degisti": adrDegisti,
        "adr_checksum": adrChecksum,
        "adr_create_user": adrCreateUser,
        "adr_create_date": adrCreateDate.toIso8601String(),
        "adr_lastup_user": adrLastupUser,
        "adr_lastup_date": adrLastupDate.toIso8601String(),
        "adr_special1": adrSpecial1,
        "adr_special2": adrSpecial2,
        "adr_special3": adrSpecial3,
        "adr_cari_kod": adrCariKod,
        "adr_adres_no": adrAdresNo,
        "adr_aprint_fl": adrAprintFl,
        "adr_cadde": adrCadde,
        "adr_mahalle": adrMahalle,
        "adr_sokak": adrSokak,
        "adr_Semt": adrSemt,
        "adr_Apt_No": adrAptNo,
        "adr_Daire_No": adrDaireNo,
        "adr_posta_kodu": adrPostaKodu,
        "adr_ilce": adrIlce,
        "adr_il": adrIl,
        "adr_ulke": adrUlke,
        "adr_Adres_kodu": adrAdresKodu,
        "adr_tel_ulke_kodu": adrTelUlkeKodu,
        "adr_tel_bolge_kodu": adrTelBolgeKodu,
        "adr_tel_no1": adrTelNo1,
        "adr_tel_no2": adrTelNo2,
        "adr_tel_faxno": adrTelFaxno,
        "adr_tel_modem": adrTelModem,
        "adr_yon_kodu": adrYonKodu,
        "adr_uzaklik_kodu": adrUzaklikKodu,
        "adr_temsilci_kodu": adrTemsilciKodu,
        "adr_ozel_not": adrOzelNot,
        "adr_ziyaretperyodu": adrZiyaretperyodu,
        "adr_ziyaretgunu": adrZiyaretgunu,
        "adr_gps_enlem": adrGpsEnlem,
        "adr_gps_boylam": adrGpsBoylam,
        "adr_ziyarethaftasi": adrZiyarethaftasi,
        "adr_ziygunu2_1": adrZiygunu21,
        "adr_ziygunu2_2": adrZiygunu22,
        "adr_ziygunu2_3": adrZiygunu23,
        "adr_ziygunu2_4": adrZiygunu24,
        "adr_ziygunu2_5": adrZiygunu25,
        "adr_ziygunu2_6": adrZiygunu26,
        "adr_ziygunu2_7": adrZiygunu27,
        "adr_efatura_alias": adrEfaturaAlias,
        "adr_eirsaliye_alias": adrEirsaliyeAlias,
      };
}
