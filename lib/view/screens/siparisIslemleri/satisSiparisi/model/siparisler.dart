// To parse this JSON data, do
//
//     final siparisler = siparislerFromMap(jsonString);

import 'dart:convert';

Siparisler siparislerFromMap(String str) =>
    Siparisler.fromMap(json.decode(str));
String siparislerToMap(Siparisler data) => json.encode(data.toMap());

class Siparisler {
  Siparisler({
    required this.sipCreateUser,
    required this.sipLastupUser,
    required this.sipTip,
    required this.sipEvraknoSeri,
    required this.sipEvraknoSira,
    required this.sipSatirno,
    required this.sipSaticiKod,
    required this.sipMusteriKod,
    required this.sipStokKod,
    required this.sipBFiyat,
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
    required this.sipAciklama,
    required this.sipDepono,
    required this.sipOnaylayanKulNo,
    required this.sipDovizCinsi,
  });

  final int? sipDbCno = 0;
  final int? sipSpecReCno = 0;
  final bool? sipIptal = false;
  final int sipFileid = 21;
  final bool? sipHidden = false;
  final bool? sipKilitli = false;
  final bool? sipDegisti = false;
  final int? sipChecksum = 0;
  final int sipCreateUser;
  final DateTime sipCreateDate = DateTime.now();
  final int sipLastupUser;
  final DateTime? sipLastupDate = DateTime.now();
  final String? sipSpecial1 = "";
  final String? sipSpecial2 = "";
  final String? sipSpecial3 = "";
  final int? sipFirmano = 0;
  final int? sipSubeno = 0;
  final DateTime sipTarih = DateTime.now();
  final DateTime? sipTeslimTarih = DateTime.now();
  final int sipTip;
  final int? sipCins = 0;
  final String sipEvraknoSeri;
  final int sipEvraknoSira;
  final int sipSatirno;
  final String sipBelgeno = "";
  final DateTime sipBelgeTarih = DateTime.now();
  final String sipSaticiKod;
  final String sipMusteriKod;
  final String sipStokKod;
  final double sipBFiyat;
  final int sipMiktar;
  final int sipBirimPntr = 0;
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
  final int sipVergiPntr = 0;
  final double sipVergi = 0;
  final int sipMasvergiPntr = 0;
  final int sipMasvergi = 0;
  final int sipOpno = 0;
  final String sipAciklama;
  final String sipAciklama2 = "";
  final int sipDepono;
  final int sipOnaylayanKulNo;
  final bool sipVergisizFl = false;
  final bool sipKapatFl = false;
  final bool sipPromosyonFl = false;
  final String sipCariSormerk = "";
  final String sipStokSormerk = "";
  final int sipCariGrupno = 0;
  final int sipDovizCinsi;
  final int sipDovizKuru = 0;
  final double sipAltDovizKuru = 0;
  final int sipAdresno = 0;
  final String sipTeslimturu = "";
  final bool sipCagrilabilirFl = false;
  final int sipIskonto1 = 0;
  final int sipIskonto2 = 0;
  final int sipIskonto3 = 0;
  final int sipIskonto4 = 0;
  final int sipIskonto5 = 0;
  final int sipIskonto6 = 0;
  final int sipMasraf1 = 0;
  final int sipMasraf2 = 0;
  final int sipMasraf3 = 0;
  final int sipMasraf4 = 0;
  final bool sipIsk1 = false;
  final bool sipIsk2 = false;
  final bool sipIsk3 = false;
  final bool sipIsk4 = false;
  final bool sipIsk5 = false;
  final bool sipIsk6 = false;
  final bool sipMas1 = false;
  final bool sipMas2 = false;
  final bool sipMas3 = false;
  final bool sipMas4 = false;
  final String sipExpImpKodu = "";
  final int sipKarOrani = 0;
  final int sipDurumu = 0;

  final int sipPlanlananmiktar = 0;
  final String sipPartiKodu = "";
  final int sipLotNo = 0;
  final String sipProjekodu = "";
  final int sipFiyatListeNo = 0;
  final int sipOtvPntr = 0;
  final int sipOtvVergi = 0;
  final int sipOtvtutari = 0;
  final int sipOtvVergisizFl = 0;
  final String sipPaketKod = "";
  final int sipHarekettipi = 0;
  final String sipKapatmanedenkod = "";
  final DateTime sipGecerlilikTarihi = DateTime.now();
  final int sipOnodemeEvrakTip = 0;
  final String sipOnodemeEvrakSeri = "";
  final int sipOnodemeEvrakSira = 0;
  final int sipRezervasyonMiktari = 0;
  final int sipRezervedenTeslimEdilen = 0;
  final String sipHareketGrupKodu1 = "";
  final String sipHareketGrupKodu2 = "";
  final String sipHareketGrupKodu3 = "";
  final int sipOlcu1 = 0;
  final int sipOlcu2 = 0;
  final int sipOlcu3 = 0;
  final int sipOlcu4 = 0;
  final int sipOlcu5 = 0;
  final int sipFormulMiktarNo = 0;
  final int sipFormulMiktar = 0;
  final int sipSatisFiyatDovizCinsi = 0;
  final int sipSatisFiyatDovizKuru = 0;
  final String sipEticaretKanalKodu = "";

