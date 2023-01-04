import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/screens/irsaliyeIslemleri/view/tabs/irsaliye_urun_listesi.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';

class Irsaliye extends StatelessWidget {
  const Irsaliye({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: WillPopScope(
        onWillPop: () => _onBackButtonPressed(context),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'Satış İrsaliyesi',
              style: TextStyle(
                color: Color(MyColors.bg),
                fontWeight: FontWeight.w600,
              ),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Color(MyColors.bg01),
            elevation: 0,
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.add),
                text: Constants.urunListesi,
              ),
              Tab(
                icon: Icon(Icons.restart_alt_outlined),
                text: Constants.irsaliyeOzeti,
              ),
              Tab(
                icon: Icon(Icons.done),
                text: Constants.toplam,
              ),
            ]),
          ),
          body: const TabBarView(
            children:  [
              IrsaliyeUrunListesi(),
              IrsaliyeUrunListesi(),
              IrsaliyeUrunListesi(),
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
              Constants.dikkat,
              style: purpleBoldTxtStyle,
            ),
            content: Text(
              Constants.iptalMesaji,
              style: purpleTxtStyle,
            ),
            actions: [
              TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(MyColors.bg01))),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  Constants.iptal,
                  style: whiteTxtStyle,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Color(MyColors.bg01))),
                onPressed: () {
                  Navigator.of(context).pop(true);
                  // model.siparisler.clear();
                  // model.kdvsizAraTutar = 0;
                  // model.yekunTutar = 0;
                  // model.toplamKDV = 0;
                  // model.toplamTutar = 0;
                },
                child: Text(
                  Constants.evet,
                  style: whiteTxtStyle,
                ),
              ),
            ],
          );
        });
    return exitFromSiparis ?? false;
  }
}
