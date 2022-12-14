import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/tabs/yeniSatisSiparisi/bekleyen_siparisler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/tabs/yeniSatisSiparisi/siparis_toplam.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/tabs/yeniSatisSiparisi/siparis_list.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SatisSiparisi extends ConsumerWidget {
  const SatisSiparisi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var orderList = ref.watch(satisSiparisViewModel);
    return DefaultTabController(
      length: 3,
      child: WillPopScope(
        onWillPop: () => _onBackButtonPressed(context, orderList),
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              orderList.alisMi
                  ? Constants.alimSiparisi
                  : Constants.satisSiparisi,
              style: TextStyle(
                  color: Color(MyColors.bg), fontWeight: FontWeight.w600),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            backgroundColor: Color(MyColors.bg01),
            elevation: 0,
            bottom: const TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.add),
                  text: Constants.siparisListesi,
                ),
                Tab(
                  icon: Icon(Icons.restart_alt_outlined),
                  text: Constants.siparisOzeti,
                ),
                Tab(
                  icon: Icon(Icons.done),
                  text: Constants.toplam,
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

  Future<bool> _onBackButtonPressed(
      BuildContext context, SatisSiparisiViewModel model) async {
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
                  model.siparisler.clear();
                  model.kdvsizAraTutar = 0;
                  model.yekunTutar = 0;
                  model.toplamKDV = 0;
                  model.toplamTutar = 0;
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
