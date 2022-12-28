import 'dart:convert';

StokHareketleri stokHareketleriFromMap(String str) =>
    StokHareketleri.fromMap(json.decode(str));

String stokHareketleriToMap(StokHareketleri data) => json.encode(data.toMap());

class StokHareketleri {
  StokHareketleri({
    required this.sthGuid,
    required this.sthDbCno,
    required this.sthSpecReCno,
    required this.sthIptal,
    required this.sthFileid,
    required this.sthHidden,
    required this.sthKilitli,
    required this.sthDegisti,
    required this.sthChecksum,
    required this.sthCreateUser,
    required this.sthCreateDate,
    required this.sthLastupUser,
    required this.sthLastupDate,
    required this.sthSpecial1,
    required this.sthSpecial2,
    required this.sthSpecial3,
    required this.sthFirmano,
    required this.sthSubeno,
    required this.sthTarih,
    required this.sthTip,
    required this.sthCins,
    required this.sthNormalIade,
    required this.sthEvraktip,
    required this.sthEvraknoSeri,
    required this.sthEvraknoSira,
    required this.sthSatirno,
    required this.sthBelgeNo,
    required this.sthBelgeTarih,
    required this.sthStokKod,
    required this.sthIskMas1,
    required this.sthIskMas2,
    required this.sthIskMas3,
    required this.sthIskMas4,
    required this.sthIskMas5,
    required this.sthIskMas6,
    required this.sthIskMas7,
    required this.sthIskMas8,
    required this.sthIskMas9,
    required this.sthIskMas10,
    required this.sthSatIskmas1,
    required this.sthSatIskmas2,
    required this.sthSatIskmas3,
    required this.sthSatIskmas4,
    required this.sthSatIskmas5,
    required this.sthSatIskmas6,
    required this.sthSatIskmas7,
    required this.sthSatIskmas8,
    required this.sthSatIskmas9,
    required this.sthSatIskmas10,
    required this.sthPosSatis,
    required this.sthPromosyonFl,
    required this.sthCariCinsi,
    required this.sthCariKodu,
    required this.sthCariGrupNo,
    required this.sthIsemriGiderKodu,
    required this.sthPlasiyerKodu,
    required this.sthHarDovizCinsi,
    required this.sthHarDovizKuru,
    required this.sthAltDovizKuru,
    required this.sthStokDovizCinsi,
    required this.sthStokDovizKuru,
    required this.sthMiktar,
    required this.sthMiktar2,
    required this.sthBirimPntr,
    required this.sthTutar,
    required this.sthIskonto1,
    required this.sthIskonto2,
    required this.sthIskonto3,
    required this.sthIskonto4,
    required this.sthIskonto5,
    required this.sthIskonto6,
    required this.sthMasraf1,
    required this.sthMasraf2,
    required this.sthMasraf3,
    required this.sthMasraf4,
    required this.sthVergiPntr,
    required this.sthVergi,
    required this.sthMasrafVergiPntr,
    required this.sthMasrafVergi,
    required this.sthNetagirlik,
    required this.sthOdemeOp,
    required this.sthAciklama,
    required this.sthSipUid,
    required this.sthFatUid,
    required this.sthGirisDepoNo,
    required this.sthCikisDepoNo,
    required this.sthMalkblSevkTarihi,
    required this.sthCariSrmMerkezi,
    required this.sthStokSrmMerkezi,
    required this.sthFisTarihi,
    required this.sthFisSirano,
    required this.sthVergisizFl,
    required this.sthMaliyetAna,
    required this.sthMaliyetAlternatif,
    required this.sthMaliyetOrjinal,
    required this.sthAdresNo,
    required this.sthPartiKodu,
    required this.sthLotNo,
    required this.sthKonsUid,
    required this.sthProjeKodu,
    required this.sthEximKodu,
    required this.sthOtvPntr,
    required this.sthOtvVergi,
    required this.sthBrutagirlik,
    required this.sthDisticaretTuru,
    required this.sthOtvtutari,
    required this.sthOtvvergisizFl,
    required this.sthOivPntr,
    required this.sthOivVergi,
    required this.sthOivvergisizFl,
    required this.sthFiyatListeNo,
    required this.sthOivtutari,
    required this.sthTevkifatTuru,
    required this.sthNakliyedeposu,
    required this.sthNakliyedurumu,
    required this.sthYetkiliUid,
    required this.sthTaxfreeFl,
    required this.sthIlaveEdilecekKdv,
    required this.sthIsmerkeziKodu,
    required this.sthHareketGrupKodu1,
    required this.sthHareketGrupKodu2,
    required this.sthHareketGrupKodu3,
    required this.sthOlcu1,
    required this.sthOlcu2,
    required this.sthOlcu3,
    required this.sthOlcu4,
    required this.sthOlcu5,
    required this.sthFormulMiktarNo,
    required this.sthFormulMiktar,
    required this.sthEirsSenaryo,
    required this.sthEirsTipi,
    required this.sthTeslimTarihi,
    required this.sthMatbuFl,
    required this.sthSatisFiyatDovizCinsi,
    required this.sthSatisFiyatDovizKuru,
    required this.sthEticaretKanalKodu,
  });

