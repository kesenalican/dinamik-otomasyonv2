import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_grup.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_save.model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_sektor.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/muhasebe_hesap.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class CariService {
//   saveCari(CariModel cari) async {
//     try {
//       final result =
//           await Dio().post("${ConstantProvider.BASE_URL}CariBilgiler", data: {
//         "cari_kod": cari.cariKod,
//         "cari_unvan1": cari.cariUnvan1,
//         "cari_unvan2": cari.cariUnvan2
//       });
//       if (result.statusCode == 500) {
//         return "Girilen Cari Kodu Zaten Tanımlı!";
//       } else if (result.statusCode == 200) {
//         return result;
//       } else {
//         return "Bilinmeyen bir hata oluştu!";
//       }
//     } on DioError catch (e) {
//       print("Type: ${e.type.toString()}");
//       print("Message: ${e.message}");
//       print("Error: ${e.error}");
//     }
//   }
// }

//#region Cariler
final cariSaveProvider = FutureProvider.autoDispose
    .family<List<Cariler>, CariModel>((ref, cari) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.post("CariBilgiler", data: {
    "cari_kod": cari.cariKod,
    "cari_unvan1": cari.cariUnvan1,
    "cari_unvan2": cari.cariUnvan2,
    "cari_vdaire_adi": cari.cariVdaireAdi,
    "cari_vdaire_kodu": cari.cariVergidairekodu,
  });
  if (result.statusCode == 200) {
    print("Cari Başarıyla kaydedildi");
  } else if (result.statusCode == 500) {
    print("Bu cari kodu kullanılmış");
  } else if (result.statusCode == 400) {
  } else {
    print("bilinmeyen bir hata oluştu");
  }
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<Cariler> cariList = mapData.map((e) => Cariler.fromMap(e)).toList();
  return cariList;
});
//#endregion

//#region Cariler
final carilerProvider = FutureProvider.autoDispose
    .family<List<Cariler>, int>((ref, pageCount) async {
  final dio = ref.watch(httpClientProvider);
  final result =
      await dio.get("CariBilgiler", queryParameters: {'offset': pageCount});
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<Cariler> cariList = mapData.map((e) => Cariler.fromMap(e)).toList();
  return cariList;
});
//#endregion

//#region Cariler
final muhHesapProvider =
    FutureProvider.autoDispose<List<MuhasebeHesapModel>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get("MuhasebeHesapKodu");
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<MuhasebeHesapModel> muhHesapKodList =
      mapData.map((e) => MuhasebeHesapModel.fromMap(e)).toList();
  return muhHesapKodList;
});
//#endregion

//#region Cariler
final cariGrupProvider =
    FutureProvider.autoDispose<List<CariGrupModel>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get("CariGrupKodu");
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<CariGrupModel> cariGrupKodList =
      mapData.map((e) => CariGrupModel.fromMap(e)).toList();
  return cariGrupKodList;
});
//#endregion

//#region Cariler
final cariSektorProvider =
    FutureProvider.autoDispose<List<CariSektorModel>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get("CariGrupKodu");
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<CariSektorModel> cariSektorKodList =
      mapData.map((e) => CariSektorModel.fromMap(e)).toList();
  return cariSektorKodList;
});
//#endregion

