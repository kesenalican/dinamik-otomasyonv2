import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StokViewModel extends ChangeNotifier {
  double? brutFiyat;
  double? netFiyat;
  List<Stoklar>? stokModel;

  void fiyatlariKaydet(double brut, double net) {
    brutFiyat = brut;
    netFiyat = net;
    notifyListeners();
  }

  Future<List<Stoklar>> getStockWithBarcode(String barcode) async {
    final result = await Dio().get('${ConstantProvider.baseUrl}Stoklar/barcode',
        queryParameters: {'barcode': barcode});
    if (result.statusCode == 200) {
      List<Map<String, dynamic>> mapData = List.from(result.data);
      List<Stoklar> stoklist = mapData.map((e) => Stoklar.fromMap(e)).toList();
      print('gelen stok length == ${stoklist.length}');
      print('gelen stok isim == ${stoklist.first.stokIsim}');
      stokModel = stoklist;
      return stoklist;
    } else {
      return Future.delayed(const Duration(seconds: 1));
    }
  }
}

final stokViewModelProvider = ChangeNotifierProvider((ref) => StokViewModel());
