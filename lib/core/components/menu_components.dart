import 'package:flutter/material.dart';
import '../constants/constant.dart';

List dataList = [
  {
    'name': Constants.faturaIslemleri,
    'icon': Icons.payment,
    'subMenu': [
      {
        'name': 'Alış Faturası',
      },
      {
        'name': 'Satış Faturaları',
      },
      {
        'name': 'Bekleyen Faturalar',
      },
      {
        'name': 'Transfer Edilmeyenler',
      },
      {
        'name': 'Transfer Edilenler',
      },
    ]
  },
  {
    'name': Constants.irsaliyeIslemleri,
    'icon': Icons.payment,
    'subMenu': [
      {
        'name': 'Alış İrsaliyesi',
      },
      {
        'name': 'Satış İrsaliyesi',
      },
      {
        'name': 'Bekleyen İrsaliyeler',
      },
      {
        'name': 'Transfer Edilmeyenler',
      },
      {
        'name': 'Transfer Edilenler',
      },
    ]
  },
  {
    'name': Constants.siparisIslemleri,
    'icon': Icons.reorder,
    'subMenu': [
      {
        'name': 'Satış Siparişi',
      },
      {
        'name': 'Alış Siparişi',
      },
      {
        'name': 'Sipariş Onaylama',
      },
      // {
      //   'name': 'Bekleyen Siparişler',
      // },
      // {
      //   'name': 'Sipariş Takibi',
      // },
      // {
      //   'name': 'Transfer Edilenler',
      // },
      // {
      //   'name': 'Transfer Edilmeyenler',
      // },
    ]
  },
  {
    'name': Constants.siparisTeslimati,
    'icon': Icons.delivery_dining,
    'subMenu': [
      {
        'name': 'Sipariş Teslimatı',
      },
      {
        'name': 'Beklemeye Alınanlar',
      },
      {
        'name': 'Transfer Edilmeyenler',
      },
    ]
  },
  {
    'name': Constants.ziyaretIslemleri,
    'icon': Icons.visibility_outlined,
    'subMenu': [
      {
        'name': 'Mevcut Cari Hesap',
      },
      {
        'name': 'Yeni Cari Hesap',
      },
      {
        'name': 'Transfer Edilenler',
      },
      {
        'name': 'Transfer Edilmeyenler',
      },
    ]
  },
  {
    'name': Constants.finansIslemleri,
    'icon': Icons.attach_money_outlined,
    'subMenu': [
      {
        'name': 'Tahsilat',
      },
      {
        'name': 'Ödeme',
      },
      {
        'name': 'Transfer Edilenler',
      },
      {
        'name': 'Transfer Edilmeyenler',
      },
    ]
  },
  {
    'name': Constants.cariIslemler,
    'icon': Icons.account_circle,
    'subMenu': [
      {
        'name': 'Cari Detay',
      },
      {
        'name': 'Cari Tanıtım Kartı',
      },
      {
        'name': 'Cari Grup Tanıtım Kartı',
      },
      {
        'name': 'Cari Sektör Tanıtım Kartı',
      },
    ],
  },
  {
    'name': Constants.stokIslemleri,
    'icon': Icons.production_quantity_limits,
    'subMenu': [
      {
        'name': 'Stok Kart Detay',
      },
      {
        'name': 'Barkod Ekle',
      },
      {
        'name': 'Sayım Fişi',
      },
      {
        'name': 'Depo Fişi',
      },
      {
        'name': 'Transfer Edilmeyen Fişler',
      },
      {
        'name': 'Fiş Listesi',
      },
    ]
  },
  {
    'name': Constants.raporlar,
    'icon': Icons.report,
    'subMenu': [
      {
        'name': 'Cari Raporları',
      },
      {
        'name': 'Stok Raporları',
      },
      {
        'name': 'Sipariş Raporları',
      },
      {
        'name': 'Fatura Raporları',
      },
      {
        'name': 'İrsaliye Raporları',
      },
      {
        'name': 'Gün Sonu',
      },
      {
        'name': 'Diğer',
      },
      {
        'name': 'Rapor Yedekle/İndir',
      },
    ]
  },
  {
    'name': Constants.dovizKurlari,
    'icon': Icons.money,
  },
  {
    'name': Constants.sirketDegistir,
    'icon': Icons.change_circle,
  },
  {
    'name': Constants.veriGuncelleme,
    'icon': Icons.update,
  },
  {
    'name': Constants.ayarlar,
    'icon': Icons.settings,
  },
  {
    'name': Constants.cikis,
    'icon': Icons.settings,
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
