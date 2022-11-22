import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/bekleyenSiparisler/view/bekleyen_siparisler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/tabs/yeniSatisSiparisi/yeni_satis_siparisi.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';

class SatisSiparisi extends StatelessWidget {
  const SatisSiparisi({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            Constants.satisSiparisi,
            style: TextStyle(
                color: Color(MyColors.bg), fontWeight: FontWeight.w600),
          ),
          iconTheme: IconThemeData(color: Color(MyColors.bg01)),
          backgroundColor: Color(MyColors.bg01),
          elevation: 0,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.add),
                text: "Yeni Sipariş",
              ),
              Tab(
                icon: Icon(Icons.restart_alt_outlined),
                text: "Bekleyen Siparişler",
              ),
              Tab(
                icon: Icon(Icons.done),
                text: "Bitmiş Siparişler",
              ),
            ],
          ),
        ),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        // ),
        body: const TabBarView(
          children: [
            YeniSatisSiparisi(),
            BekleyenSiparisler(),
            BekleyenSiparisler(),
          ],
        ),
      ),
    );
  }
}
