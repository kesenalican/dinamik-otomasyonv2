import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/siparisler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/satis_siparisi.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final satisSiparisiSaveProvider = FutureProvider.autoDispose
    .family<List<Siparisler>, Siparisler>(((ref, siparis) async {
  final dio = ref.watch(httpClientProvider);
  late final Response result;
  try {
    result = await dio.post(ConstantProvider.satisSiparisi, data: {
      "sip_create_user": siparis.sipCreateUser,
      "sip_lastup_user": siparis.sipLastupUser,
      "sip_teslim_tarih": siparis.sipTeslimTarih,
      "sip_satici_kod": siparis.sipSaticiKod,
      "sip_musteri_kod": siparis.sipMusteriKod,
      "sip_stok_kod": siparis.sipStokKod,
      "sip_b_fiyat": siparis.sipBFiyat,
      "sip_miktar": siparis.sipMiktar,
      "sip_teslim_miktar": siparis.sipTeslimMiktar,
      "sip_tutar": siparis.sipTutar,
      "sip_iskonto_1": siparis.siparislerSipIskonto1,
      "sip_iskonto_2": siparis.siparislerSipIskonto2,
      "sip_iskonto_3": siparis.siparislerSipIskonto3,
      "sip_iskonto_4": siparis.siparislerSipIskonto4,
      "sip_iskonto_5": siparis.siparislerSipIskonto5,
      "sip_iskonto_6": siparis.siparislerSipIskonto6,
      "sip_masraf_1": siparis.siparislerSipMasraf1,
      "sip_masraf_2": siparis.siparislerSipMasraf2,
      "sip_masraf_3": siparis.siparislerSipMasraf3,
      "sip_masraf_4": siparis.siparislerSipMasraf4,
      "sip_vergi": siparis.sipVergi,
      "sip_aciklama": siparis.sipAciklama,
      "sip_depono": siparis.sipDepono,
      "sip_teslimturu": siparis.sipTeslimturu,
    });
    if (result.statusCode == 200) {
      List<Map<String, dynamic>> mapData = List.from(result.data);
      List<Siparisler> siparisList =
          mapData.map((e) => Siparisler.fromMap(e)).toList();
      return siparisList;
    }
  } catch (e) {
    BuildContext? context;
    return showAlertDialog(
      context: context,
      hataBaslik: "Sipariş Kayıt Hatası",
      hataIcerik: e.toString(),
    );
  }
  return [];
}));