  factory Siparisler.fromMap(Map<String, dynamic> json) => Siparisler(
        sipCreateUser: json["sip_create_user"],
        sipLastupUser: json["sip_lastup_user"],
        sipTip: json["sip_tip"],
        sipEvraknoSeri: json["sip_evrakno_seri"],
        sipEvraknoSira: json["sip_evrakno_sira"],
        sipSatirno: json["sip_satirno"],
        sipSaticiKod: json["sip_satici_kod"],
        sipMusteriKod: json["sip_musteri_kod"],
        sipStokKod: json["sip_stok_kod"],
        sipBFiyat: json["sip_b_fiyat"].toDouble(),
        sipMiktar: json["sip_miktar"],
        //  sipBirimPntr: json["sip_birim_pntr"],
        sipTeslimMiktar: json["sip_teslim_miktar"],
        sipTutar: json["sip_tutar"].toDouble(),
        siparislerSipIskonto1: json["sip_iskonto_1"],
        siparislerSipIskonto2: json["sip_iskonto_2"],
        siparislerSipIskonto3: json["sip_iskonto_3"],
        siparislerSipIskonto4: json["sip_iskonto_4"],
        siparislerSipIskonto5: json["sip_iskonto_5"],
        siparislerSipIskonto6: json["sip_iskonto_6"],
        siparislerSipMasraf1: json["sip_masraf_1"],
        siparislerSipMasraf2: json["sip_masraf_2"],
        siparislerSipMasraf3: json["sip_masraf_3"],
        siparislerSipMasraf4: json["sip_masraf_4"],
        //  sipVergi: json["sip_vergi"].toDouble(),
        sipAciklama: json["sip_aciklama"],
        //  sipAciklama2: json["sip_aciklama2"],
        sipDepono: json["sip_depono"],
        sipOnaylayanKulNo: json["sip_OnaylayanKulNo"],
        sipDovizCinsi: json["sip_doviz_cinsi"],
      );

