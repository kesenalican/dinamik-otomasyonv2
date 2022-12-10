// To parse this JSON data, do
//
//     final CariModel = CariModelFromMap(jsonString);

import 'dart:convert';

// ignore: non_constant_identifier_names
CariModel CariModelFromMap(String str) => CariModel.fromMap(json.decode(str));

// ignore: non_constant_identifier_names
String CariModelToMap(CariModel data) => json.encode(data.toMap());

class CariModel {
  CariModel({
    required this.cariCreateUser,
    required this.cariLastupUser,
    required this.cariKod,
    required this.cariUnvan1,
    required this.cariUnvan2,
    required this.cariVdaireAdi,
    required this.cariVdaireNo,

    // required this.cariHareketTipi,
    // required this.cariBaglantiTipi,
    // required this.cariStokAlimCinsi,
    // required this.cariStokSatimCinsi,
    // required this.cariVadeFarkYuz,
  });

  final int? cariDbCno = 0;
  final int? cariSpecReCno = 0;
  final bool? cariIptal = false;
  final int? cariFileid = 31;
  final bool? cariHidden = false;
  final bool? cariKilitli = false;
  final bool? cariDegisti = false;
  final int? cariChecksum = 0;
  final int cariCreateUser;
  final DateTime? cariCreateDate = DateTime.now();
  final int cariLastupUser;
  final DateTime? cariLastupDate = DateTime.now();
  final String? cariSpecial1 = '';
  final String? cariSpecial2 = '';
  final String? cariSpecial3 = '';
  final String cariKod;
  final String? cariUnvan1;
  final String? cariUnvan2;
  final int? cariHareketTipi = 0;
  final int? cariBaglantiTipi = 0;
  final int? cariStokAlimCinsi = 0;
  final int? cariStokSatimCinsi = 0;
  final String? cariMuhKod = '';
  final String? cariMuhKod1 = '';
  final String? cariMuhKod2 = '';
  final int? cariDovizCinsi = 0;
  final int? cariDovizCinsi1 = 255;
  final int? cariDovizCinsi2 = 255;
  final int? cariVadeFarkYuz = 0;
  final int? cariVadeFarkYuz1 = 0;
  final int? cariVadeFarkYuz2 = 0;
  final int? cariKurHesapSekli = 0;
  final String? cariVdaireAdi;
  final String cariVdaireNo;
  final String? cariSicilNo = '';
  final String? cariVergiKimlikNo = '';
  final int? cariSatisFk = 0;
  final int? cariOdemeCinsi = 0;
  final int? cariOdemeGunu = 0;
  final int? cariOdemeplanNo = 0;
  final int? cariOpsiyonGun = 0;
  final int? cariCariodemetercihi = 0;
  final int? cariFaturaAdresNo = 0; // ADRES
  final int? cariSevkAdresNo = 0;
  final String? cariBankaTcmbKod1 = '';
  final String? cariBankaTcmbSubekod1 = '';
  final String? cariBankaTcmbIlkod1 = '';
  final String? cariBankaHesapno1 = '';
  final String? cariBankaSwiftkodu1 = '';
  final String? cariBankaTcmbKod2 = '';
  final String? cariBankaTcmbSubekod2 = '';
  final String? cariBankaTcmbIlkod2 = '';
  final String? cariBankaHesapno2 = '';
  final String? cariBankaSwiftkodu2 = '';
  final String? cariBankaTcmbKod3 = '';
  final String? cariBankaTcmbSubekod3 = '';
  final String? cariBankaTcmbIlkod3 = '';
  final String? cariBankaHesapno3 = '';
  final String? cariBankaSwiftkodu3 = '';
  final String? cariBankaTcmbKod4 = '';
  final String? cariBankaTcmbSubekod4 = '';
  final String? cariBankaTcmbIlkod4 = '';
  final String? cariBankaHesapno4 = '';
  final String? cariBankaSwiftkodu4 = '';
  final String? cariBankaTcmbKod5 = '';
  final String? cariBankaTcmbSubekod5 = '';
  final String? cariBankaTcmbIlkod5 = '';
  final String? cariBankaHesapno5 = '';
  final String? cariBankaSwiftkodu5 = '';
  final String? cariBankaTcmbKod6 = '';
  final String? cariBankaTcmbSubekod6 = '';
  final String? cariBankaTcmbIlkod6 = '';
  final String? cariBankaHesapno6 = '';
  final String? cariBankaSwiftkodu6 = '';
  final String? cariBankaTcmbKod7 = '';
  final String? cariBankaTcmbSubekod7 = '';
  final String? cariBankaTcmbIlkod7 = '';
  final String? cariBankaHesapno7 = '';
  final String? cariBankaSwiftkodu7 = '';
  final String? cariBankaTcmbKod8 = '';
  final String? cariBankaTcmbSubekod8 = '';
  final String? cariBankaTcmbIlkod8 = '';
  final String? cariBankaHesapno8 = '';
  final String? cariBankaSwiftkodu8 = '';
  final String? cariBankaTcmbKod9 = '';
  final String? cariBankaTcmbSubekod9 = '';
  final String? cariBankaTcmbIlkod9 = '';
  final String? cariBankaHesapno9 = '';
  final String? cariBankaSwiftkodu9 = '';
  final String? cariBankaTcmbKod10 = '';
  final String? cariBankaTcmbSubekod10 = '';
  final String? cariBankaTcmbIlkod10 = '';
  final String? cariBankaHesapno10 = '';
  final String? cariBankaSwiftkodu10 = '';
  final int? cariEftHesapNum = 0;
  final String? cariAnaCariKodu = '';
  final String? cariSatisIskKod = '';
  final String? cariSektorKodu = '';
  final String? cariBolgeKodu = '';
  final String? cariGrupKodu = '';
  final String? cariTemsilciKodu = '';
  final String? cariMuhartikeli = '';
  final bool? cariFirmaAcikKapal = false;
  final bool? cariBuvTabiFl = false;
  final bool? cariCariKilitliFlg = false;
  final bool? cariEtiketBasFl = false;
  final bool? cariDetayInceleFlg = false;
  final bool? cariEfaturaFl = false;
  final int? cariPosOngpesyuzde = 0;
  final int? cariPosOngtaksayi = 0;
  final int? cariPosOngIskOran = 0;
  final DateTime? cariKaydagiristarihi = DateTime.now();
  final int? cariKabEdFCekTutar = 0;
  final int? cariHalCaritip = 0;
  final int? cariHalKomYuzdesi = 0;
  final int? cariTeslimSuresi = 0;
  final String? cariWwwadresi = '';
  final String? cariEMail = '';
  final String? cariCepTel = '';
  final int? cariVarsayilanGirisDepo = 0;
  final int? cariVarsayilanCikisDepo = 0;
  final bool? cariPortalEnabled = false;
  final String? cariPortalPw = '';
  final int? cariBagliOrtaklisaFirma = 0;
  final String? cariKampanyakodu = '';
  final bool? cariBBakiyeDegerlendirilmesinFl = false;
  final bool? cariABakiyeDegerlendirilmesinFl = false;
  final bool? cariBIrsbakiyeDegerlendirilmesinFl = false;
  final bool? cariAIrsbakiyeDegerlendirilmesinFl = false;
  final bool? cariBSipbakiyeDegerlendirilmesinFl = false;
  final bool? cariASipbakiyeDegerlendirilmesinFl = false;
  final bool? cariKrediRiskTakibiVarFlg = false;
  final String? cariUfrsFarkMuhKod = '';
  final String? cariUfrsFarkMuhKod1 = '';
  final String? cariUfrsFarkMuhKod2 = '';
  final int? cariOdemeSekli = 0; // 0: Vadeye göre 1: Satış Üzerinden
  final int? cariTeminatMekAlacakMuhKodu = 910;
  final String? cariTeminatMekAlacakMuhKodu1 = '';
  final String? cariTeminatMekAlacakMuhKodu2 = '';
  final int? cariTeminatMekBorcMuhKodu = 912;
  final String? cariTeminatMekBorcMuhKodu1 = '';
  final String? cariTeminatMekBorcMuhKodu2 = '';
  final int? cariVerilenDepozitoTeminatMuhKodu = 226;
  final String? cariVerilenDepozitoTeminatMuhKodu1 = '';
  final String? cariVerilenDepozitoTeminatMuhKodu2 = '';
  final int? cariAlinanDepozitoTeminatMuhKodu = 326;
  final String? cariAlinanDepozitoTeminatMuhKodu1 = '';
  final String? cariAlinanDepozitoTeminatMuhKodu2 = '';
  final int? cariDefEfaturaCinsi =
      0; // 0: Temel Fatura 1: Ticari Fatura 2: Yolcu Beraberinde Fatura 3: İhracat
  final bool? cariOtvTevkifatinaTabiiFl = false;
  final String? cariKepAdresi = '';
  final DateTime? cariEfaturaBaslangicTarihi = DateTime.now();
  final String? cariMutabakatMailAdresi = '';
  final String? cariMersisNo = '';
  final String? cariIstasyonCariKodu = '';
  final bool? cariGonderionayiSms = false;
  final bool? cariGonderionayiEmail = false;
  final bool? cariEirsaliyeFl = false;
  final DateTime? cariEirsaliyeBaslangicTarihi = DateTime.now();
  final String? cariVergidairekodu = '';
  final bool? cariCrmSistemineAktarFl = false;
  final String? cariEfaturaXsltDosya = '';
  final String? cariPasaportNo = '';
  final int? cariKisiKimlikBilgisiAciklamaTuru = 0;
  final String? cariKisiKimlikBilgisiDigerAciklama = '';
  final String? cariUtsKurumNo = '';
  final bool? cariKamuKurumuFl = false;
  final String? cariEarsivXsltDosya = '';
  final bool? cariPerakendeFl = false;
  final bool? cariYeniDoganMi = false;
  final String? cariEirsaliyeXsltDosya = '';
  final int? cariDefEirsaliyeCinsi = 0;
  final String? cariOzelButceliKurumCarisi = '';
  final bool? cariNakakincelenmesi = false;
  final bool? cariVergimukellefidegilMi = false;
  final String? cariTasiyicifirmaCariKodu = '';
  final String? cariNacekodu1 = '';
  final String? cariNacekodu2 = '';
  final String? cariNacekodu3 = '';
  final int? cariSirketTuru = 0; // CARİ ŞİRKET TÜRÜ
  final String? cariBabaAdi = '';
  final int? cariFaalTerk = 0;
  final int? cariF10DaDetay = 0;
  final int? hesapF10DaDetay = 0;
  final int? cariHarReferansTarihiNereden = 0;
  final int? otvStokMaliyetineIlaveEdilsinFl = 0;
  final int? oivStokMaliyetineIlaveEdilsinFl = 0;
  final int? kurHesaplamaSekli = 0;
  final int? cariKartindakiKurKurHesaplamaSekliniKullanFl = 0;
  final int? personeldeTakvimKullanimiAktifFl = 0;
  final int?
      personelIzinBitisTarihiHesaplamadaHaftaTatilGunleriDegerlendirilmesinFl =
      0;
  final String? haftaTatiliGunleri = '';
  final int? uretimPlanlamadanCagirirkenBozukMiktarDusulsunFl = 0;
  final int? degerliKagitKurFarkiDegerlemesi = 0;
  final int? muhasebedeMaliyilGozardiFl = 0;
  final int? subeSiparisindeKaynakDepoHakKontroluYapilmasin = 0;
  final int? subeSiparisindeHedefDepoHakKontroluYapilmasin = 0;
  final int? satinAlmaSartindanBrutFiyatGelsinFl = 0;
  final int? satisSartindanBrutFiyatGelsinFl = 0;
  final int? otvvergipntr = 0;
  final int? fasonVergiPntr = 0;
  final int? bsBaKontrolBelgeTarihindenFl = 0;
  final int? hizmetvergipntr = 0;
  final int? fasonVergiTipi = 0;
  final int? musteriTeminatMektubuBakiyeyiEtkilemesinFl = 0;
  final int? firmaTeminatMektubuBakiyeyiEtkilemesinFl = 0;
  final int? depozitoCekiBakiyeyiEtkilemesinFl = 0;
  final int? depozitoSenediBakiyeyiEtkilemesinFl = 0;
  final double? cariBakiye = 0;

