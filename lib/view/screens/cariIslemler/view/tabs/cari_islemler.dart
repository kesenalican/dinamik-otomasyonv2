import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CariIslemlerTab extends ConsumerWidget {
  final Cariler carimodel;
  const CariIslemlerTab({Key? key, required this.carimodel}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var satisSiparisiCarisi = ref.watch(satisSiparisViewModel);
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            islemList(raporAdi: 'Satış Faturası', icon: Icons.receipt_long),
            islemList(raporAdi: 'Alış Faturası', icon: Icons.call_received),
            InkWell(
              onTap: () {
                Navigator.pushNamed<dynamic>(context, '/stockList',
                    arguments: true);
                satisSiparisiCarisi.saveCariForSiparis(carimodel);
                satisSiparisiCarisi.alisMi = false;
              },
              child: islemList(
                  raporAdi: 'Satış Siparişi', icon: Icons.account_tree_sharp),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed<dynamic>(context, '/stockList',
                    arguments: true);
                satisSiparisiCarisi.saveCariForSiparis(carimodel);
                satisSiparisiCarisi.alisMi = true;
              },
              child: islemList(raporAdi: 'Alış Siparişi'),
            ),
            islemList(raporAdi: 'Satış Teklifi'),
            islemList(raporAdi: 'Alım Teklifi'),
            islemList(raporAdi: 'Satış İrsaliyesi'),
            islemList(raporAdi: 'Alım İrsaliyesi'),
            islemList(raporAdi: 'Ziyaret'),
            islemList(raporAdi: 'Tahsilat'),
            islemList(raporAdi: 'Ödeme'),
          ],
        ),
      ),
    );
  }

  Widget islemList({String? raporAdi, IconData? icon}) {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Color(MyColors.bg03),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(MyColors.bg01))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Icon(
                  icon,
                  color: Color(MyColors.bg01),
                  size: 20,
                ),
              ),
              Text(
                raporAdi!,
                style: TextStyle(
                  color: Color(MyColors.bg01),
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.navigate_next,
                color: Color(MyColors.bg01),
                size: 30,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
