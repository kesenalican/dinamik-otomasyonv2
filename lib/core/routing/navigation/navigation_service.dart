import 'package:dinamik_otomasyon/core/routing/not_found_widget.dart';
import 'package:dinamik_otomasyon/core/routing/route_constants.dart';
import 'package:dinamik_otomasyon/view/screens/anasayfa/view/home_page.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/view/login_view.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/cari_detay.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/cari_kartlar.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/yeniCariKart/cari_adres_list.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/yeniCariKart/yeni_cari_adres.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/yeniCariKart/yeni_cari_kart.dart';
import 'package:dinamik_otomasyon/view/screens/faturaIslemleri/satisFaturasi/satis_faturasi.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/alisSiparisi/view/alim_siparisi.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/satis_siparisi.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/son_alis_fiyatlari.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/son_satis_fiyatlari.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/stok_detay.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/stok_karti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic>? _createRoute(Widget goto, RouteSettings settings) {
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => goto,
      );
    } else if (defaultTargetPlatform == TargetPlatform.android) {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => goto,
      );
    } else {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => goto,
      );
    }
  }

  static Route<dynamic>? routeGenerator(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.home:
        return _createRoute(
            HomePage(sirketAdi: settings.arguments.toString()), settings);
      case RouteConstants.login:
        return _createRoute(const Login(), settings);
      case RouteConstants.stockList:
        return _createRoute(StokKartlari(), settings);
      case RouteConstants.stockDetail:
        return _createRoute(
            StokDetay(stokModel: settings.arguments as Stoklar), settings);
      case RouteConstants.cariKartlar:
        return _createRoute(CariKartlar(), settings);
      case RouteConstants.yeniCariKart:
        return _createRoute(YeniCariKart(), settings);
      case RouteConstants.cariDetay:
        return _createRoute(
            CariDetay(cariList: settings.arguments as Cariler), settings);
      case RouteConstants.yeniCariAdres:
        return _createRoute(
            YeniCariAdres(
                cariKoduController:
                    settings.arguments as TextEditingController),
            settings);
      case RouteConstants.sonAlisFiyatlari:
        return _createRoute(
            SonAlisFiyatlari(stokModel: settings.arguments as Stoklar),
            settings);
      case RouteConstants.sonSatisFiyatlari:
        return _createRoute(
            SonSatisFiyatlari(stokModel: settings.arguments as Stoklar),
            settings);
      case RouteConstants.cariAdresList:
        return _createRoute(
            CariAdresList(
                cariKoduController: settings.arguments as TextEditingController,
                adresNoController: settings.arguments as TextEditingController),
            settings);
      case RouteConstants.satisSiparisi:
        return _createRoute(const SatisSiparisi(), settings);
      case RouteConstants.alisSiparisi:
        return _createRoute(const AlisSiparisi(), settings);
      case RouteConstants.satisFaturasi:
        return _createRoute(const SatisFaturasi(), settings);

      default:
        return MaterialPageRoute(
            builder: (context) => const NotFoundNavigationWidget());
    }
  }
}
