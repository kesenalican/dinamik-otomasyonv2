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
  bool? currentSiparis; // FALSE ise Satış TRUE ise ALIŞ
  Cariler? savedCari;
  Stoklar? savedStok;
  List<StokCariBilgileri> siparisler = [];
  int? listLength;
  Siparisler? siparis;
  int? siparisMiktari;
  double? kdvsizNetFiyat = 0;
  double? kdvsizBrutFiyat = 0;
  double? kdvsizIndirimliNetFiyat = 0;
  double toplamTutar = 0;
  double yekunTutar = 0;
  double indirimliYekunTutar = 0;
  double kdvsizAraTutar = 0;
  double kdvsizIndirimliAraTutar = 0;
  double toplamKDV = 0;
  double toplamIndirimliKdv = 0;
  double toplamIsk = 0;
  double? indirimliNetFiyat = 0;
  List<Stoklar> savedStoklar = [];

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

  setCurrentSiparis(bool hangiSiparis) {
    currentSiparis = hangiSiparis;
  }

  calculateTotalPriceWithDiscount(
    BuildContext context,
    String? value,
    TextEditingController isk1Controller,
    TextEditingController isk2Controller,
    TextEditingController isk3Controller,
    TextEditingController isk4Controller,
    TextEditingController isk5Controller,
    TextEditingController isk6Controller,
  ) {
    if (value!.isNotEmpty) {
      for (int i = 0; i < siparisler.length; i++) {
        if (isk1Controller.text.isNotEmpty) {
          isk1Controller.text = value;
          double iskonto1 = double.parse(isk1Controller.text);
          double tutar = siparisler[i].sipKdvsizTutar;
          indirimliNetFiyat = tutar - ((tutar * iskonto1) / 100);
          siparisler[i].sipKdvsizTutar = indirimliNetFiyat!;
          if (isk2Controller.text.isNotEmpty) {
            isk2Controller.text = value;
            double iskonto2 = double.parse(isk2Controller.text);
            indirimliNetFiyat =
                indirimliNetFiyat! - ((indirimliNetFiyat! * iskonto2) / 100);
            siparisler[i].sipKdvsizTutar = indirimliNetFiyat!;
            if (isk3Controller.text.isNotEmpty) {
              double iskonto3 = double.parse(isk3Controller.text);
              indirimliNetFiyat =
                  indirimliNetFiyat! - ((indirimliNetFiyat! * iskonto3) / 100);
              siparisler[i].sipKdvsizTutar = indirimliNetFiyat!;
            }
            if (isk4Controller.text.isNotEmpty) {
              double iskonto4 = double.parse(isk3Controller.text);
              indirimliNetFiyat =
                  indirimliNetFiyat! - ((indirimliNetFiyat! * iskonto4) / 100);
              siparisler[i].sipKdvsizTutar = indirimliNetFiyat!;
            }
            if (isk5Controller.text.isNotEmpty) {
              double iskonto5 = double.parse(isk3Controller.text);
              indirimliNetFiyat =
                  indirimliNetFiyat! - ((indirimliNetFiyat! * iskonto5) / 100);
              siparisler[i].sipKdvsizTutar = indirimliNetFiyat!;
            }
            if (isk6Controller.text.isNotEmpty) {
              double iskonto6 = double.parse(isk3Controller.text);
              indirimliNetFiyat =
                  indirimliNetFiyat! - ((indirimliNetFiyat! * iskonto6) / 100);
              siparisler[i].sipKdvsizTutar = indirimliNetFiyat!;
            }
          }
          //* Siparis listemin elemanına iskontosunu ekliyorum
          siparisler[i].siparisIskonto = tutar - indirimliNetFiyat!;
          double kdv = indirimliNetFiyat!;
          //* BU KISIMDA SEÇİLİ STOĞUN KDVSİNİ ÜZERİNE EKLİYORUM.
          indirimliNetFiyat = indirimliNetFiyat! *
              ((savedStoklar[i].perakendeVergiYuzde / 100) + 1);
          //*----------- ------
          siparisler[i].siparisKdv = indirimliNetFiyat! - kdv;
          siparisler[i].siparisYekunTutar = indirimliNetFiyat!;
          //* Burada siparis listemdeki elemanın kdvsini topluyorum.
          toplamIndirimliKdv = toplamIndirimliKdv + siparisler[i].siparisKdv!;
          //* Yekun tutarımı önce kdv ekleyip sonra toplayarak buldum.
          toplamIsk = toplamIsk + siparisler[i].siparisIskonto!;
          //* indirimli yekun tutarlarımı ayrı ayrı topluyorum.
          indirimliYekunTutar =
              indirimliYekunTutar + siparisler[i].siparisYekunTutar!;
        }
      }

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
    savedStoklar.add(stok);
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
    if (siparisler.isNotEmpty) {
      yekunTutar = yekunTutar + siparis.sipTutar;
      kdvsizAraTutar = kdvsizAraTutar + siparis.sipKdvsizTutar;
      toplamKDV = yekunTutar - kdvsizAraTutar;
      siparisler.add(siparis);
      return siparisler;
    }
    if (siparisler.isEmpty) {
      yekunTutar = siparis.sipTutar;
      kdvsizAraTutar = siparis.sipKdvsizTutar;
      toplamKDV = yekunTutar - kdvsizAraTutar;
      siparisler.add(siparis);
      return siparisler;
    }

    notifyListeners();
    //  return siparisler;
  }

  // calculateKdvWithDiscount(Stoklar stok) {
  //   // x /100 +1

  //   indirimliNetFiyat =
  //       indirimliNetFiyat! * ((stok.perakendeVergiYuzde / 100) + 1);
  //   return indirimliNetFiyat;
  // }

  calculateKdv() {
    kdvsizNetFiyat =
        savedStok!.stokFiyat / ((savedStok!.perakendeVergiYuzde / 100) + 1);
    return kdvsizNetFiyat;
  }

  deleteItemToSiparisList(StokCariBilgileri siparis) {
    siparisler.remove(siparis);
    kdvsizAraTutar = 0;
    kdvsizNetFiyat = 0;
    toplamKDV = 0;
    yekunTutar = 0;
    notifyListeners();
  }

  saveDocumentInfosForSiparis() {}
}

final satisSiparisViewModel =
    ChangeNotifierProvider((ref) => SatisSiparisiViewModel());
