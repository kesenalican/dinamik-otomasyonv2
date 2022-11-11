import 'package:dinamik_otomasyon/Model/depo_model.dart';
import 'package:dinamik_otomasyon/Model/firma_model.dart';
import 'package:dinamik_otomasyon/Model/kasa_model.dart';
import 'package:dinamik_otomasyon/Model/vergi_daire_model.dart';
import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//#region Depo
final depolarProvider = FutureProvider<List<Depo>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get("Depo");
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<Depo> cariList = mapData.map((e) => Depo.fromMap(e)).toList();
  return cariList;
});
//#endregion

//#region Depo
final kasalarProvider = FutureProvider<List<KasaModel>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get("Kasalar");
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<KasaModel> kasaList = mapData.map((e) => KasaModel.fromMap(e)).toList();
  return kasaList;
});
//#endregion

//#region Depo
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

final firmaProvider = FutureProvider<List<FirmaModel>>((ref) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.get("Firma");
  List<Map<String, dynamic>> mapData = List.from(result.data);
  List<FirmaModel> firmaList =
      mapData.map((e) => FirmaModel.fromMap(e)).toList();
  return firmaList;
});
//#endregion

