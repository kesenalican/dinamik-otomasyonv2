// To parse this JSON data, do
//
//     final siparisler = siparislerFromMap(jsonString);

import 'dart:convert';

Siparisler siparislerFromMap(String str) =>
    Siparisler.fromMap(json.decode(str));

String siparislerToMap(Siparisler data) => json.encode(data.toMap());

class Siparisler {
  Siparisler({
    required this.sipGuid,
    required this.sipDbCno,
    required this.sipSpecReCno,
    required this.sipIptal,
    required this.sipFileid,
    required this.sipHidden,
    required this.sipKilitli,
    required this.sipDegisti,
    required this.sipChecksum,
    required this.sipCreateUser,
    required this.sipCreateDate,
    required this.sipLastupUser,
    required this.sipLastupDate,
    required this.sipSpecial1,
    required this.sipSpecial2,
    required this.sipSpecial3,
    required this.sipFirmano,
    required this.sipSubeno,
    required this.sipTarih,
    required this.sipTeslimTarih,
    required this.sipTip,
    required this.sipCins,
    required this.sipEvraknoSeri,
    required this.sipEvraknoSira,
    required this.sipSatirno,
    required this.sipBelgeno,
    required this.sipBelgeTarih,
    required this.sipSaticiKod,
    required this.sipMusteriKod,
    required this.sipStokKod,
    required this.sipBFiyat,
    required this.sipMiktar,
    required this.sipBirimPntr,
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
    required this.sipVergiPntr,
    required this.sipVergi,
    required this.sipMasvergiPntr,
    required this.sipMasvergi,
    required this.sipOpno,
    required this.sipAciklama,
    required this.sipAciklama2,
    required this.sipDepono,
    required this.sipOnaylayanKulNo,
    required this.sipVergisizFl,
    required this.sipKapatFl,
    required this.sipPromosyonFl,
    required this.sipCariSormerk,
    required this.sipStokSormerk,
    required this.sipCariGrupno,
    required this.sipDovizCinsi,
    required this.sipDovizKuru,
    required this.sipAltDovizKuru,
    required this.sipAdresno,
    required this.sipTeslimturu,
    required this.sipCagrilabilirFl,
    required this.sipProsipUid,
    required this.sipIskonto1,
    required this.sipIskonto2,
    required this.sipIskonto3,
    required this.sipIskonto4,
    required this.sipIskonto5,
    required this.sipIskonto6,
    required this.sipMasraf1,
    required this.sipMasraf2,
    required this.sipMasraf3,
    required this.sipMasraf4,
    required this.sipIsk1,
    required this.sipIsk2,
    required this.sipIsk3,
    required this.sipIsk4,
    required this.sipIsk5,
    required this.sipIsk6,
    required this.sipMas1,
    required this.sipMas2,
    required this.sipMas3,
    required this.sipMas4,
    required this.sipExpImpKodu,
    required this.sipKarOrani,
    required this.sipDurumu,
    required this.sipStalUid,
    required this.sipPlanlananmiktar,
    required this.sipTeklifUid,
    required this.sipPartiKodu,
    required this.sipLotNo,
    required this.sipProjekodu,
    required this.sipFiyatListeNo,
    required this.sipOtvPntr,
    required this.sipOtvVergi,
    required this.sipOtvtutari,
    required this.sipOtvVergisizFl,
    required this.sipPaketKod,
    required this.sipRezUid,
    required this.sipHarekettipi,
    required this.sipYetkiliUid,
    required this.sipKapatmanedenkod,
    required this.sipGecerlilikTarihi,
    required this.sipOnodemeEvrakTip,
    required this.sipOnodemeEvrakSeri,
    required this.sipOnodemeEvrakSira,
    required this.sipRezervasyonMiktari,
    required this.sipRezervedenTeslimEdilen,
    required this.sipHareketGrupKodu1,
    required this.sipHareketGrupKodu2,
    required this.sipHareketGrupKodu3,
    required this.sipOlcu1,
    required this.sipOlcu2,
    required this.sipOlcu3,
    required this.sipOlcu4,
    required this.sipOlcu5,
    required this.sipFormulMiktarNo,
    required this.sipFormulMiktar,
    required this.sipSatisFiyatDovizCinsi,
    required this.sipSatisFiyatDovizKuru,
    required this.sipEticaretKanalKodu,
  });

