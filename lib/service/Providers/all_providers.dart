import 'package:dinamik_otomasyon/Model/cari_personel_tanimlari.dart';
import 'package:dinamik_otomasyon/Model/depo_model.dart';
import 'package:dinamik_otomasyon/Model/firma_model.dart';
import 'package:dinamik_otomasyon/Model/kasa_model.dart';
import 'package:dinamik_otomasyon/Model/kur_model.dart';
import 'package:dinamik_otomasyon/Model/odeme_plani_model.dart';
import 'package:dinamik_otomasyon/Model/projeler.dart';
import 'package:dinamik_otomasyon/Model/sorm_merkezi_model.dart';
import 'package:dinamik_otomasyon/Model/stok_satis_fiyat_tanimlari.dart';
import 'package:dinamik_otomasyon/Model/teslim_turleri_model.dart';
import 'package:dinamik_otomasyon/Model/vergi_daire_model.dart';
import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//#region DEPO
final depolarProvider = FutureProvider<List<Depo>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get('Depo');
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<Depo> cariList = mapData.map((e) => Depo.fromMap(e)).toList();
  return cariList;
});
//#endregion

//#region KASA
final kasalarProvider = FutureProvider<List<KasaModel>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get('Kasalar');
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<KasaModel> kasaList = mapData.map((e) => KasaModel.fromMap(e)).toList();
  return kasaList;
});
//#endregion

//#region KURLAR
final kurlarProvider = FutureProvider<List<Kurlar>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get('Kurlar');
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<Kurlar> kasaList = mapData.map((e) => Kurlar.fromMap(e)).toList();
  return kasaList;
});
//#endregion

//#region VERGI DAIRELERI
final vergiDaireleriProvider =
    FutureProvider<List<VergiDaireModel>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get(ConstantProvider.vergiDaireleri);
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<VergiDaireModel> vergiDaireList =
      mapData.map((e) => VergiDaireModel.fromMap(e)).toList();
  return vergiDaireList;
});
//#endregion

//#region FIRMALAR
final firmaProvider = FutureProvider<List<FirmaModel>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get('Firma');
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<FirmaModel> firmaList =
      mapData.map((e) => FirmaModel.fromMap(e)).toList();
  return firmaList;
});
//#endregion

//#region PROJELER
final projeProvider = FutureProvider<List<Projeler>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get('Projeler');
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<Projeler> firmaList = mapData.map((e) => Projeler.fromMap(e)).toList();
  return firmaList;
});
//#endregion

//#region SORUMLULUK MERKEZİ
final sormMerkeziProvider = FutureProvider<List<SormMerkezi>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get('SormMerkezi');
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<SormMerkezi> firmaList =
      mapData.map((e) => SormMerkezi.fromMap(e)).toList();
  return firmaList;
});
//#endregion

//#region ODEME PLANI
final odemePlaniProvider = FutureProvider<List<OdemePlani>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get('OdemePlani');
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<OdemePlani> firmaList =
      mapData.map((e) => OdemePlani.fromMap(e)).toList();
  return firmaList;
});
//#endregion

// //#region CARI PERSONEL
// final cariPersonelProvider = FutureProvider<List<CariPersonel>>((ref) async {
//   final dio = ref.watch(httpClientProvider);
//   final result = await dio.get('CariPersonel');
//   List<Map<String, dynamic>> mapData = List.from(result.data);
//   List<CariPersonel> firmaList =
//       mapData.map((e) => CariPersonel.fromMap(e)).toList();
//   return firmaList;
// });
// //#endregion

//#region TESLIM TURU
final teslimTuruProvider = FutureProvider<List<TeslimTurleri>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get('TeslimTurleri');
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<TeslimTurleri> firmaList =
      mapData.map((e) => TeslimTurleri.fromMap(e)).toList();
  return firmaList;
});
//#endregion

//#region TESLIM TURU
final stokSatisFiyatiListeleri =
    FutureProvider<List<StokSatisFiyatListeleri>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get('StokSatisFiyatListeleri');
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<StokSatisFiyatListeleri> satisList =
      mapData.map((e) => StokSatisFiyatListeleri.fromMap(e)).toList();
  return satisList;
});
//#endregion

//#region Stoklar koda göre sıralama
final cariPersonelProvider = FutureProvider.autoDispose
    .family<List<CariPersonelTanimlari>, int>((ref, type) async {
  final dio = ref.watch(httpClientProvider);
  final result =
      await dio.get('CariPersonelTanimlari', queryParameters: {'tipi': type});
  if (result.statusCode == 200) {
    List<Map<String, dynamic>> mapData = List.from(result.data);
    List<CariPersonelTanimlari> personelList =
        mapData.map((e) => CariPersonelTanimlari.fromMap(e)).toList();
    return personelList;
  } else {
    return Future.delayed(const Duration(seconds: 1));
  }
});
//#endregion
