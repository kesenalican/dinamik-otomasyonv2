import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/en_cok_satilan_urunler.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stok_alis_fiyatlari.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class StokService {
//   List<Stoklar>? stokList;
//   Future<List<Stoklar>> getStok() async {
//     List<Stoklar> stoklist = [];
//     final stoklar =
//         FutureProvider.family<List<Stoklar>, int>((ref, page) async {
//       final dio = ref.watch(httpClientProvider);
//       final result =
//           await dio.get("Stoklar", queryParameters: {'offset': page});
//       List<Map<String, dynamic>> mapData = List.from(result.data);
//       stoklist = mapData.map((e) => Stoklar.fromMap(e)).toList();
//       return stoklist;
//     });

//     return stoklist;
//   }

//   Future<List<Stoklar>?> getStoklar(int offset) async {
//     final result =
//         await Dio().get("${ConstantProvider.BASE_URL}/Stoklar?offset=$offset");
//     List<Map<String, dynamic>> mapData = List.from(result.data);
//     stokList = mapData.map((e) => Stoklar.fromMap(e)).toList();
//     return stokList;
//   }
// }
// final deneme = FutureProvider.family<List<Stoklar>, String>((ref, query) {
//   return StokService().getUserListforSearch(query);
// });

class StokService {
  var data = [];
  List<Stoklar> results = [];
  String fetchUrl = '${ConstantProvider.baseUrl}Stoklar/search';
  Future<List<Stoklar>> getStokLList() async {
    var response = await Dio().get(fetchUrl);
    try {
      if (response.statusCode == 200) {
        List<Map<String, dynamic>> mapData = List.from(response.data);
        results = mapData.map((e) => Stoklar.fromMap(e)).toList();
        // results.where((stok) =>
        //     stok.stokKodu.toLowerCase().contains(stok.stokKodu.toLowerCase()));
        return results;
      } else {
        print('api error');
      }
    } on Exception catch (e) {
      print('api error ${e.toString()}');
    }
    return results;
  }
}

// //#region Stoklar koda göre sıralama
// final allStoklarProvider = FutureProvider<List<Stoklar>>((ref) async {
//   final dio = ref.watch(httpClientProvider);
//   final result = await dio.get("Stoklar/search");
//   if (result.statusCode == 200) {
//     List<Map<String, dynamic>> mapData = List.from(result.data);
//     List<Stoklar> stoklist = mapData.map((e) => Stoklar.fromMap(e)).toList();
//     return stoklist;
//   } else {
//     return Future.delayed(const Duration(seconds: 1));
//   }
// });
// //#endregion

//#region Stoklar koda göre sıralama
final stoklarProvider = FutureProvider.autoDispose
    .family<List<Stoklar>, int>((ref, pageCount) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio
      .get('Stoklar', queryParameters: {'offset': pageCount});
  if (result.statusCode == 200) {
    List<Map<String, dynamic>> mapData = List.from(result.data);
    List<Stoklar> stoklist = mapData.map((e) => Stoklar.fromMap(e)).toList();
    return stoklist;
  } else {
    return Future.delayed(const Duration(seconds: 1));
  }
});
//#endregion

//#region Stok Son Alış Fiyatları
final stokAlisFiyatlariProvider =
    FutureProvider.family<List<StokAlisFiyatlari>, String>(
        (ref, stokKodu) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio
      .post(ConstantProvider.stokAlisFiyatlari, data: {'stokKodu': stokKodu});
  if (result.statusCode == 200) {
    List<Map<String, dynamic>> mapData = List.from(result.data);
    List<StokAlisFiyatlari> stokAlisFiyatlari =
        mapData.map((e) => StokAlisFiyatlari.fromMap(e)).toList();
    return stokAlisFiyatlari;
  } else {
    return Future.delayed(
      const Duration(milliseconds: 2000),
    );
  }
});
//#endregion

//#region Stok Son Alış Fiyatları
final stokSatisFiyatlariProvider =
    FutureProvider.family<List<StokAlisFiyatlari>, String>(
        (ref, stokKodu) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio
      .post(ConstantProvider.stokSatisFiyatlari, data: {'stokKodu': stokKodu});
  if (result.statusCode == 200) {
    List<Map<String, dynamic>> mapData = List.from(result.data);
    List<StokAlisFiyatlari> stokAlisFiyatlari =
        mapData.map((e) => StokAlisFiyatlari.fromMap(e)).toList();
    return stokAlisFiyatlari;
  } else {
    return Future.delayed(
      const Duration(milliseconds: 2000),
    );
  }
});
//#endregion

//#region Stok Son Alış Fiyatları
final enCokSatilanUrunlerProvider =
    FutureProvider.family<List<EnCokSatilanUrunlerModel>, String>(
        (ref, baslangicTarihi) async {
  final dio = ref.watch(httpClientProvider);
  final result = await dio.post(ConstantProvider.enCokAlinanUrunler,
      data: {'baslangic': baslangicTarihi});
  if (result.statusCode == 200) {
    List<Map<String, dynamic>> mapData = List.from(result.data);
    List<EnCokSatilanUrunlerModel> enCokSatilanUrunler =
        mapData.map((e) => EnCokSatilanUrunlerModel.fromMap(e)).toList();
    return enCokSatilanUrunler;
  } else {
    return Future.delayed(
      const Duration(milliseconds: 2000),
    );
  }
});
//#endregion

//Constructor'a index göndermemek için listview'ın ilk child'ı olarak
//ProviderScope kullanıp stok indeximi diğer sayfada kolayca çağıracağım.

/// OLMADI!
final currentStokIndex = StateProvider<int>((ref) => 0);