  final String sthGuid;
  final int sthDbCno;
  final int sthSpecReCno;
  final bool sthIptal;
  final int sthFileid;
  final bool sthHidden;
  final bool sthKilitli;
  final bool sthDegisti;
  final int sthChecksum;
  final int sthCreateUser;
  final DateTime sthCreateDate;
  final int sthLastupUser;
  final DateTime sthLastupDate;
  final String sthSpecial1;
  final String sthSpecial2;
  final String sthSpecial3;
  final int sthFirmano;
  final int sthSubeno;
  final DateTime sthTarih;
  final int sthTip;
  final int sthCins;
  final int sthNormalIade;
  final int sthEvraktip;
  final String sthEvraknoSeri;
  final int sthEvraknoSira;
  final int sthSatirno;
  final String sthBelgeNo;
  final DateTime sthBelgeTarih;
  final String sthStokKod;
  final int sthIskMas1;
  final int sthIskMas2;
  final int sthIskMas3;
  final int sthIskMas4;
  final int sthIskMas5;
  final int sthIskMas6;
  final int sthIskMas7;
  final int sthIskMas8;
  final int sthIskMas9;
  final int sthIskMas10;
  final bool sthSatIskmas1;
  final bool sthSatIskmas2;
  final bool sthSatIskmas3;
  final bool sthSatIskmas4;
  final bool sthSatIskmas5;
  final bool sthSatIskmas6;
  final bool sthSatIskmas7;
  final bool sthSatIskmas8;
  final bool sthSatIskmas9;
  final bool sthSatIskmas10;
  final int sthPosSatis;
  final bool sthPromosyonFl;
  final int sthCariCinsi;
  final String sthCariKodu;
  final int sthCariGrupNo;
  final String sthIsemriGiderKodu;
  final String sthPlasiyerKodu;
  final int sthHarDovizCinsi;
  final int sthHarDovizKuru;
  final double sthAltDovizKuru;
  final int sthStokDovizCinsi;
  final int sthStokDovizKuru;
  final int sthMiktar;
  final int sthMiktar2;
  final int sthBirimPntr;
  final double sthTutar;
  final int sthIskonto1;
  final int sthIskonto2;
  final int sthIskonto3;
  final int sthIskonto4;
  final int sthIskonto5;
  final int sthIskonto6;
  final int sthMasraf1;
  final int sthMasraf2;
  final int sthMasraf3;
  final int sthMasraf4;
  final int sthVergiPntr;
  final double sthVergi;
  final int sthMasrafVergiPntr;
  final int sthMasrafVergi;
  final int sthNetagirlik;
  final int sthOdemeOp;
  final String sthAciklama;
  final String sthSipUid;
  final String sthFatUid;
  final int sthGirisDepoNo;
  final int sthCikisDepoNo;
  final DateTime sthMalkblSevkTarihi;
  final String sthCariSrmMerkezi;
  final String sthStokSrmMerkezi;
  final DateTime sthFisTarihi;
  final int sthFisSirano;
  final bool sthVergisizFl;
  final int sthMaliyetAna;
  final int sthMaliyetAlternatif;
  final int sthMaliyetOrjinal;
  final int sthAdresNo;
  final String sthPartiKodu;
  final int sthLotNo;
  final String sthKonsUid;
  final String sthProjeKodu;
  final String sthEximKodu;
  final int sthOtvPntr;
  final int sthOtvVergi;
  final int sthBrutagirlik;
  final int sthDisticaretTuru;
  final int sthOtvtutari;
  final bool sthOtvvergisizFl;
  final int sthOivPntr;
  final int sthOivVergi;
  final bool sthOivvergisizFl;
  final int sthFiyatListeNo;
  final int sthOivtutari;
  final int sthTevkifatTuru;
  final int sthNakliyedeposu;
  final int sthNakliyedurumu;
  final String sthYetkiliUid;
  final bool sthTaxfreeFl;
  final int sthIlaveEdilecekKdv;
  final String sthIsmerkeziKodu;
  final String sthHareketGrupKodu1;
  final String sthHareketGrupKodu2;
  final String sthHareketGrupKodu3;
  final dynamic sthOlcu1;
  final dynamic sthOlcu2;
  final dynamic sthOlcu3;
  final dynamic sthOlcu4;
  final dynamic sthOlcu5;
  final dynamic sthFormulMiktarNo;
  final dynamic sthFormulMiktar;
  final int sthEirsSenaryo;
  final int sthEirsTipi;
  final dynamic sthTeslimTarihi;
  final bool sthMatbuFl;
  final dynamic sthSatisFiyatDovizCinsi;
  final dynamic sthSatisFiyatDovizKuru;
  final dynamic sthEticaretKanalKodu;

