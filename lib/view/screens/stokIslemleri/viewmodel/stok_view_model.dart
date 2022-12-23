import 'package:dinamik_otomasyon/core/constants/api_constant.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StokViewModel extends ChangeNotifier {
  double? brutFiyat;
  double? netFiyat;
  List<Stoklar>? stokModel;
  late List<Stoklar> searchedStok = [];

  void fiyatlariKaydet(double brut, double net) {
    brutFiyat = brut;
    netFiyat = net;
    notifyListeners();
  }

  Future<List<Stoklar>> getStockWithBarcode(String barcode, context) async {
    final result = await Dio().get(
        '${ConstantProvider.baseUrl}${ConstantProvider.scanBarcode}',
        queryParameters: {'barcode': barcode});
    if (result.statusCode == 200) {
      List<Map<String, dynamic>> mapData = List.from(result.data);
      List<Stoklar> stoklist = mapData.map((e) => Stoklar.fromMap(e)).toList();
      stokModel = stoklist;
    }
    return stokModel!;
  }

  searchStok(int offset, String stokKodu, String stokIsmi) async {
    final map = {
      'offset': offset,
      'stokKodu': stokKodu,
      'stokIsmi': stokIsmi,
    };
    final result = await Dio().get(
        '${ConstantProvider.baseUrl}${ConstantProvider.searchStok}',
        queryParameters: map);
    if (result.statusCode == 200) {
      List<Map<String, dynamic>> mapData = List.from(result.data);
      List<Stoklar> stokList = mapData.map((e) => Stoklar.fromMap(e)).toList();
      searchedStok = stokList
          .where((element) =>
              element.stokKodu.toLowerCase().contains(stokKodu.toLowerCase()) ||
              element.stokIsim.toLowerCase().contains(stokIsmi.toLowerCase()))
          .toList();
      notifyListeners();
      return searchedStok;
    }
  }
}

final stokViewModelProvider = ChangeNotifierProvider((ref) => StokViewModel());
