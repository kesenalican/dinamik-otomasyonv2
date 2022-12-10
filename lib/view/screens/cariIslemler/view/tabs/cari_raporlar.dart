import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';


class CariRaporlarTab extends StatelessWidget {
  const CariRaporlarTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            raporListe(raporAdi: 'Cari Hesap Ekstresi'),
            raporListe(raporAdi: 'Stoklu Cari Hesap Ekstresi'),
            raporListe(raporAdi: 'Siparişler'),
            raporListe(raporAdi: 'Faturalar'),
            raporListe(raporAdi: 'İrsaliyeler'),
            raporListe(raporAdi: 'Cari Hareket Listesi'),
            raporListe(raporAdi: 'Yapılacak Tahsilatlar'),
            raporListe(raporAdi: 'Yapılacak Ödemeler'),
            raporListe(raporAdi: 'Müşteri Çek Listesi'),
            raporListe(raporAdi: 'Müşteri Senet Listesi'),
            raporListe(raporAdi: 'En Çok Tercih Edilen Ürünler(Satış)'),
            raporListe(raporAdi: 'En Çok Tercih Edilen Ürünler(Alış)'),
          ],
        ),
      ),
    );
  }

  Widget raporListe({String? raporAdi}) {
    return GestureDetector(
      onTap: () {},
      child: Container(
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
                    Icons.auto_graph,
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
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
            Row(
              children: [
                Icon(
                  Icons.navigate_next,
                  color: Color(MyColors.bg01),
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
