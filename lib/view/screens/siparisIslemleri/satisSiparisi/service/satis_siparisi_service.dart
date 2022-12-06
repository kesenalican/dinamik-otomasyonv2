import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/evrak_bilgileri.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/siparisler.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final satisSiparisiSaveProvider = FutureProvider.autoDispose
    .family<List<Siparisler>, Siparisler>(((ref, siparis) async {
  final dio = ref.watch(httpClientProvider);
  late final Response result;
  try {
    result = await dio.post(ConstantProvider.satisSiparisi, data: {
      "sip_create_user": siparis.sipCreateUser,
      "sip_lastup_user": siparis.sipLastupUser,
      "sip_doviz_cinsi": siparis.sipDovizCinsi,
      "sip_tip": siparis.sipTip,
      "sip_evrakno_seri": siparis.sipEvraknoSeri,
      "sip_evrakno_sira": siparis.sipEvraknoSira,
      "sip_satirno": siparis.sipSatirno,
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
      "sip_aciklama": siparis.sipAciklama,
      "sip_OnaylayanKulNo": siparis.sipOnaylayanKulNo,
      "sip_depono": siparis.sipDepono,
    });
    if (result.statusCode == 200) {
      List<Map<String, dynamic>> mapData = List.from(result.data);
      List<Siparisler> siparisList =
          mapData.map((e) => Siparisler.fromMap(e)).toList();
      return siparisList;
    }
  } catch (e) {
    Future.delayed(const Duration(milliseconds: 500), () {
      print("HATAAA== " + e.toString());
      // showAlertDialog(
      //   context: context,
      //   hataBaslik: "Sipariş Kayıt Hatası",
      //   hataIcerik: e.toString(),
      // );
    });
  }
  return [];
}));

class SatisSiparisiService {
  int? seriNoElemanSayisi;
  getEvrakBilgileri(String seriNo) async {
    final result =
        await Dio().get("${ConstantProvider.BASE_URL}EvrakBilgileri");
    List<Map<String, dynamic>> mapData = List.from(result.data);
    List<EvrakBilgileri> evrakList =
        mapData.map((e) => EvrakBilgileri.fromMap(e)).toList();
    var seriNoList =
        evrakList.where((element) => element.seri == seriNo).toList();
    seriNoElemanSayisi = seriNoList.length;

    return seriNoElemanSayisi;
  }
}

//#region Cariler
final evrakBilgileriProvider =
    FutureProvider.autoDispose<List<EvrakBilgileri>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get("EvrakBilgileri");
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<EvrakBilgileri> evrakList =
      mapData.map((e) => EvrakBilgileri.fromMap(e)).toList();
  return evrakList;
});
//#endregion
