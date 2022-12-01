import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StokViewModel extends ChangeNotifier {
  double? brutFiyat;
  double? netFiyat;

  fiyatlariKaydet(double brut, double net) {
    brutFiyat = brut;
    netFiyat = net;
    notifyListeners();
  }
}

final stokViewModelProvider = ChangeNotifierProvider((ref) => StokViewModel());
