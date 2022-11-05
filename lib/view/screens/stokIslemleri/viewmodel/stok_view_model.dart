import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/stoklar_model.dart';

final stokStateNotifierProvider =
    StateNotifierProvider<StokViewModel, List<Stoklar>>(
        (ref) => StokViewModel());

class StokViewModel extends StateNotifier<List<Stoklar>> {
  late final StokService _stokService;

  StokViewModel() : super([]);
  Future<List<Stoklar>> getStoklar() async {
    var userList = await _stokService.getStokLList();
    return userList;
  }
}
