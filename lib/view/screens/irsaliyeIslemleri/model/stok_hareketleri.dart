import 'dart:convert';

StokHareketleri stokHareketleriFromMap(String str) =>
    StokHareketleri.fromMap(json.decode(str));

String stokHareketleriToMap(StokHareketleri data) => json.encode(data.toMap());

class StokHareketleri {
  StokHareketleri({
    required this.sthCreateUser,
    required this.sthLastupUser,
    required this.sthTarih,
    required this.sthTip,
    required this.sthCins,
    required this.sthNormalIade,
    required this.sthEvraktip,
    required this.sthEvraknoSeri,
    required this.sthEvraknoSira,
    required this.sthSatirno,
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
    required this.sthCariKodu,
    required this.sthAltDovizKuru,
    required this.sthMiktar,
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
  });

  final int sthDbCno = 0;
  final int sthSpecReCno = 0;
  final bool sthIptal = false;
  final int sthFileid = 16;
  final bool sthHidden = false;
  final bool sthKilitli = false;
  final bool sthDegisti = false;
  final int sthChecksum = 0;
  final int sthCreateUser;
  final DateTime sthCreateDate = DateTime.now();
  final int sthLastupUser;
  final DateTime sthLastupDate = DateTime.now();
  final String sthSpecial1 = '';
  final String sthSpecial2 = '';
  final String sthSpecial3 = '';
  final int sthFirmano = 0;
  final int sthSubeno = 0;
  final DateTime sthTarih;
  final int sthTip; //*	0:Giriş 1:Çıkış 2:Depo Transfer
  final int
      sthCins; //* 0:Toptan 1:Perakende 2:Dış Ticaret 3:Stok Virman 4:Fire 5:Sarf 6:Transfer 7:Üretim 8:Fason 9:Değer Farkı 10:Sayım 11:Stok Açılış 12:İthalat-İhracat 13:Hal 14:Müstahsil 15:Müstahsil Değer Farkı 14:Kabzımal 15:Gider Pusulası
  final int sthNormalIade; //*	0:Normal 1:İade
  final int
      sthEvraktip; //*0:Depo Çıkış Fişi 1:Çıkış İrsaliyesi 2:Depo Transfer Fişi 3:Giriş Faturası 4:Çıkış Faturası 5:Stoklara İthalat Masraf Yansıtma Dekontu 6:Stok Virman Fişi 7:Üretim Fişi 8:İlave Enflasyon Maliyet Fişi 9:Stoklara İlave Maliyet Yedirme Fişi 10:Antrepolardan Mal Millileştirme Fişi 11:Antrepolar Arası Transfer Fişi 12:Depo Giriş Fişi 13:Giriş İrsaliyesi 14:Fason Giriş Çıkış Fişi 15:Depolar Arası Satış Fişi 16:Stok Gider Pusulası Fişi 17:Depolar Arası Nakliye Fişi
  final String sthEvraknoSeri;
  final int sthEvraknoSira;
  final int sthSatirno;
  final String sthBelgeNo = '';
  final DateTime sthBelgeTarih = DateTime.now();
  final String sthStokKod;
  final int
      sthIskMas1; //*0:Brüt toplamdan yüzde, 1:Ara toplamdan yüzde, 2:Tutar İskonto masraf, 3:Miktar başına tutar, 4:Miktar2 başına tutar, 5:Miktar3 başına tutar, 6:Bedelsiz miktar, 7:İskonto1 yuzde, 8:İskonto1 aratop yüzde, 9:İskonto2 yüzde, 10:İskonto2 aratop yüzde, 11:İskonto3 yüzde, 12:İskonto3 aratop yüzde, 13:İskonto4 yüzde, 14:İskonto4 aratop yüzde, 15:İskonto5 yüzde, 16:İskonto5 aratop yüzde, 17:İskonto6 yüzde, 18:İskonto6 aratop yüzde, 19:Masraf1 yüzde, 20:Masraf1 aratop yüzde, 21:Masraf2 yüzde, 22:Masraf2 aratop yüzde, 23:Masraf3 yüzde, 24:Masraf3 aratop yüzde
  final int sthIskMas2; //* yukarıdaki ile aynı
  final int sthIskMas3; //* yukarıdaki ile aynı
  final int sthIskMas4; //* yukarıdaki ile aynı
  final int sthIskMas5; //* yukarıdaki ile aynı
  final int sthIskMas6; //* yukarıdaki ile aynı
  final int sthIskMas7; //* yukarıdaki ile aynı
  final int sthIskMas8; //* yukarıdaki ile aynı
  final int sthIskMas9; //* yukarıdaki ile aynı
  final int sthIskMas10; //* yukarıdaki ile aynı
  final bool sthSatIskmas1 = false;
  final bool sthSatIskmas2 = false;
  final bool sthSatIskmas3 = false;
  final bool sthSatIskmas4 = false;
  final bool sthSatIskmas5 = false;
  final bool sthSatIskmas6 = false;
  final bool sthSatIskmas7 = false;
  final bool sthSatIskmas8 = false;
  final bool sthSatIskmas9 = false;
  final bool sthSatIskmas10 = false;
  final int sthPosSatis = 1;
  final bool sthPromosyonFl = false;
  final int sthCariCinsi = 0;
  final String sthCariKodu;
  final int sthCariGrupNo = 0;
  final String sthIsemriGiderKodu = '';
  final String sthPlasiyerKodu = '';
  final int sthHarDovizCinsi = 0;
  final int sthHarDovizKuru = 1;
  final double sthAltDovizKuru; //? bunu nerden alcaz
  final int sthStokDovizCinsi = 0;
  final int sthStokDovizKuru = 1;
  final int sthMiktar;
  final int sthMiktar2 = 0;
  final int sthBirimPntr = 1;
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
  final int sthMasrafVergiPntr = 0;
  final int sthMasrafVergi = 0;
  final int sthNetagirlik = 0;
  final int sthOdemeOp = 0;
  final String sthAciklama = '';
  final int sthGirisDepoNo = 1;
  final int sthCikisDepoNo = 1;
  final DateTime sthMalkblSevkTarihi = DateTime.now();
  final String sthCariSrmMerkezi = '';
  final String sthStokSrmMerkezi = '';
  final DateTime sthFisTarihi = DateTime.now();
  final int sthFisSirano = 0;
  final bool sthVergisizFl = false;
  final int sthMaliyetAna = 0;
  final int sthMaliyetAlternatif = 0;
  final int sthMaliyetOrjinal = 0;
  final int sthAdresNo = 1;
  final String sthPartiKodu = '';
  final int sthLotNo = 0;
  final String sthProjeKodu = '';
  final String sthEximKodu = '';
  final int sthOtvPntr = 0;
  final int sthOtvVergi = 0;
  final int sthBrutagirlik = 0;
  final int sthDisticaretTuru = 1;
  final int sthOtvtutari = 0;
  final bool sthOtvvergisizFl = false;
  final int sthOivPntr = 0;
  final int sthOivVergi = 0;
  final bool sthOivvergisizFl = false;
  final int sthFiyatListeNo = 0;
  final int sthOivtutari = 0;
  final int sthTevkifatTuru = 0;
  final int sthNakliyedeposu = 0;
  final int sthNakliyedurumu = 0;
  final bool sthTaxfreeFl = false;
  final int sthIlaveEdilecekKdv = 0;
  final String sthIsmerkeziKodu = '';
  final String sthHareketGrupKodu1 = '';
  final String sthHareketGrupKodu2 = '';
  final String sthHareketGrupKodu3 = '';
  final int sthEirsSenaryo = 0;
  final int sthEirsTipi = 0;
  final bool sthMatbuFl = false;