  factory StokHareketleri.fromMap(Map<String, dynamic> json) => StokHareketleri(
        sthGuid: json['sth_Guid'],
        sthDbCno: json['sth_DBCno'],
        sthSpecReCno: json['sth_SpecRECno'],
        sthIptal: json['sth_iptal'],
        sthFileid: json['sth_fileid'],
        sthHidden: json['sth_hidden'],
        sthKilitli: json['sth_kilitli'],
        sthDegisti: json['sth_degisti'],
        sthChecksum: json['sth_checksum'],
        sthCreateUser: json['sth_create_user'],
        sthCreateDate: DateTime.parse(json['sth_create_date']),
        sthLastupUser: json['sth_lastup_user'],
        sthLastupDate: DateTime.parse(json['sth_lastup_date']),
        sthSpecial1: json['sth_special1'],
        sthSpecial2: json['sth_special2'],
        sthSpecial3: json['sth_special3'],
        sthFirmano: json['sth_firmano'],
        sthSubeno: json['sth_subeno'],
        sthTarih: DateTime.parse(json['sth_tarih']),
        sthTip: json['sth_tip'],
        sthCins: json['sth_cins'],
        sthNormalIade: json['sth_normal_iade'],
        sthEvraktip: json['sth_evraktip'],
        sthEvraknoSeri: json['sth_evrakno_seri'],
        sthEvraknoSira: json['sth_evrakno_sira'],
        sthSatirno: json['sth_satirno'],
        sthBelgeNo: json['sth_belge_no'],
        sthBelgeTarih: DateTime.parse(json['sth_belge_tarih']),
        sthStokKod: json['sth_stok_kod'],
        sthIskMas1: json['sth_isk_mas1'],
        sthIskMas2: json['sth_isk_mas2'],
        sthIskMas3: json['sth_isk_mas3'],
        sthIskMas4: json['sth_isk_mas4'],
        sthIskMas5: json['sth_isk_mas5'],
        sthIskMas6: json['sth_isk_mas6'],
        sthIskMas7: json['sth_isk_mas7'],
        sthIskMas8: json['sth_isk_mas8'],
        sthIskMas9: json['sth_isk_mas9'],
        sthIskMas10: json['sth_isk_mas10'],
        sthSatIskmas1: json['sth_sat_iskmas1'],
        sthSatIskmas2: json['sth_sat_iskmas2'],
        sthSatIskmas3: json['sth_sat_iskmas3'],
        sthSatIskmas4: json['sth_sat_iskmas4'],
        sthSatIskmas5: json['sth_sat_iskmas5'],
        sthSatIskmas6: json['sth_sat_iskmas6'],
        sthSatIskmas7: json['sth_sat_iskmas7'],
        sthSatIskmas8: json['sth_sat_iskmas8'],
        sthSatIskmas9: json['sth_sat_iskmas9'],
        sthSatIskmas10: json['sth_sat_iskmas10'],
        sthPosSatis: json['sth_pos_satis'],
        sthPromosyonFl: json['sth_promosyon_fl'],
        sthCariCinsi: json['sth_cari_cinsi'],
        sthCariKodu: json['sth_cari_kodu'],
        sthCariGrupNo: json['sth_cari_grup_no'],
        sthIsemriGiderKodu: json['sth_isemri_gider_kodu'],
        sthPlasiyerKodu: json['sth_plasiyer_kodu'],
        sthHarDovizCinsi: json['sth_har_doviz_cinsi'],
        sthHarDovizKuru: json['sth_har_doviz_kuru'],
        sthAltDovizKuru: json['sth_alt_doviz_kuru'].toDouble(),
        sthStokDovizCinsi: json['sth_stok_doviz_cinsi'],
        sthStokDovizKuru: json['sth_stok_doviz_kuru'],
        sthMiktar: json['sth_miktar'],
        sthMiktar2: json['sth_miktar2'],
        sthBirimPntr: json['sth_birim_pntr'],
        sthTutar: json['sth_tutar'].toDouble(),
        sthIskonto1: json['sth_iskonto1'],
        sthIskonto2: json['sth_iskonto2'],
        sthIskonto3: json['sth_iskonto3'],
        sthIskonto4: json['sth_iskonto4'],
        sthIskonto5: json['sth_iskonto5'],
        sthIskonto6: json['sth_iskonto6'],
        sthMasraf1: json['sth_masraf1'],
        sthMasraf2: json['sth_masraf2'],
        sthMasraf3: json['sth_masraf3'],
        sthMasraf4: json['sth_masraf4'],
        sthVergiPntr: json['sth_vergi_pntr'],
        sthVergi: json['sth_vergi'].toDouble(),
        sthMasrafVergiPntr: json['sth_masraf_vergi_pntr'],
        sthMasrafVergi: json['sth_masraf_vergi'],
        sthNetagirlik: json['sth_netagirlik'],
        sthOdemeOp: json['sth_odeme_op'],
        sthAciklama: json['sth_aciklama'],
        sthSipUid: json['sth_sip_uid'],
        sthFatUid: json['sth_fat_uid'],
        sthGirisDepoNo: json['sth_giris_depo_no'],
        sthCikisDepoNo: json['sth_cikis_depo_no'],
        sthMalkblSevkTarihi: DateTime.parse(json['sth_malkbl_sevk_tarihi']),
        sthCariSrmMerkezi: json['sth_cari_srm_merkezi'],
        sthStokSrmMerkezi: json['sth_stok_srm_merkezi'],
        sthFisTarihi: DateTime.parse(json['sth_fis_tarihi']),
        sthFisSirano: json['sth_fis_sirano'],
        sthVergisizFl: json['sth_vergisiz_fl'],
        sthMaliyetAna: json['sth_maliyet_ana'],
        sthMaliyetAlternatif: json['sth_maliyet_alternatif'],
        sthMaliyetOrjinal: json['sth_maliyet_orjinal'],
        sthAdresNo: json['sth_adres_no'],
        sthPartiKodu: json['sth_parti_kodu'],
        sthLotNo: json['sth_lot_no'],
        sthKonsUid: json['sth_kons_uid'],
        sthProjeKodu: json['sth_proje_kodu'],
        sthEximKodu: json['sth_exim_kodu'],
        sthOtvPntr: json['sth_otv_pntr'],
        sthOtvVergi: json['sth_otv_vergi'],
        sthBrutagirlik: json['sth_brutagirlik'],
        sthDisticaretTuru: json['sth_disticaret_turu'],
        sthOtvtutari: json['sth_otvtutari'],
        sthOtvvergisizFl: json['sth_otvvergisiz_fl'],
        sthOivPntr: json['sth_oiv_pntr'],
        sthOivVergi: json['sth_oiv_vergi'],
        sthOivvergisizFl: json['sth_oivvergisiz_fl'],
        sthFiyatListeNo: json['sth_fiyat_liste_no'],
        sthOivtutari: json['sth_oivtutari'],
        sthTevkifatTuru: json['sth_Tevkifat_turu'],
        sthNakliyedeposu: json['sth_nakliyedeposu'],
        sthNakliyedurumu: json['sth_nakliyedurumu'],
        sthYetkiliUid: json['sth_yetkili_uid'],
        sthTaxfreeFl: json['sth_taxfree_fl'],
        sthIlaveEdilecekKdv: json['sth_ilave_edilecek_kdv'],
        sthIsmerkeziKodu: json['sth_ismerkezi_kodu'],
        sthHareketGrupKodu1: json['sth_HareketGrupKodu1'],
        sthHareketGrupKodu2: json['sth_HareketGrupKodu2'],
        sthHareketGrupKodu3: json['sth_HareketGrupKodu3'],
        sthOlcu1: json['sth_Olcu1'],
        sthOlcu2: json['sth_Olcu2'],
        sthOlcu3: json['sth_Olcu3'],
        sthOlcu4: json['sth_Olcu4'],
        sthOlcu5: json['sth_Olcu5'],
        sthFormulMiktarNo: json['sth_FormulMiktarNo'],
        sthFormulMiktar: json['sth_FormulMiktar'],
        sthEirsSenaryo: json['sth_eirs_senaryo'],
        sthEirsTipi: json['sth_eirs_tipi'],
        sthTeslimTarihi: json['sth_teslim_tarihi'],
        sthMatbuFl: json['sth_matbu_fl'],
        sthSatisFiyatDovizCinsi: json['sth_satis_fiyat_doviz_cinsi'],
        sthSatisFiyatDovizKuru: json['sth_satis_fiyat_doviz_kuru'],
        sthEticaretKanalKodu: json['sth_eticaret_kanal_kodu'],
      );

