import 'package:flutter/material.dart';
import '../constants/constant.dart';

List dataList = [
  {
    "name": Constants.FATURA_ISLEMLERI,
    "icon": Icons.payment,
    "subMenu": [
      {
        "name": "Alış Faturası",
      },
      {
        "name": "Satış Faturaları",
      },
      {
        "name": "Bekleyen Faturalar",
      },
      {
        "name": "Transfer Edilmeyenler",
      },
      {
        "name": "Transfer Edilenler",
      },
    ]
  },
  {
    "name": Constants.IRSALIYE_ISLEMLERI,
    "icon": Icons.payment,
    "subMenu": [
      {
        "name": "Alış İrsaliyesi",
      },
      {
        "name": "Satış İrsaliyesi",
      },
      {
        "name": "Bekleyen İrsaliyeler",
      },
      {
        "name": "Transfer Edilmeyenler",
      },
      {
        "name": "Transfer Edilenler",
      },
    ]
  },
  {
    "name": Constants.SIPARIS_ISLEMLERI,
    "icon": Icons.reorder,
    "subMenu": [
      {
        "name": "Satış Siparişi",
      },
      {
        "name": "Alım Siparişi",
      },
      {
        "name": "Sipariş Onaylama",
      },
      {
        "name": "Bekleyen Siparişler",
      },
      {
        "name": "Sipariş Takibi",
      },
      {
        "name": "Transfer Edilenler",
      },
      {
        "name": "Transfer Edilmeyenler",
      },
    ]
  },
  {
    "name": Constants.SIPARIS_TESLIMATI,
    "icon": Icons.delivery_dining,
    "subMenu": [
      {
        "name": "Sipariş Teslimatı",
      },
      {
        "name": "Beklemeye Alınanlar",
      },
      {
        "name": "Transfer Edilmeyenler",
      },
    ]
  },
  {
    "name": Constants.ZIYARET_ISLEMLERI,
    "icon": Icons.visibility_outlined,
    "subMenu": [
      {
        "name": "Mevcut Cari Hesap",
      },
      {
        "name": "Yeni Cari Hesap",
      },
      {
        "name": "Transfer Edilenler",
      },
      {
        "name": "Transfer Edilmeyenler",
      },
    ]
  },
  {
    "name": Constants.FINANS_ISLEMLERI,
    "icon": Icons.attach_money_outlined,
    "subMenu": [
      {
        "name": "Tahsilat",
      },
      {
        "name": "Ödeme",
      },
      {
        "name": "Transfer Edilenler",
      },
      {
        "name": "Transfer Edilmeyenler",
      },
    ]
  },
  {
    "name": Constants.CARI_ISLEMLER,
    "icon": Icons.account_circle,
    "subMenu": [
      {
        "name": "Cari Detay",
      },
      {
        "name": "Cari Tanıtım Kartı",
      },
      {
        "name": "Cari Grup Tanıtım Kartı",
      },
      {
        "name": "Cari Sektör Tanıtım Kartı",
      },
    ],
  },
  {
    "name": Constants.STOK_ISLEMLERI,
    "icon": Icons.production_quantity_limits,
    "subMenu": [
      {
        "name": "Stok Kart Detay",
      },
      {
        "name": "Barkod Ekle",
      },
      {
        "name": "Sayım Fişi",
      },
      {
        "name": "Depo Fişi",
      },
      {
        "name": "Transfer Edilmeyen Fişler",
      },
      {
        "name": "Fiş Listesi",
      },
    ]
  },
  {
    "name": Constants.RAPORLAR,
    "icon": Icons.report,
    "subMenu": [
      {
        "name": "Cari Raporları",
      },
      {
        "name": "Stok Raporları",
      },
      {
        "name": "Sipariş Raporları",
      },
      {
        "name": "Fatura Raporları",
      },
      {
        "name": "İrsaliye Raporları",
      },
      {
        "name": "Gün Sonu",
      },
      {
        "name": "Diğer",
      },
      {
        "name": "Rapor Yedekle/İndir",
      },
    ]
  },
  {
    "name": Constants.DOVIZ_KURLARI,
    "icon": Icons.money,
  },
  {
    "name": Constants.SIRKET_DEGISTIR,
    "icon": Icons.change_circle,
  },
  {
    "name": Constants.VERI_GUNCELLEME,
    "icon": Icons.update,
  },
  {
    "name": Constants.AYARLAR,
    "icon": Icons.settings,
  },
  {
    "name": Constants.CIKIS,
    "icon": Icons.settings,
  },
];

class Menu {
  String? name;
  IconData? icon;
  List<Menu>? subMenu = [];

  Menu({this.name, this.subMenu, this.icon});

  Menu.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    icon = json['icon'];
    if (json['subMenu'] != null) {
      subMenu!.clear();
      json['subMenu'].forEach((v) {
        subMenu?.add(Menu.fromJson(v));
      });
    }
  }
}
