import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/core/constants/api_constant.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/evrak_bilgileri.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IrsaliyeService {
  int? seriNoElemanSayisi;
  getEvrakBilgileri(String seriNo) async {
    final result = await Dio().get(
        '${ConstantProvider.baseUrl}${ConstantProvider.irsaliyeEvrakKontrol}');
    List<Map<String, dynamic>> mapData = List.from(result.data);
    List<EvrakBilgileri> evrakList =
        mapData.map((e) => EvrakBilgileri.fromMap(e)).toList();
    var seriNoList =
        evrakList.where((element) => element.seri == seriNo).toList();
    seriNoElemanSayisi = seriNoList.length;
    return seriNoElemanSayisi;
  }
}

final siparisVarmi = FutureProvider.autoDispose.family<List<Cariler>, String>(
  (ref, cariKodu) async {
    final dio = ref.watch(httpClientProvider);
    final result = await dio
        .get('StokHareketleri', queryParameters: {'cariKodu': cariKodu});
    if (result.statusCode == 200) {
      List<Map<String, dynamic>> mapData = List.from(result.data);
      List<Cariler> personelList =
          mapData.map((e) => Cariler.fromMap(e)).toList();
      return personelList;
    } else {
      return Future.delayed(const Duration(seconds: 1));
    }
  },
);