  Map<String, dynamic> toMap() => {
        'sth_Guid': sthGuid,
        'sth_DBCno': sthDbCno,
        'sth_SpecRECno': sthSpecReCno,
        'sth_iptal': sthIptal,
        'sth_fileid': sthFileid,
        'sth_hidden': sthHidden,
        'sth_kilitli': sthKilitli,
        'sth_degisti': sthDegisti,
        'sth_checksum': sthChecksum,
        'sth_create_user': sthCreateUser,
        'sth_create_date': sthCreateDate.toIso8601String(),
        'sth_lastup_user': sthLastupUser,
        'sth_lastup_date': sthLastupDate.toIso8601String(),
        'sth_special1': sthSpecial1,
        'sth_special2': sthSpecial2,
        'sth_special3': sthSpecial3,
        'sth_firmano': sthFirmano,
        'sth_subeno': sthSubeno,
        'sth_tarih': sthTarih.toIso8601String(),
        'sth_tip': sthTip,
        'sth_cins': sthCins,
        'sth_normal_iade': sthNormalIade,
        'sth_evraktip': sthEvraktip,
        'sth_evrakno_seri': sthEvraknoSeri,
        'sth_evrakno_sira': sthEvraknoSira,
        'sth_satirno': sthSatirno,
        'sth_belge_no': sthBelgeNo,
        'sth_belge_tarih': sthBelgeTarih.toIso8601String(),
        'sth_stok_kod': sthStokKod,
        'sth_isk_mas1': sthIskMas1,
        'sth_isk_mas2': sthIskMas2,
        'sth_isk_mas3': sthIskMas3,
        'sth_isk_mas4': sthIskMas4,
        'sth_isk_mas5': sthIskMas5,
        'sth_isk_mas6': sthIskMas6,
        'sth_isk_mas7': sthIskMas7,
        'sth_isk_mas8': sthIskMas8,
        'sth_isk_mas9': sthIskMas9,
        'sth_isk_mas10': sthIskMas10,
        'sth_sat_iskmas1': sthSatIskmas1,
        'sth_sat_iskmas2': sthSatIskmas2,
        'sth_sat_iskmas3': sthSatIskmas3,
        'sth_sat_iskmas4': sthSatIskmas4,
        'sth_sat_iskmas5': sthSatIskmas5,
        'sth_sat_iskmas6': sthSatIskmas6,
        'sth_sat_iskmas7': sthSatIskmas7,
        'sth_sat_iskmas8': sthSatIskmas8,
        'sth_sat_iskmas9': sthSatIskmas9,
        'sth_sat_iskmas10': sthSatIskmas10,
        'sth_pos_satis': sthPosSatis,
        'sth_promosyon_fl': sthPromosyonFl,
        'sth_cari_cinsi': sthCariCinsi,
        'sth_cari_kodu': sthCariKodu,
        'sth_cari_grup_no': sthCariGrupNo,
        'sth_isemri_gider_kodu': sthIsemriGiderKodu,
        'sth_plasiyer_kodu': sthPlasiyerKodu,
        'sth_har_doviz_cinsi': sthHarDovizCinsi,
        'sth_har_doviz_kuru': sthHarDovizKuru,
        'sth_alt_doviz_kuru': sthAltDovizKuru,
        'sth_stok_doviz_cinsi': sthStokDovizCinsi,
        'sth_stok_doviz_kuru': sthStokDovizKuru,
        'sth_miktar': sthMiktar,
        'sth_miktar2': sthMiktar2,
        'sth_birim_pntr': sthBirimPntr,
        'sth_tutar': sthTutar,
        'sth_iskonto1': sthIskonto1,
        'sth_iskonto2': sthIskonto2,
        'sth_iskonto3': sthIskonto3,
        'sth_iskonto4': sthIskonto4,
        'sth_iskonto5': sthIskonto5,
        'sth_iskonto6': sthIskonto6,
        'sth_masraf1': sthMasraf1,
        'sth_masraf2': sthMasraf2,
        'sth_masraf3': sthMasraf3,
        'sth_masraf4': sthMasraf4,
        'sth_vergi_pntr': sthVergiPntr,
        'sth_vergi': sthVergi,
        'sth_masraf_vergi_pntr': sthMasrafVergiPntr,
        'sth_masraf_vergi': sthMasrafVergi,
        'sth_netagirlik': sthNetagirlik,
        'sth_odeme_op': sthOdemeOp,
        'sth_aciklama': sthAciklama,
        'sth_sip_uid': sthSipUid,
        'sth_fat_uid': sthFatUid,
        'sth_giris_depo_no': sthGirisDepoNo,
        'sth_cikis_depo_no': sthCikisDepoNo,
        'sth_malkbl_sevk_tarihi': sthMalkblSevkTarihi.toIso8601String(),
        'sth_cari_srm_merkezi': sthCariSrmMerkezi,
        'sth_stok_srm_merkezi': sthStokSrmMerkezi,
        'sth_fis_tarihi': sthFisTarihi.toIso8601String(),
        'sth_fis_sirano': sthFisSirano,
        'sth_vergisiz_fl': sthVergisizFl,
        'sth_maliyet_ana': sthMaliyetAna,
        'sth_maliyet_alternatif': sthMaliyetAlternatif,
        'sth_maliyet_orjinal': sthMaliyetOrjinal,
        'sth_adres_no': sthAdresNo,
        'sth_parti_kodu': sthPartiKodu,
        'sth_lot_no': sthLotNo,
        'sth_kons_uid': sthKonsUid,
        'sth_proje_kodu': sthProjeKodu,
        'sth_exim_kodu': sthEximKodu,
        'sth_otv_pntr': sthOtvPntr,
        'sth_otv_vergi': sthOtvVergi,
        'sth_brutagirlik': sthBrutagirlik,
        'sth_disticaret_turu': sthDisticaretTuru,
        'sth_otvtutari': sthOtvtutari,
        'sth_otvvergisiz_fl': sthOtvvergisizFl,
        'sth_oiv_pntr': sthOivPntr,
        'sth_oiv_vergi': sthOivVergi,
        'sth_oivvergisiz_fl': sthOivvergisizFl,
        'sth_fiyat_liste_no': sthFiyatListeNo,
        'sth_oivtutari': sthOivtutari,
        'sth_Tevkifat_turu': sthTevkifatTuru,
        'sth_nakliyedeposu': sthNakliyedeposu,
        'sth_nakliyedurumu': sthNakliyedurumu,
        'sth_yetkili_uid': sthYetkiliUid,
        'sth_taxfree_fl': sthTaxfreeFl,
        'sth_ilave_edilecek_kdv': sthIlaveEdilecekKdv,
        'sth_ismerkezi_kodu': sthIsmerkeziKodu,
        'sth_HareketGrupKodu1': sthHareketGrupKodu1,
        'sth_HareketGrupKodu2': sthHareketGrupKodu2,
        'sth_HareketGrupKodu3': sthHareketGrupKodu3,
        'sth_Olcu1': sthOlcu1,
        'sth_Olcu2': sthOlcu2,
        'sth_Olcu3': sthOlcu3,
        'sth_Olcu4': sthOlcu4,
        'sth_Olcu5': sthOlcu5,
        'sth_FormulMiktarNo': sthFormulMiktarNo,
        'sth_FormulMiktar': sthFormulMiktar,
        'sth_eirs_senaryo': sthEirsSenaryo,
        'sth_eirs_tipi': sthEirsTipi,
        'sth_teslim_tarihi': sthTeslimTarihi,
        'sth_matbu_fl': sthMatbuFl,
        'sth_satis_fiyat_doviz_cinsi': sthSatisFiyatDovizCinsi,
        'sth_satis_fiyat_doviz_kuru': sthSatisFiyatDovizKuru,
        'sth_eticaret_kanal_kodu': sthEticaretKanalKodu,
      };
}
