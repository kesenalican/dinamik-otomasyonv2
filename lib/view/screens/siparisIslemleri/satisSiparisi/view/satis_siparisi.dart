import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/bekleyenSiparisler/view/bekleyen_siparisler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/tabs/siparis_toplam.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/tabs/yeniSatisSiparisi/siparis_list.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';

class SatisSiparisi extends StatelessWidget {
  const SatisSiparisi({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackButtonPressed(context),
      child: DefaultTabController(
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
                  text: "Sipariş Listesi",
                ),
                Tab(
                  icon: Icon(Icons.restart_alt_outlined),
                  text: "Bekleyen Siparişler",
                ),
                Tab(
                  icon: Icon(Icons.done),
                  text: "Toplam",
                ),
              ],
            ),
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          // ),
          body: TabBarView(
            children: [
              const SiparisListesi(),
              const BekleyenSiparisler(),
              SiparisToplam(),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> _onBackButtonPressed(BuildContext context) async {
    bool? exitFromSiparis = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Dikkat!",
              style: purpleBoldTxtStyle,
            ),
            content: Text(
              "Sipariş işlemleri iptal edilecektir. Çıkmak istiyor musunuz?",
              style: purpleTxtStyle,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  "İptal",
                  style: whiteTxtStyle,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  "Evet",
                  style: whiteTxtStyle,
                ),
              ),
            ],
          );
        });
    return exitFromSiparis ?? false;
  }
}
