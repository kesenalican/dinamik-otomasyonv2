import 'package:dinamik_otomasyon/View/screens/faturaIslemleri/satisFaturasi/tabs/fis_bilgisi.dart';
import 'package:dinamik_otomasyon/View/screens/faturaIslemleri/satisFaturasi/tabs/urun_ara.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors.dart';

class SatisFaturasi extends StatelessWidget {
  const SatisFaturasi({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          leading: BackButton(
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Satış Faturası',
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
                text: 'Fiş Bilgisi',
              ),
              Tab(
                icon: Icon(Icons.search),
                text: 'Ürün Ara',
              ),
              Tab(
                icon: Icon(Icons.list),
                text: 'Liste',
              ),
              Tab(
                icon: Icon(Icons.discount),
                text: 'Toplam',
              ),
            ],
          ),
        ),
        body:  const TabBarView(
          children: [
            FisBilgisiTab(),
            UrunAra(),
            Icon(Icons.directions_bike),
            Icon(Icons.directions_bike),
          ],
        ),
      ),
    );
  }
}
