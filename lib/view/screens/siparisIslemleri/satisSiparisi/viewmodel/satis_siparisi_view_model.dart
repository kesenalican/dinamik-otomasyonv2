import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/siparisler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/stok_cari_bilgileri.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/service/satis_siparisi_service.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SatisSiparisiViewModel extends ChangeNotifier {
  SatisSiparisiService service = SatisSiparisiService();
  Cariler? savedCari;
  Stoklar? savedStok;
  List<StokCariBilgileri> siparisler = [];
  int? listLength;
  Siparisler? siparis;
  int? siparisMiktari;
  double toplamTutar = 0;
  int satirNo = 0;

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

  seriNoControl({String? seriNo}) async {
    await service.getEvrakBilgileri(seriNo!);
    listLength = service.seriNoElemanSayisi;
    notifyListeners();
  }

  saveCariForSiparis(Cariler cari) {
    savedCari = cari;
    notifyListeners();
  }

  saveStokForSiparis(Stoklar stok) {
    savedStok = stok;
    notifyListeners();
  }

  saveStokBilgileri(
      TextEditingController miktar, TextEditingController toplam) {
    siparisMiktari = int.parse(miktar.text);
    toplamTutar = double.parse(toplam.text);
    notifyListeners();
  }

  validateMiktar(String value) {
    if (value.isNotEmpty) {
      int myValue = int.parse(value);
      if (myValue <= 0) {
        return 'Miktar 0 olamaz!';
      }
    } else {
      return 'Lütfen Miktar Giriniz!';
    }
  }

  addItemToSiparisList(StokCariBilgileri siparis) {
    siparisler.add(siparis);
    print(toplamTutar);
    satirNo++;
    return siparisler;
  }

  saveDocumentInfosForSiparis() {}
}

final satisSiparisViewModel =
    ChangeNotifierProvider((ref) => SatisSiparisiViewModel());
