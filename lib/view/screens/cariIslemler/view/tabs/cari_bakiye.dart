import 'package:dinamik_otomasyon/View/styles/styles.dart';
import 'package:dinamik_otomasyon/core/base/state/base_state.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';

// ignore: must_be_immutable
class CariBakiyeTab extends StatefulWidget {
  Cariler cariModel;
  CariBakiyeTab({Key? key, required this.cariModel}) : super(key: key);

  @override
  State<CariBakiyeTab> createState() => _CariBakiyeTabState();
}

class _CariBakiyeTabState extends BaseState<CariBakiyeTab> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(dynamicHeight(0.015)),
        padding: EdgeInsets.all(dynamicHeight(0.015)),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(MyColors.bg),
          border: Border.all(color: Color(MyColors.bg01)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            buildTeminatRiskBilgileri(),
            // Açık Hesap Bakiyesi
            buildAcikHesapBakiye(context),
            //Müşteri Çeki (Kendisi)
            buildMusteriCeki(context),
            //Faturalaşmamış İrsaliye Bakiyesi
            buildFaturalasmamisIrsaliyeBakiyesi(context),
            //Sipariş Bakiyesi
            buildSiparisBakiyesi(context),
            SizedBox(
              height: dynamicHeight(0.1),
            ),
            //Teminatı
            buildTeminati(context),
          ],
        ),
      ),
    );
  }

  Container buildTeminati(context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(MyColors.bg01),
        border: Border.all(color: Color(MyColors.bg)),
      ),
      child: Column(
        children: [
          Padding(
            padding: paddingDefault,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    Constants.teminati,
                    style: whiteTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    ':',
                    style: whiteTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '10.000,00',
                    style: whiteTxtStyle,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: paddingDefault,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    Constants.riskLimiti,
                    style: whiteTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    ':',
                    style: whiteTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '604.000,00',
                    style: whiteTxtStyle,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: paddingDefault,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 7,
                  child: Text(
                    Constants.toplamRiski,
                    style: whiteTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    ':',
                    style: whiteTxtStyle,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Text(
                    '-594.000,00',
                    style: whiteTxtStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding buildSiparisBakiyesi(context) {
    return Padding(
      padding: paddingDefault,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Text(
              Constants.siparisBakiyesi,
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ':',
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              '60.000,00',
              style: purpleTxtStyle,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildFaturalasmamisIrsaliyeBakiyesi(context) {
    return Padding(
      padding: paddingDefault,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Text(
              Constants.faturalasmamisIrsaliyeBakiyesi,
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ':',
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              '57.541,41',
              style: purpleTxtStyle,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildMusteriCeki(context) {
    return Padding(
      padding: paddingDefault,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 7,
            child: Text(
              Constants.musteriCeki,
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ':',
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              '5.000,00',
              style: purpleTxtStyle,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildAcikHesapBakiye(context) {
    return Padding(
      padding: paddingDefault,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 7,
            child: Text(
              Constants.acikHesapBakiye,
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              ':',
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              '410.325,00',
              style: purpleTxtStyle,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildTeminatRiskBilgileri() {
    return Padding(
      padding: paddingDefault,
      child: Text(
        Constants.teminatRiskBilgileri,
        style: purpleBoldTxtStyle,
      ),
    );
  }
}
