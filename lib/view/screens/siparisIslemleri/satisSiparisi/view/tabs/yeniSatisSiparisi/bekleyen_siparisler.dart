import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BekleyenSiparisler extends ConsumerWidget {
  const BekleyenSiparisler({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var siparisModel = ref.watch(satisSiparisViewModel);
    var araToplam =
        siparisModel.yekunTutar * siparisModel.savedStok!.perakendeVergiYuzde;
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(context.dynamicHeight * 0.015),
        padding: EdgeInsets.all(context.dynamicWidth * 0.015),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(MyColors.bg),
          border: Border.all(color: Color(MyColors.bg01)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            buildSiparisOzetiBaslik(context),
            buildAraToplam(context, siparisModel),
            buildIskonto(context, siparisModel),
            buildMasraf(context),
            buildKdv(context, siparisModel),
            buildOtv(context),
            buildYekun(context, siparisModel),
            buildToplamSatir(context, siparisModel),
          ],
        ),
      ),
    );
  }

  Padding buildSiparisOzetiBaslik(BuildContext context) {
    return Padding(
      padding: context.paddingDefault,
      child: Text(
        Constants.siparisOzeti,
        style: purpleBoldTxtStyle,
      ),
    );
  }

  Padding buildAraToplam(BuildContext context, SatisSiparisiViewModel model) {
    return Padding(
      padding: context.paddingDefault,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              Constants.araToplam,
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              ":",
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              model.kdvsizAraTutar.toStringAsFixed(2),
              style: purpleTxtStyle.copyWith(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildIskonto(BuildContext context, SatisSiparisiViewModel model) {
    return Padding(
      padding: context.paddingDefault,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              Constants.iskonto,
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              ":",
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              model.toplamIsk.toStringAsFixed(2),
              style: purpleTxtStyle.copyWith(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildMasraf(BuildContext context) {
    return Padding(
      padding: context.paddingDefault,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              Constants.masraf,
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              ":",
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              "0,00 ",
              style: purpleTxtStyle.copyWith(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildKdv(BuildContext context, SatisSiparisiViewModel model) {
    return Padding(
      padding: context.paddingDefault,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              Constants.kdv,
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              ":",
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              model.toplamIndirimliKdv == 0
                  ? model.toplamKDV.toStringAsFixed(2)
                  : model.toplamIndirimliKdv.toStringAsFixed(2),
              style: purpleTxtStyle.copyWith(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildOtv(BuildContext context) {
    return Padding(
      padding: context.paddingDefault,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              Constants.otv,
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              ":",
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              "0,00 ",
              style: purpleTxtStyle.copyWith(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildYekun(BuildContext context, SatisSiparisiViewModel model) {
    return Padding(
      padding: context.paddingDefault,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              Constants.yekun,
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              ":",
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              model.indirimliYekunTutar == 0
                  ? model.yekunTutar.toStringAsFixed(2)
                  : model.indirimliYekunTutar.toStringAsFixed(2),
              style: purpleTxtStyle.copyWith(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }

  Padding buildToplamSatir(BuildContext context, SatisSiparisiViewModel model) {
    return Padding(
      padding: context.paddingDefault,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: Text(
              Constants.siparisToplamSatiri,
              style: purpleTxtStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              ":",
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              "${model.siparisler.length} Adet ",
              style: purpleTxtStyle.copyWith(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