  factory StokHareketleri.fromMap(Map<String, dynamic> json) => StokHareketleri(
        sthCreateUser: json['sth_create_user'],
        sthLastupUser: json['sth_lastup_user'],
        sthTarih: DateTime.parse(json['sth_tarih']),
        sthTip: json['sth_tip'],
        sthCins: json['sth_cins'],
        sthNormalIade: json['sth_normal_iade'],
        sthEvraktip: json['sth_evraktip'],
        sthEvraknoSeri: json['sth_evrakno_seri'],
        sthEvraknoSira: json['sth_evrakno_sira'],
        sthSatirno: json['sth_satirno'],
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
        sthCariKodu: json['sth_cari_kodu'],
        sthAltDovizKuru: json['sth_alt_doviz_kuru'].toDouble(),
        sthMiktar: json['sth_miktar'],
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
      );

  Map<String, dynamic> toMap() => {
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
        'sth_taxfree_fl': sthTaxfreeFl,
        'sth_ilave_edilecek_kdv': sthIlaveEdilecekKdv,
        'sth_ismerkezi_kodu': sthIsmerkeziKodu,
        'sth_HareketGrupKodu1': sthHareketGrupKodu1,
        'sth_HareketGrupKodu2': sthHareketGrupKodu2,
        'sth_HareketGrupKodu3': sthHareketGrupKodu3,
        'sth_eirs_senaryo': sthEirsSenaryo,
        'sth_eirs_tipi': sthEirsTipi,
        'sth_matbu_fl': sthMatbuFl,
      };
}