  final String sipGuid;
  final int sipDbCno;
  final int sipSpecReCno;
  final bool sipIptal;
  final int sipFileid;
  final bool sipHidden;
  final bool sipKilitli;
  final bool sipDegisti;
  final int sipChecksum;
  final int sipCreateUser;
  final DateTime sipCreateDate;
  final int sipLastupUser;
  final DateTime sipLastupDate;
  final String sipSpecial1;
  final String sipSpecial2;
  final String sipSpecial3;
  final int sipFirmano;
  final int sipSubeno;
  final DateTime sipTarih;
  final DateTime sipTeslimTarih;
  final int sipTip;
  final int sipCins;
  final String sipEvraknoSeri;
  final int sipEvraknoSira;
  final int sipSatirno;
  final String sipBelgeno;
  final DateTime sipBelgeTarih;
  final String sipSaticiKod;
  final String sipMusteriKod;
  final String sipStokKod;
  final double sipBFiyat;
  final int sipMiktar;
  final int sipBirimPntr;
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
  final int sipVergiPntr;
  final double sipVergi;
  final int sipMasvergiPntr;
  final int sipMasvergi;
  final int sipOpno;
  final String sipAciklama;
  final String sipAciklama2;
  final int sipDepono;
  final int sipOnaylayanKulNo;
  final bool sipVergisizFl;
  final bool sipKapatFl;
  final bool sipPromosyonFl;
  final String sipCariSormerk;
  final String sipStokSormerk;
  final int sipCariGrupno;
  final int sipDovizCinsi;
  final int sipDovizKuru;
  final double sipAltDovizKuru;
  final int sipAdresno;
  final String sipTeslimturu;
  final bool sipCagrilabilirFl;
  final String sipProsipUid;
  final int sipIskonto1;
  final int sipIskonto2;
  final int sipIskonto3;
  final int sipIskonto4;
  final int sipIskonto5;
  final int sipIskonto6;
  final int sipMasraf1;
  final int sipMasraf2;
  final int sipMasraf3;
  final int sipMasraf4;
  final bool sipIsk1;
  final bool sipIsk2;
  final bool sipIsk3;
  final bool sipIsk4;
  final bool sipIsk5;
  final bool sipIsk6;
  final bool sipMas1;
  final bool sipMas2;
  final bool sipMas3;
  final bool sipMas4;
  final String sipExpImpKodu;
  final int sipKarOrani;
  final int sipDurumu;
  final String sipStalUid;
  final int sipPlanlananmiktar;
  final String sipTeklifUid;
  final String sipPartiKodu;
  final int sipLotNo;
  final String sipProjekodu;
  final int sipFiyatListeNo;
  final int sipOtvPntr;
  final int sipOtvVergi;
  final int sipOtvtutari;
  final int sipOtvVergisizFl;
  final String sipPaketKod;
  final String sipRezUid;
  final int sipHarekettipi;
  final String sipYetkiliUid;
  final String sipKapatmanedenkod;
  final DateTime sipGecerlilikTarihi;
  final int sipOnodemeEvrakTip;
  final String sipOnodemeEvrakSeri;
  final int sipOnodemeEvrakSira;
  final int sipRezervasyonMiktari;
  final int sipRezervedenTeslimEdilen;
  final String sipHareketGrupKodu1;
  final String sipHareketGrupKodu2;
  final String sipHareketGrupKodu3;
  final int sipOlcu1;
  final int sipOlcu2;
  final int sipOlcu3;
  final int sipOlcu4;
  final int sipOlcu5;
  final int sipFormulMiktarNo;
  final int sipFormulMiktar;
  final int sipSatisFiyatDovizCinsi;
  final int sipSatisFiyatDovizKuru;
  final String sipEticaretKanalKodu;

