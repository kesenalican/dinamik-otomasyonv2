import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/core/constants/api_constant.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_adres_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_grup.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_save.model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_sektor.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/muhasebe_hesap.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CariService extends ChangeNotifier {
  CariModel? cariModel;
  BuildContext? context;
  late List<Cariler> cariKodSorgula;
  bool? success = true;

  // getCari() async {
  //   final result = await Dio().get("${ConstantProvider.BASE_URL}CariBilgiler");
  //   List<Map<String, dynamic>> mapData = List.from(result.data);
  //   List<Cariler> cariList = mapData.map((e) => Cariler.fromMap(e)).toList();
  //   notifyListeners();
  //   return cariList;
  // }

  // searchCari(int offset, String cariUnvan, String cariKodu) async {
  //   final result =
  //       await Dio().get('${ConstantProvider.baseUrl}CariBilgiler/search');
  //   if (result.statusCode == 200) {
  //     List<Map<String, dynamic>> mapData = List.from(result.data);
  //     List<Cariler> cariList = mapData.map((e) => Cariler.fromMap(e)).toList();
  //     cariKodSorgula = cariList
  //         .where((element) =>
  //             element.cariUnvani1!
  //                 .toLowerCase()
  //                 .contains(cariUnvan.toLowerCase()) ||
  //             element.cariKodu.toLowerCase().contains(cariKodu.toLowerCase()))
  //         .toList();

  //     print('liste uzunlu??u${cariKodSorgula.length}');
  //     print(cariKodSorgula.first.cariUnvani1.toString());
  //     notifyListeners();
  //     return cariKodSorgula;
  //   } else {
  //     print('bir hata olu??tu :${result.data}');
  //   }
  // }
}

//#region Cariler
final carilerProvider = FutureProvider.autoDispose
    .family<List<Cariler>, int>((ref, pageCount) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get(      ConstantProvider.cariBilgiler,
      queryParameters: {'offset': pageCount});
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<Cariler> cariList = mapData.map((e) => Cariler.fromMap(e)).toList();
  return cariList;
});
//#endregion

//#region Cariler
final cariSaveProvider = FutureProvider.autoDispose
    .family<List<CariModel>, CariModel>((ref, cari) async {
  BuildContext? context;

  final dio = ref.watch(httpClientProvider);
  final map = {
    'cari_kod': cari.cariKod,
    'cari_unvan1': cari.cariUnvan1,
    'cari_unvan2': cari.cariUnvan2,
    'cari_vdaire_adi': cari.cariVdaireAdi,
    'cari_vdaire_no': cari.cariVergidairekodu,
    'cari_create_user': cari.cariCreateUser,
    'cari_lastup_user': cari.cariLastupUser,
  };
  late final Response result;
  try {
    result = await dio.post(ConstantProvider.cariBilgiler, data: map);
    if (result.statusCode == 200) {
      List<Map<String, dynamic>> mapData = List.from(result.data);
      List<CariModel> cariList =
          mapData.map((e) => CariModel.fromMap(e)).toList();
      return cariList;
    } else if (result.statusCode == 500) {
      return showAlertDialog(
        context: context!,
        hataBaslik: Constants.kayitHatasi,
        hataIcerik: Constants.cariZatenKayitli,
      );
    } else if (result.statusCode == 400) {
    } else {}
  } catch (e) {
    print(e.toString());

    Builder(
      builder: (context) {
        return showAlertDialog(
          context: context,
          hataBaslik: Constants.kayitHatasi,
          hataIcerik: Constants.cariZatenKayitli,
        );
      },
    );
  }
  return [];
});
//#endregion

final cariAdresSaveProvider = FutureProvider.autoDispose
    .family<List<Cariler>, CariAdresModel>((ref, cariAdres) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.post(ConstantProvider.cariAdres, data: {
    'adr_create_user': 0,
    'adr_cari_kod': cariAdres.adrCariKod,
    'adr_adres_no': cariAdres.adrAdresNo,
    'adr_cadde': cariAdres.adrCadde,
    'adr_mahalle': cariAdres.adrMahalle,
    'adr_sokak': cariAdres.adrSokak,
    'adr_ilce': cariAdres.adrIlce,
    'adr_il': cariAdres.adrIl,
    'adr_ulke': cariAdres.adrUlke,
    'adr_tel_ulke_kodu': cariAdres.adrTelUlkeKodu,
    'adr_tel_modem': cariAdres.adrTelModem,
  });
  if (result.statusCode == 200) {
    print('Cari Adres ba??ar??yla kaydedildi');
  } else if (result.statusCode == 500) {
    print('Bu adres kodu kullan??lm????');
  } else if (result.statusCode == 400) {
    print('request hatas??');
  } else {
    print('bilinmeyen bir hata olu??tu');
  }
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<Cariler> cariList = mapData.map((e) => Cariler.fromMap(e)).toList();
  return cariList;
});
//#endregion

final cariAdresProvider = FutureProvider.autoDispose
    .family<List<CariAdresModel>, String>((ref, cariKod) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get(ConstantProvider.cariAdres, queryParameters: {
    'cariKod': cariKod.toString(),
  });
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<CariAdresModel> cariList =
      mapData.map((e) => CariAdresModel.fromMap(e)).toList();
  return cariList;
});

//#region Cariler
final muhHesapProvider =
    FutureProvider.autoDispose<List<MuhasebeHesapModel>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get(ConstantProvider.muhasebeHesapKodu);
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
  final result = await dio.get(ConstantProvider.cariGrupKodu);
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
  final result = await dio.get(ConstantProvider.cariSektorKodu);
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<CariSektorModel> cariSektorKodList =
      mapData.map((e) => CariSektorModel.fromMap(e)).toList();
  return cariSektorKodList;
});
//#endregion

