import 'package:flutter/material.dart';

import '../../../../styles/colors.dart';

class FisBilgisiTab extends StatelessWidget {
  const FisBilgisiTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: SizedBox(
        height: h * 0.8,
        width: double.infinity,
        child: ListView(
          children: [
            fisBilgiSatir(
              context,
              bilgiAdi: 'Cari Kodu',
              cariBilgi: '000333',
            ),
            fisBilgiSatir(
              context,
              bilgiAdi: 'Ünvan',
              cariBilgi: 'Dinamik',
            ),
            fisBilgiSatir(
              context,
              bilgiAdi: 'Adres 1',
              cariBilgi: 'Şehitkamil',
            ),
            fisBilgiSatir(
              context,
              bilgiAdi: 'Adres 2',
              cariBilgi: 'Gaziantep',
            ),
            fisBilgiSatir(
              context,
              bilgiAdi: 'İlçe',
              cariBilgi: 'Şehitkamil',
            ),
            fisBilgiSatir(
              context,
              bilgiAdi: 'İl',
              cariBilgi: 'Gaziantep',
            ),
            fisBilgiSatir(
              context,
              bilgiAdi: 'Ülke',
              cariBilgi: 'Türkiye',
            ),
            fisBilgiSatir(
              context,
              bilgiAdi: 'Vergi Dairesi',
              cariBilgi: 'Kozanlı',
            ),
            fisBilgiSatir(
              context,
              bilgiAdi: 'Vergi/TCK No',
              cariBilgi: '11111111111',
            ),
            fisBilgiSatir(
              context,
              bilgiAdi: 'E-mail',
              cariBilgi: 'dinamik@dinamikotomasyon.com',
            ),
          ],
        ),
      ),
    );
  }

  Widget fisBilgiSatir(context, {String? bilgiAdi, String? cariBilgi}) {
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 10),
        margin: const EdgeInsets.symmetric(horizontal: 2),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(MyColors.bg02),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Color(MyColors.bg01),
          ),
        ),
        child: SizedBox(
          height: h * 0.05,
          child: Row(
            children:  [
              Expanded(flex: 1, child: Text(bilgiAdi!)),
              const Expanded(flex: 1, child: Text(':')),
              Expanded(
                flex: 3,
                child: Text(
                  cariBilgi!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