  factory CariModel.fromMap(Map<String, dynamic> json) => CariModel(
        cariKod: json['cari_kod'],
        cariUnvan1: json['cari_unvan1'],
        cariUnvan2: json['cari_unvan2'],
        cariVdaireAdi: json['cari_vdaire_adi'],
        cariVdaireNo: json['cari_vdaire_no'],
        cariCreateUser: json['cari_create_user'],
        cariLastupUser: json['cari_lastup_user'],
      );
  Map<String, dynamic> toMap() => {
        'cari_DBCno': cariDbCno,
        'cari_SpecRECno': cariSpecReCno,
        'cari_iptal': cariIptal,
        'cari_fileid': cariFileid,
        'cari_hidden': cariHidden,
        'cari_kilitli': cariKilitli,
        'cari_degisti': cariDegisti,
        'cari_checksum': cariChecksum,
        'cari_create_date': cariCreateDate!.toIso8601String(),
        'cari_lastup_date': cariLastupDate!.toIso8601String(),
        'cari_special1': cariSpecial1,
        'cari_special2': cariSpecial2,
        'cari_special3': cariSpecial3,
        'cari_kod': cariKod,
        'cari_unvan1': cariUnvan1,
        'cari_unvan2': cariUnvan2,
        'cari_muh_kod': cariMuhKod,
        'cari_muh_kod1': cariMuhKod1,
        'cari_muh_kod2': cariMuhKod2,
        'cari_doviz_cinsi': cariDovizCinsi,
        'cari_doviz_cinsi1': cariDovizCinsi1,
        'cari_doviz_cinsi2': cariDovizCinsi2,
        'cari_vade_fark_yuz1': cariVadeFarkYuz1,
        'cari_vade_fark_yuz2': cariVadeFarkYuz2,
        'cari_KurHesapSekli': cariKurHesapSekli,
        'cari_vdaire_adi': cariVdaireAdi,
        'cari_vdaire_no': cariVdaireNo,
        'cari_sicil_no': cariSicilNo,
        'cari_VergiKimlikNo': cariVergiKimlikNo,
        'cari_satis_fk': cariSatisFk,
        'cari_odeme_cinsi': cariOdemeCinsi,
        'cari_odeme_gunu': cariOdemeGunu,
        'cari_odemeplan_no': cariOdemeplanNo,
        'cari_opsiyon_gun': cariOpsiyonGun,
        'cari_cariodemetercihi': cariCariodemetercihi,
        'cari_fatura_adres_no': cariFaturaAdresNo,
        'cari_sevk_adres_no': cariSevkAdresNo,
        'cari_banka_tcmb_kod1': cariBankaTcmbKod1,
        'cari_banka_tcmb_subekod1': cariBankaTcmbSubekod1,
        'cari_banka_tcmb_ilkod1': cariBankaTcmbIlkod1,
        'cari_banka_hesapno1': cariBankaHesapno1,
        'cari_banka_swiftkodu1': cariBankaSwiftkodu1,
        'cari_banka_tcmb_kod2': cariBankaTcmbKod2,
        'cari_banka_tcmb_subekod2': cariBankaTcmbSubekod2,
        'cari_banka_tcmb_ilkod2': cariBankaTcmbIlkod2,
        'cari_banka_hesapno2': cariBankaHesapno2,
        'cari_banka_swiftkodu2': cariBankaSwiftkodu2,
        'cari_banka_tcmb_kod3': cariBankaTcmbKod3,
        'cari_banka_tcmb_subekod3': cariBankaTcmbSubekod3,
        'cari_banka_tcmb_ilkod3': cariBankaTcmbIlkod3,
        'cari_banka_hesapno3': cariBankaHesapno3,
        'cari_banka_swiftkodu3': cariBankaSwiftkodu3,
        'cari_banka_tcmb_kod4': cariBankaTcmbKod4,
        'cari_banka_tcmb_subekod4': cariBankaTcmbSubekod4,
        'cari_banka_tcmb_ilkod4': cariBankaTcmbIlkod4,
        'cari_banka_hesapno4': cariBankaHesapno4,
        'cari_banka_swiftkodu4': cariBankaSwiftkodu4,
        'cari_banka_tcmb_kod5': cariBankaTcmbKod5,
        'cari_banka_tcmb_subekod5': cariBankaTcmbSubekod5,
        'cari_banka_tcmb_ilkod5': cariBankaTcmbIlkod5,
        'cari_banka_hesapno5': cariBankaHesapno5,
        'cari_banka_swiftkodu5': cariBankaSwiftkodu5,
        'cari_banka_tcmb_kod6': cariBankaTcmbKod6,
        'cari_banka_tcmb_subekod6': cariBankaTcmbSubekod6,
        'cari_banka_tcmb_ilkod6': cariBankaTcmbIlkod6,
        'cari_banka_hesapno6': cariBankaHesapno6,
        'cari_banka_swiftkodu6': cariBankaSwiftkodu6,
        'cari_banka_tcmb_kod7': cariBankaTcmbKod7,
        'cari_banka_tcmb_subekod7': cariBankaTcmbSubekod7,
        'cari_banka_tcmb_ilkod7': cariBankaTcmbIlkod7,
        'cari_banka_hesapno7': cariBankaHesapno7,
        'cari_banka_swiftkodu7': cariBankaSwiftkodu7,
        'cari_banka_tcmb_kod8': cariBankaTcmbKod8,
        'cari_banka_tcmb_subekod8': cariBankaTcmbSubekod8,
        'cari_banka_tcmb_ilkod8': cariBankaTcmbIlkod8,
        'cari_banka_hesapno8': cariBankaHesapno8,
        'cari_banka_swiftkodu8': cariBankaSwiftkodu8,
        'cari_banka_tcmb_kod9': cariBankaTcmbKod9,
        'cari_banka_tcmb_subekod9': cariBankaTcmbSubekod9,
        'cari_banka_tcmb_ilkod9': cariBankaTcmbIlkod9,
        'cari_banka_hesapno9': cariBankaHesapno9,
        'cari_banka_swiftkodu9': cariBankaSwiftkodu9,
        'cari_banka_tcmb_kod10': cariBankaTcmbKod10,
        'cari_banka_tcmb_subekod10': cariBankaTcmbSubekod10,
        'cari_banka_tcmb_ilkod10': cariBankaTcmbIlkod10,
        'cari_banka_hesapno10': cariBankaHesapno10,
        'cari_banka_swiftkodu10': cariBankaSwiftkodu10,
        'cari_EftHesapNum': cariEftHesapNum,
        'cari_Ana_cari_kodu': cariAnaCariKodu,
        'cari_satis_isk_kod': cariSatisIskKod,
        'cari_sektor_kodu': cariSektorKodu,
        'cari_bolge_kodu': cariBolgeKodu,
        'cari_grup_kodu': cariGrupKodu,
        'cari_temsilci_kodu': cariTemsilciKodu,
        'cari_muhartikeli': cariMuhartikeli,
        'cari_firma_acik_kapal': cariFirmaAcikKapal,
        'cari_BUV_tabi_fl': cariBuvTabiFl,
        'cari_cari_kilitli_flg': cariCariKilitliFlg,
        'cari_etiket_bas_fl': cariEtiketBasFl,
        'cari_Detay_incele_flg': cariDetayInceleFlg,
        'cari_efatura_fl': cariEfaturaFl,
        'cari_POS_ongpesyuzde': cariPosOngpesyuzde,
        'cari_POS_ongtaksayi': cariPosOngtaksayi,
        'cari_POS_ongIskOran': cariPosOngIskOran,
        'cari_kaydagiristarihi': cariKaydagiristarihi!.toIso8601String(),
        'cari_KabEdFCekTutar': cariKabEdFCekTutar,
        'cari_hal_caritip': cariHalCaritip,
        'cari_HalKomYuzdesi': cariHalKomYuzdesi,
        'cari_TeslimSuresi': cariTeslimSuresi,
        'cari_wwwadresi': cariWwwadresi,
        'cari_EMail': cariEMail,
        'cari_CepTel': cariCepTel,
        'cari_VarsayilanGirisDepo': cariVarsayilanGirisDepo,
        'cari_VarsayilanCikisDepo': cariVarsayilanCikisDepo,
        'cari_Portal_Enabled': cariPortalEnabled,
        'cari_Portal_PW': cariPortalPw,
        'cari_BagliOrtaklisa_Firma': cariBagliOrtaklisaFirma,
        'cari_kampanyakodu': cariKampanyakodu,
        'cari_b_bakiye_degerlendirilmesin_fl': cariBBakiyeDegerlendirilmesinFl,
        'cari_a_bakiye_degerlendirilmesin_fl': cariABakiyeDegerlendirilmesinFl,
        'cari_b_irsbakiye_degerlendirilmesin_fl':
            cariBIrsbakiyeDegerlendirilmesinFl,
        'cari_a_irsbakiye_degerlendirilmesin_fl':
            cariAIrsbakiyeDegerlendirilmesinFl,
        'cari_b_sipbakiye_degerlendirilmesin_fl':
            cariBSipbakiyeDegerlendirilmesinFl,
        'cari_a_sipbakiye_degerlendirilmesin_fl':
            cariASipbakiyeDegerlendirilmesinFl,
        'cari_KrediRiskTakibiVar_flg': cariKrediRiskTakibiVarFlg,
        'cari_ufrs_fark_muh_kod': cariUfrsFarkMuhKod,
        'cari_ufrs_fark_muh_kod1': cariUfrsFarkMuhKod1,
        'cari_ufrs_fark_muh_kod2': cariUfrsFarkMuhKod2,
        'cari_odeme_sekli': cariOdemeSekli,
        'cari_TeminatMekAlacakMuhKodu': cariTeminatMekAlacakMuhKodu,
        'cari_TeminatMekAlacakMuhKodu1': cariTeminatMekAlacakMuhKodu1,
        'cari_TeminatMekAlacakMuhKodu2': cariTeminatMekAlacakMuhKodu2,
        'cari_TeminatMekBorcMuhKodu': cariTeminatMekBorcMuhKodu,
        'cari_TeminatMekBorcMuhKodu1': cariTeminatMekBorcMuhKodu1,
        'cari_TeminatMekBorcMuhKodu2': cariTeminatMekBorcMuhKodu2,
        'cari_VerilenDepozitoTeminatMuhKodu': cariVerilenDepozitoTeminatMuhKodu,
        'cari_VerilenDepozitoTeminatMuhKodu1':
            cariVerilenDepozitoTeminatMuhKodu1,
        'cari_VerilenDepozitoTeminatMuhKodu2':
            cariVerilenDepozitoTeminatMuhKodu2,
        'cari_AlinanDepozitoTeminatMuhKodu': cariAlinanDepozitoTeminatMuhKodu,
        'cari_AlinanDepozitoTeminatMuhKodu1': cariAlinanDepozitoTeminatMuhKodu1,
        'cari_AlinanDepozitoTeminatMuhKodu2': cariAlinanDepozitoTeminatMuhKodu2,
        'cari_def_efatura_cinsi': cariDefEfaturaCinsi,
        'cari_otv_tevkifatina_tabii_fl': cariOtvTevkifatinaTabiiFl,
        'cari_KEP_adresi': cariKepAdresi,
        'cari_efatura_baslangic_tarihi':
            cariEfaturaBaslangicTarihi!.toIso8601String(),
        'cari_mutabakat_mail_adresi': cariMutabakatMailAdresi,
        'cari_mersis_no': cariMersisNo,
        'cari_istasyon_cari_kodu': cariIstasyonCariKodu,
        'cari_gonderionayi_sms': cariGonderionayiSms,
        'cari_gonderionayi_email': cariGonderionayiEmail,
        'cari_eirsaliye_fl': cariEirsaliyeFl,
        'cari_eirsaliye_baslangic_tarihi':
            cariEirsaliyeBaslangicTarihi!.toIso8601String(),
        'cari_vergidairekodu': cariVergidairekodu,
        'cari_CRM_sistemine_aktar_fl': cariCrmSistemineAktarFl,
        'cari_efatura_xslt_dosya': cariEfaturaXsltDosya,
        'cari_pasaport_no': cariPasaportNo,
        'cari_kisi_kimlik_bilgisi_aciklama_turu':
            cariKisiKimlikBilgisiAciklamaTuru,
        'cari_kisi_kimlik_bilgisi_diger_aciklama':
            cariKisiKimlikBilgisiDigerAciklama,
        'cari_uts_kurum_no': cariUtsKurumNo,
        'cari_kamu_kurumu_fl': cariKamuKurumuFl,
        'cari_earsiv_xslt_dosya': cariEarsivXsltDosya,
        'cari_Perakende_fl': cariPerakendeFl,
        'cari_yeni_dogan_mi': cariYeniDoganMi,
        'cari_eirsaliye_xslt_dosya': cariEirsaliyeXsltDosya,
        'cari_def_eirsaliye_cinsi': cariDefEirsaliyeCinsi,
        'cari_ozel_butceli_kurum_carisi': cariOzelButceliKurumCarisi,
        'cari_nakakincelenmesi': cariNakakincelenmesi,
        'cari_vergimukellefidegil_mi': cariVergimukellefidegilMi,
        'cari_tasiyicifirma_cari_kodu': cariTasiyicifirmaCariKodu,
        'cari_nacekodu_1': cariNacekodu1,
        'cari_nacekodu_2': cariNacekodu2,
        'cari_nacekodu_3': cariNacekodu3,
        'cari_sirket_turu': cariSirketTuru,
        'cari_baba_adi': cariBabaAdi,
        'cari_faal_terk': cariFaalTerk,
        'Cari_F10da_detay': cariF10DaDetay,
        'Hesap_F10da_detay': hesapF10DaDetay,
        'CariHarReferansTarihiNereden': cariHarReferansTarihiNereden,
        'OTVStokMaliyetineIlaveEdilsin_fl': otvStokMaliyetineIlaveEdilsinFl,
        'OIVStokMaliyetineIlaveEdilsin_fl': oivStokMaliyetineIlaveEdilsinFl,
        'KurHesaplamaSekli': kurHesaplamaSekli,
        'CariKartindakiKurKurHesaplamaSekliniKullan_fl':
            cariKartindakiKurKurHesaplamaSekliniKullanFl,
        'Personelde_takvim_kullanimi_aktif_fl':
            personeldeTakvimKullanimiAktifFl,
        'PersonelIzinBitisTarihiHesaplamadaHaftaTatilGunleriDegerlendirilmesin_fl':
            personelIzinBitisTarihiHesaplamadaHaftaTatilGunleriDegerlendirilmesinFl,
        'Hafta_Tatili_Gunleri': haftaTatiliGunleri,
        'Uretim_PlanlamadanCagirirkenBozukMiktarDusulsun_fl':
            uretimPlanlamadanCagirirkenBozukMiktarDusulsunFl,
        'Degerli_kagit_kur_farki_degerlemesi': degerliKagitKurFarkiDegerlemesi,
        'Muhasebede_Maliyil_Gozardi_fl': muhasebedeMaliyilGozardiFl,
        'SubeSiparisinde_Kaynak_Depo_Hak_Kontrolu_Yapilmasin':
            subeSiparisindeKaynakDepoHakKontroluYapilmasin,
        'SubeSiparisinde_Hedef_Depo_Hak_Kontrolu_Yapilmasin':
            subeSiparisindeHedefDepoHakKontroluYapilmasin,
        'SatinAlmaSartindan_Brut_Fiyat_gelsin_fl':
            satinAlmaSartindanBrutFiyatGelsinFl,
        'SatisSartindan_Brut_Fiyat_gelsin_fl': satisSartindanBrutFiyatGelsinFl,
        'Otvvergipntr': otvvergipntr,
        'FasonVergiPntr': fasonVergiPntr,
        'BsBa_Kontrol_Belge_tarihinden_fl': bsBaKontrolBelgeTarihindenFl,
        'hizmetvergipntr': hizmetvergipntr,
        'FasonVergiTipi': fasonVergiTipi,
        'MusteriTeminatMektubu_Bakiyeyi_Etkilemesin_fl':
            musteriTeminatMektubuBakiyeyiEtkilemesinFl,
        'FirmaTeminatMektubu_Bakiyeyi_Etkilemesin_fl':
            firmaTeminatMektubuBakiyeyiEtkilemesinFl,
        'DepozitoCeki_Bakiyeyi_Etkilemesin_fl':
            depozitoCekiBakiyeyiEtkilemesinFl,
        'DepozitoSenedi_Bakiyeyi_Etkilemesin_fl':
            depozitoSenediBakiyeyiEtkilemesinFl,
        'CariBakiye': cariBakiye,
      };
}
