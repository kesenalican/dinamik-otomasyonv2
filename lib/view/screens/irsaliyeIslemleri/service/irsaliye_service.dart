import 'package:dinamik_otomasyon/core/base/service/base_provider.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
