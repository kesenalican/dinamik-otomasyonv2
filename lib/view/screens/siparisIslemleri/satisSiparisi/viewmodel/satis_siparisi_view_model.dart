import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SatisSiparisiViewModel extends ChangeNotifier {
  calculateTotalPrice(String? value, TextEditingController birimFiyatcontroller,
      TextEditingController sipTutariController) {
    if (value!.isNotEmpty) {
      var miktar = double.parse(value);
      var fiyat = double.parse(birimFiyatcontroller.text);
      var toplam = miktar * fiyat;
      sipTutariController.text = toplam.toString();
      notifyListeners();
    }
  }

  calculateTotalPriceWithDiscount(
      BuildContext context,
      String? value,
      TextEditingController isk1Controller,
      TextEditingController sipTutariController) {
    if (value!.isNotEmpty) {
      isk1Controller.text = value;
      double iskonto1 = double.parse(isk1Controller.text);
      double tutar = double.parse(sipTutariController.text);
      double indirimliFiyat = tutar - ((tutar * iskonto1) / 100);
      sipTutariController.text = indirimliFiyat.toString();
      notifyListeners();
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        return showAlertDialog(
          context: context,
          hataBaslik: "Uyarı",
          hataIcerik: "Önce Stok Seçiniz!",
        );
      });
    }
  }
}

final satisSiparisViewModel =
    ChangeNotifierProvider((ref) => SatisSiparisiViewModel());