  factory Siparisler.fromMap(Map<String, dynamic> json) => Siparisler(
        sipGuid: json["sip_Guid"],
        sipDbCno: json["sip_DBCno"],
        sipSpecReCno: json["sip_SpecRECno"],
        sipIptal: json["sip_iptal"],
        sipFileid: json["sip_fileid"],
        sipHidden: json["sip_hidden"],
        sipKilitli: json["sip_kilitli"],
        sipDegisti: json["sip_degisti"],
        sipChecksum: json["sip_checksum"],
        sipCreateUser: json["sip_create_user"],
        sipCreateDate: DateTime.parse(json["sip_create_date"]),
        sipLastupUser: json["sip_lastup_user"],
        sipLastupDate: DateTime.parse(json["sip_lastup_date"]),
        sipSpecial1: json["sip_special1"],
        sipSpecial2: json["sip_special2"],
        sipSpecial3: json["sip_special3"],
        sipFirmano: json["sip_firmano"],
        sipSubeno: json["sip_subeno"],
        sipTarih: DateTime.parse(json["sip_tarih"]),
        sipTeslimTarih: DateTime.parse(json["sip_teslim_tarih"]),
        sipTip: json["sip_tip"],
        sipCins: json["sip_cins"],
        sipEvraknoSeri: json["sip_evrakno_seri"],
        sipEvraknoSira: json["sip_evrakno_sira"],
        sipSatirno: json["sip_satirno"],
        sipBelgeno: json["sip_belgeno"],
        sipBelgeTarih: DateTime.parse(json["sip_belge_tarih"]),
        sipSaticiKod: json["sip_satici_kod"],
        sipMusteriKod: json["sip_musteri_kod"],
        sipStokKod: json["sip_stok_kod"],
        sipBFiyat: json["sip_b_fiyat"].toDouble(),
        sipMiktar: json["sip_miktar"],
        sipBirimPntr: json["sip_birim_pntr"],
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
        sipVergiPntr: json["sip_vergi_pntr"],
        sipVergi: json["sip_vergi"].toDouble(),
        sipMasvergiPntr: json["sip_masvergi_pntr"],
        sipMasvergi: json["sip_masvergi"],
        sipOpno: json["sip_opno"],
        sipAciklama: json["sip_aciklama"],
        sipAciklama2: json["sip_aciklama2"],
        sipDepono: json["sip_depono"],
        sipOnaylayanKulNo: json["sip_OnaylayanKulNo"],
        sipVergisizFl: json["sip_vergisiz_fl"],
        sipKapatFl: json["sip_kapat_fl"],
        sipPromosyonFl: json["sip_promosyon_fl"],
        sipCariSormerk: json["sip_cari_sormerk"],
        sipStokSormerk: json["sip_stok_sormerk"],
        sipCariGrupno: json["sip_cari_grupno"],
        sipDovizCinsi: json["sip_doviz_cinsi"],
        sipDovizKuru: json["sip_doviz_kuru"],
        sipAltDovizKuru: json["sip_alt_doviz_kuru"].toDouble(),
        sipAdresno: json["sip_adresno"],
        sipTeslimturu: json["sip_teslimturu"],
        sipCagrilabilirFl: json["sip_cagrilabilir_fl"],
        sipProsipUid: json["sip_prosip_uid"],
        sipIskonto1: json["sip_iskonto1"],
        sipIskonto2: json["sip_iskonto2"],
        sipIskonto3: json["sip_iskonto3"],
        sipIskonto4: json["sip_iskonto4"],
        sipIskonto5: json["sip_iskonto5"],
        sipIskonto6: json["sip_iskonto6"],
        sipMasraf1: json["sip_masraf1"],
        sipMasraf2: json["sip_masraf2"],
        sipMasraf3: json["sip_masraf3"],
        sipMasraf4: json["sip_masraf4"],
        sipIsk1: json["sip_isk1"],
        sipIsk2: json["sip_isk2"],
        sipIsk3: json["sip_isk3"],
        sipIsk4: json["sip_isk4"],
        sipIsk5: json["sip_isk5"],
        sipIsk6: json["sip_isk6"],
        sipMas1: json["sip_mas1"],
        sipMas2: json["sip_mas2"],
        sipMas3: json["sip_mas3"],
        sipMas4: json["sip_mas4"],
        sipExpImpKodu: json["sip_Exp_Imp_Kodu"],
        sipKarOrani: json["sip_kar_orani"],
        sipDurumu: json["sip_durumu"],
        sipStalUid: json["sip_stal_uid"],
        sipPlanlananmiktar: json["sip_planlananmiktar"],
        sipTeklifUid: json["sip_teklif_uid"],
        sipPartiKodu: json["sip_parti_kodu"],
        sipLotNo: json["sip_lot_no"],
        sipProjekodu: json["sip_projekodu"],
        sipFiyatListeNo: json["sip_fiyat_liste_no"],
        sipOtvPntr: json["sip_Otv_Pntr"],
        sipOtvVergi: json["sip_Otv_Vergi"],
        sipOtvtutari: json["sip_otvtutari"],
        sipOtvVergisizFl: json["sip_OtvVergisiz_Fl"],
        sipPaketKod: json["sip_paket_kod"],
        sipRezUid: json["sip_Rez_uid"],
        sipHarekettipi: json["sip_harekettipi"],
        sipYetkiliUid: json["sip_yetkili_uid"],
        sipKapatmanedenkod: json["sip_kapatmanedenkod"],
        sipGecerlilikTarihi: DateTime.parse(json["sip_gecerlilik_tarihi"]),
        sipOnodemeEvrakTip: json["sip_onodeme_evrak_tip"],
        sipOnodemeEvrakSeri: json["sip_onodeme_evrak_seri"],
        sipOnodemeEvrakSira: json["sip_onodeme_evrak_sira"],
        sipRezervasyonMiktari: json["sip_rezervasyon_miktari"],
        sipRezervedenTeslimEdilen: json["sip_rezerveden_teslim_edilen"],
        sipHareketGrupKodu1: json["sip_HareketGrupKodu1"],
        sipHareketGrupKodu2: json["sip_HareketGrupKodu2"],
        sipHareketGrupKodu3: json["sip_HareketGrupKodu3"],
        sipOlcu1: json["sip_Olcu1"],
        sipOlcu2: json["sip_Olcu2"],
        sipOlcu3: json["sip_Olcu3"],
        sipOlcu4: json["sip_Olcu4"],
        sipOlcu5: json["sip_Olcu5"],
        sipFormulMiktarNo: json["sip_FormulMiktarNo"],
        sipFormulMiktar: json["sip_FormulMiktar"],
        sipSatisFiyatDovizCinsi: json["sip_satis_fiyat_doviz_cinsi"],
        sipSatisFiyatDovizKuru: json["sip_satis_fiyat_doviz_kuru"],
        sipEticaretKanalKodu: json["sip_eticaret_kanal_kodu"],
      );

