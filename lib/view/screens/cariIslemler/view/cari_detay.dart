import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/tabs/cari_bakiye.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/tabs/cari_genel.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/tabs/cari_iletisim.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/tabs/cari_islemler.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/tabs/cari_raporlar.dart';
import 'package:flutter/material.dart';
import '../../../styles/colors.dart';

class CariDetay extends StatelessWidget {
  final Cariler cariList;
  const CariDetay({Key? key, required this.cariList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            Constants.CARI_DETAY,
            style: TextStyle(
                color: Color(MyColors.bg), fontWeight: FontWeight.w600),
          ),
          iconTheme: IconThemeData(color: Color(MyColors.bg01), size: 30),
          backgroundColor: Color(MyColors.bg01),
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.info_outline),
                text: Constants.GENEL,
              ),
              Tab(
                icon: Icon(Icons.price_change_rounded),
                text: Constants.ISLEMLER,
              ),
              Tab(
                icon: Icon(Icons.currency_exchange),
                text: Constants.BAKIYE,
              ),
              Tab(
                icon: Icon(Icons.call),
                text: Constants.ILETISIM,
              ),
              Tab(
                icon: Icon(Icons.report_gmailerrorred),
                text: Constants.RAPORLAR,
              ),
              Tab(
                icon: Icon(Icons.auto_graph),
                text: Constants.GRAFIKLER,
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            //Genel Tab
            CariGenelTab(
              cariList: cariList,
            ),
            //Icon(Icons.directions_bike),
            //Islemler Tab
            const CariIslemlerTab(),
            //Bakiye İslemleri
            CariBakiyeTab(
              cariModel: cariList,
            ),
            CariIletisimTab(
              cariler: cariList,
            ),
            const CariRaporlarTab(),
            const Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