  Map<String, dynamic> toMap() => {
        "sip_DBCno": sipDbCno,
        "sip_SpecRECno": sipSpecReCno,
        "sip_iptal": sipIptal,
        "sip_fileid": sipFileid,
        "sip_hidden": sipHidden,
        "sip_kilitli": sipKilitli,
        "sip_degisti": sipDegisti,
        "sip_checksum": sipChecksum,
        "sip_create_user": sipCreateUser,
        "sip_create_date": sipCreateDate.toIso8601String(),
        "sip_lastup_user": sipLastupUser,
        "sip_lastup_date": sipLastupDate!.toIso8601String(),
        "sip_special1": sipSpecial1,
        "sip_special2": sipSpecial2,
        "sip_special3": sipSpecial3,
        "sip_firmano": sipFirmano,
        "sip_subeno": sipSubeno,
        "sip_tarih": sipTarih.toIso8601String(),
        "sip_teslim_tarih": sipTeslimTarih!.toIso8601String(),
        "sip_tip": sipTip,
        "sip_cins": sipCins,
        "sip_evrakno_seri": sipEvraknoSeri,
        "sip_evrakno_sira": sipEvraknoSira,
        "sip_satirno": sipSatirno,
        "sip_belgeno": sipBelgeno,
        "sip_satici_kod": sipSaticiKod,
        "sip_musteri_kod": sipMusteriKod,
        "sip_stok_kod": sipStokKod,
        "sip_b_fiyat": sipBFiyat,
        "sip_miktar": sipMiktar,
        "sip_birim_pntr": sipBirimPntr,
        "sip_teslim_miktar": sipTeslimMiktar,
        "sip_tutar": sipTutar,
        "sip_iskonto_1": siparislerSipIskonto1,
        "sip_iskonto_2": siparislerSipIskonto2,
        "sip_iskonto_3": siparislerSipIskonto3,
        "sip_iskonto_4": siparislerSipIskonto4,
        "sip_iskonto_5": siparislerSipIskonto5,
        "sip_iskonto_6": siparislerSipIskonto6,
        "sip_masraf_1": siparislerSipMasraf1,
        "sip_masraf_2": siparislerSipMasraf2,
        "sip_masraf_3": siparislerSipMasraf3,
        "sip_masraf_4": siparislerSipMasraf4,
        "sip_vergi_pntr": sipVergiPntr,
        "sip_vergi": sipVergi,
        "sip_masvergi_pntr": sipMasvergiPntr,
        "sip_masvergi": sipMasvergi,
        "sip_opno": sipOpno,
        "sip_aciklama": sipAciklama,
        "sip_aciklama2": sipAciklama2,
        "sip_depono": sipDepono,
        "sip_OnaylayanKulNo": sipOnaylayanKulNo,
        "sip_vergisiz_fl": sipVergisizFl,
        "sip_kapat_fl": sipKapatFl,
        "sip_promosyon_fl": sipPromosyonFl,
        "sip_cari_sormerk": sipCariSormerk,
        "sip_stok_sormerk": sipStokSormerk,
        "sip_cari_grupno": sipCariGrupno,
        "sip_doviz_cinsi": sipDovizCinsi,
        "sip_doviz_kuru": sipDovizKuru,
        "sip_alt_doviz_kuru": sipAltDovizKuru,
        "sip_adresno": sipAdresno,
        "sip_teslimturu": sipTeslimturu,
        "sip_cagrilabilir_fl": sipCagrilabilirFl,
        "sip_iskonto1": sipIskonto1,
        "sip_iskonto2": sipIskonto2,
        "sip_iskonto3": sipIskonto3,
        "sip_iskonto4": sipIskonto4,
        "sip_iskonto5": sipIskonto5,
        "sip_iskonto6": sipIskonto6,
        "sip_masraf1": sipMasraf1,
        "sip_masraf2": sipMasraf2,
        "sip_masraf3": sipMasraf3,
        "sip_masraf4": sipMasraf4,
        "sip_isk1": sipIsk1,
        "sip_isk2": sipIsk2,
        "sip_isk3": sipIsk3,
        "sip_isk4": sipIsk4,
        "sip_isk5": sipIsk5,
        "sip_isk6": sipIsk6,
        "sip_mas1": sipMas1,
        "sip_mas2": sipMas2,
        "sip_mas3": sipMas3,
        "sip_mas4": sipMas4,
        "sip_Exp_Imp_Kodu": sipExpImpKodu,
        "sip_kar_orani": sipKarOrani,
        "sip_durumu": sipDurumu,
        "sip_planlananmiktar": sipPlanlananmiktar,
        "sip_parti_kodu": sipPartiKodu,
        "sip_lot_no": sipLotNo,
        "sip_projekodu": sipProjekodu,
        "sip_fiyat_liste_no": sipFiyatListeNo,
        "sip_Otv_Pntr": sipOtvPntr,
        "sip_Otv_Vergi": sipOtvVergi,
        "sip_otvtutari": sipOtvtutari,
        "sip_OtvVergisiz_Fl": sipOtvVergisizFl,
        "sip_paket_kod": sipPaketKod,
        "sip_harekettipi": sipHarekettipi,
        "sip_kapatmanedenkod": sipKapatmanedenkod,
        "sip_gecerlilik_tarihi": sipGecerlilikTarihi.toIso8601String(),
        "sip_onodeme_evrak_tip": sipOnodemeEvrakTip,
        "sip_onodeme_evrak_seri": sipOnodemeEvrakSeri,
        "sip_onodeme_evrak_sira": sipOnodemeEvrakSira,
        "sip_rezervasyon_miktari": sipRezervasyonMiktari,
        "sip_rezerveden_teslim_edilen": sipRezervedenTeslimEdilen,
        "sip_HareketGrupKodu1": sipHareketGrupKodu1,
        "sip_HareketGrupKodu2": sipHareketGrupKodu2,
        "sip_HareketGrupKodu3": sipHareketGrupKodu3,
        "sip_Olcu1": sipOlcu1,
        "sip_Olcu2": sipOlcu2,
        "sip_Olcu3": sipOlcu3,
        "sip_Olcu4": sipOlcu4,
        "sip_Olcu5": sipOlcu5,
        "sip_FormulMiktarNo": sipFormulMiktarNo,
        "sip_FormulMiktar": sipFormulMiktar,
        "sip_satis_fiyat_doviz_cinsi": sipSatisFiyatDovizCinsi,
        "sip_satis_fiyat_doviz_kuru": sipSatisFiyatDovizKuru,
        "sip_eticaret_kanal_kodu": sipEticaretKanalKodu,
      };
}
