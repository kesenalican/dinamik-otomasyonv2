import 'dart:convert';

class StokCariBilgileri {
  StokCariBilgileri({
    required this.sipCreateUser,
    required this.sipLastupUser,
    required this.sipTip,
    required this.sipSatirno,
    required this.sipMusteriKod,
    required this.sipStokKod,
    required this.sipStokAd,
    required this.sipBFiyat,
    required this.sipKdvsizFiyat,
    required this.sipMiktar,
    required this.sipTeslimMiktar,
    required this.sipTutar,
    required this.siparislerSipIskonto1,
    required this.siparislerSipIskonto2,
    required this.siparislerSipIskonto3,
    required this.siparislerSipIskonto4,
    required this.siparislerSipIskonto5,
    required this.siparislerSipIskonto6,
    required this.siparislerSipMasraf1,
    required this.siparislerSipMasraf2,
    required this.siparislerSipMasraf3,
    required this.siparislerSipMasraf4,
  });

  final int sipCreateUser;
  final int sipLastupUser;
  final int sipTip;
  final int? sipCins = 0;
  final int sipSatirno;
  final String sipMusteriKod;
  final String sipStokKod;
  final String sipStokAd;
  final double sipBFiyat;
  final double sipKdvsizFiyat;
  final int sipMiktar;
  final int sipTeslimMiktar;
  final double sipTutar;
  final int siparislerSipIskonto1;
  final int siparislerSipIskonto2;
  final int siparislerSipIskonto3;
  final int siparislerSipIskonto4;
  final int siparislerSipIskonto5;
  final int siparislerSipIskonto6;
  final int siparislerSipMasraf1;
  final int siparislerSipMasraf2;
  final int siparislerSipMasraf3;
  final int siparislerSipMasraf4;
  final int sipCariGrupno = 0;
}
