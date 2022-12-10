import 'package:dinamik_otomasyon/View/styles/colors.dart';
import 'package:dinamik_otomasyon/core/base/state/base_state.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/reports/en_cok_satilan_urunler.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/reports/urun_hangi_depoda.dart';
import 'package:flutter/material.dart';

class RaporlarTab extends StatefulWidget {
  final Stoklar stokModel;
  const RaporlarTab({Key? key, required this.stokModel}) : super(key: key);

  @override
  State<RaporlarTab> createState() => _RaporlarTabState();
}

class _RaporlarTabState extends BaseState<RaporlarTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: dynamicHeight(1),
        margin: EdgeInsets.symmetric(
            horizontal: dynamicWidth(0.02), vertical: dynamicHeight(0.001)),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: raporListe(
                    raporAdi: Constants.DEPODA_HANGI_URUNLER_MEVCUT)),
            Expanded(
                flex: 1,
                child: raporListe(
                    raporAdi: Constants.URUN_HANGI_DEPODA,
                    hangiSayfa: UrunHangiDepoda(
                      stokModel: widget.stokModel,
                    ))),
            Expanded(
                flex: 1,
                child:
                    raporListe(raporAdi: Constants.SATISI_YAPILMAYAN_URUNLER)),
            Expanded(
                flex: 1,
                child: raporListe(
                    raporAdi: Constants.EN_COK_SATILAN_URUNLER,
                    hangiSayfa: const EnCokSatilanUrunler())),
            Expanded(
                flex: 1,
                child: raporListe(raporAdi: Constants.EN_COK_ALINAN_URUNLER)),
          ],
        ),
      ),
    );
  }

  Widget raporListe({String? raporAdi, Widget? hangiSayfa}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => hangiSayfa!));
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.02)),
        margin: paddingDefault,
        decoration: BoxDecoration(
            color: Color(MyColors.bg03),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(MyColors.bg01))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.auto_graph,
                  color: Color(MyColors.bg01),
                  size: 30,
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
                  Icons.star_border_purple500_sharp,
                  color: Color(MyColors.bg01),
                  size: 30,
                ),
                Icon(
                  Icons.navigate_next,
                  color: Color(MyColors.bg01),
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