  Map<String, dynamic> toMap() => {
        "sip_Guid": sipGuid,
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
        "sip_lastup_date": sipLastupDate.toIso8601String(),
        "sip_special1": sipSpecial1,
        "sip_special2": sipSpecial2,
        "sip_special3": sipSpecial3,
        "sip_firmano": sipFirmano,
        "sip_subeno": sipSubeno,
        "sip_tarih": sipTarih.toIso8601String(),
        "sip_teslim_tarih": sipTeslimTarih.toIso8601String(),
        "sip_tip": sipTip,
        "sip_cins": sipCins,
        "sip_evrakno_seri": sipEvraknoSeri,
        "sip_evrakno_sira": sipEvraknoSira,
        "sip_satirno": sipSatirno,
        "sip_belgeno": sipBelgeno,
        "sip_belge_tarih": sipBelgeTarih.toIso8601String(),
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
        "sip_prosip_uid": sipProsipUid,
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
        "sip_stal_uid": sipStalUid,
        "sip_planlananmiktar": sipPlanlananmiktar,
        "sip_teklif_uid": sipTeklifUid,
        "sip_parti_kodu": sipPartiKodu,
        "sip_lot_no": sipLotNo,
        "sip_projekodu": sipProjekodu,
        "sip_fiyat_liste_no": sipFiyatListeNo,
        "sip_Otv_Pntr": sipOtvPntr,
        "sip_Otv_Vergi": sipOtvVergi,
        "sip_otvtutari": sipOtvtutari,
        "sip_OtvVergisiz_Fl": sipOtvVergisizFl,
        "sip_paket_kod": sipPaketKod,
        "sip_Rez_uid": sipRezUid,
        "sip_harekettipi": sipHarekettipi,
        "sip_yetkili_uid": sipYetkiliUid,
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
