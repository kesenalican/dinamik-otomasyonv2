import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/siparisler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/stok_cari_bilgileri.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/service/satis_siparisi_service.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/urun_bilgileri_gir.dart';
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
  String kdvsizNetFiyat = "";
  double toplamTutar = 0;
  int satirNo = 0;
  double anaToplamTutar = 0;
  double kdvsizAraTutar = 0;
  double toplamKDV = 0;

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

  saveKdvsizFiyat(double netFiyat) {
    kdvsizAraTutar = kdvsizAraTutar + netFiyat;
    return kdvsizAraTutar;
  }

  saveStokBilgileri(
      TextEditingController miktar, TextEditingController toplam) {
    siparisMiktari = int.parse(miktar.text.replaceAll(',', ''));
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
    anaToplamTutar = anaToplamTutar + siparis.sipTutar;
    kdvsizAraTutar = kdvsizAraTutar + siparis.sipKdvsizFiyat;
    toplamKDV = anaToplamTutar - kdvsizAraTutar;
    siparisler.add(siparis);
    satirNo++;
    notifyListeners();
    return siparisler;
  }

  calculateKdv() {
    if (savedStok!.perakendeVergiYuzde == 1) {
      var kdvCarpani = "1.0${savedStok!.perakendeVergiYuzde.ceil()}";
      var kdvsizFiyat = savedStok!.stokFiyat / double.parse(kdvCarpani);
      kdvsizNetFiyat = kdvsizFiyat.toStringAsFixed(
          kdvsizFiyat.truncateToDouble() == kdvsizFiyat ? 0 : 2);
    } else if (savedStok!.perakendeVergiYuzde == 8) {
      var kdvCarpani = "1.0${savedStok!.perakendeVergiYuzde.ceil()}";
      var kdvsizFiyat = savedStok!.stokFiyat / double.parse(kdvCarpani);
      kdvsizNetFiyat = kdvsizFiyat.toStringAsFixed(
          kdvsizFiyat.truncateToDouble() == kdvsizFiyat ? 0 : 2);
      return kdvsizNetFiyat;
    } else if (savedStok!.perakendeVergiYuzde == 18) {
      var kdvCarpani = "1.${savedStok!.perakendeVergiYuzde.ceil()}";
      var kdvsizFiyat = savedStok!.stokFiyat / double.parse(kdvCarpani);
      kdvsizNetFiyat = kdvsizFiyat.toStringAsFixed(
          kdvsizFiyat.truncateToDouble() == kdvsizFiyat ? 0 : 2);
      return kdvsizNetFiyat;
    }
    return 0;
  }

  deleteItemToSiparisList(StokCariBilgileri siparis) {
    siparisler.remove(siparis);
    notifyListeners();
  }

  saveDocumentInfosForSiparis() {}
}

final satisSiparisViewModel =
    ChangeNotifierProvider((ref) => SatisSiparisiViewModel());
