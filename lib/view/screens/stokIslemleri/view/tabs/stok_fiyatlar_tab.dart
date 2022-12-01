import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/viewmodel/stok_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class FiyatlarTab extends ConsumerWidget {
  Stoklar stokModel;
  double? kdvsizFiyat;
  // ignore: prefer_typing_uninitialized_variables
  var netFiyat;
  // ignore: prefer_typing_uninitialized_variables
  var brutFiyat;

  FiyatlarTab({Key? key, required this.stokModel}) : super(key: key);
  truncateDoublePrice(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 2);
  }

  kdvsizFiyatBul() {
    brutFiyat = truncateDoublePrice(stokModel.stokFiyat);
    if (stokModel.perakendeVergiYuzde == 1) {
      var kdvCarpani = "1.0${stokModel.perakendeVergiYuzde.ceil()}";
      kdvsizFiyat = stokModel.stokFiyat / double.parse(kdvCarpani);
      netFiyat = kdvsizFiyat!.toStringAsFixed(
          kdvsizFiyat!.truncateToDouble() == kdvsizFiyat ? 0 : 2);
      return netFiyat;
    } else if (stokModel.perakendeVergiYuzde == 8) {
      var kdvCarpani = "1.0${stokModel.perakendeVergiYuzde.ceil()}";
      kdvsizFiyat = stokModel.stokFiyat / double.parse(kdvCarpani);
      netFiyat = kdvsizFiyat!.toStringAsFixed(
          kdvsizFiyat!.truncateToDouble() == kdvsizFiyat ? 0 : 2);
    } else if (stokModel.perakendeVergiYuzde == 18) {
      var kdvCarpani = "1.${stokModel.perakendeVergiYuzde.ceil()}";
      kdvsizFiyat = stokModel.stokFiyat / double.parse(kdvCarpani);
      netFiyat = kdvsizFiyat!.toStringAsFixed(
          kdvsizFiyat!.truncateToDouble() == kdvsizFiyat ? 0 : 2);
      return netFiyat;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    kdvsizFiyatBul();
    //TODOS: ViewModel'de bu bilgileri kaydedip çarparken getirmem lazım.
    //  var stokViewModel = ref.watch(stokViewModelProvider);

    // stokViewModel.fiyatlariKaydet(
    //     double.parse(brutFiyat), double.parse(netFiyat));

    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              buildTanimliFiyatlarText(context),
              buildUrunFiyat(context),
            ],
          ),
          SizedBox(
            height: context.dynamicHeight * 0.01,
          ),
          Column(
            children: [
              buildSonSatisFiyatButton(context),
              buildSonAlisFiyatButton(context),
            ],
          ),
        ],
      ),
    );
  }

  GestureDetector buildSonAlisFiyatButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/sonAlisFiyatlari', arguments: stokModel);
      },
      child: Container(
        margin: context.paddingTextField,
        padding: context.paddingDefault,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(MyColors.bg01),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            Constants.SON_ALIS_FIYATLARI,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector buildSonSatisFiyatButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/sonSatisFiyatlari',
            arguments: stokModel);
      },
      child: Container(
        margin: context.paddingTextField,
        padding: context.paddingDefault,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(MyColors.bg01),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            Constants.SON_SATIS_FIYATLARI,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }

  Container buildUrunFiyat(
    BuildContext context,
  ) {
    return Container(
      width: double.infinity,
      margin: context.paddingTextField,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(MyColors.bg01),
        ),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: context.paddingDefault,
                child: Text(Constants.SATIS_FIYATI, style: purpleBoldTxtStyle),
              ),
              Padding(
                padding: context.paddingDefault,
                child: Text(
                  stokModel.perakendeVergiIsim,
                  style: purpleTxtStyle,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(context.dynamicHeight * 0.01),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Kdv'li Adet Fiyatı: ",
                        style: purpleTxtStyle,
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "${brutFiyat.toString()} ${stokModel.stokKur!}",
                        style: purpleTxtStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: context.paddingDefault,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Kdv'siz Adet Fiyatı:",
                            style: purpleTxtStyle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "${netFiyat.toString()} ${stokModel.stokKur}",
                            style: purpleTxtStyle,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildTanimliFiyatlarText(BuildContext context) {
    return Container(
      margin: context.paddingDefault,
      padding: context.paddingDefault,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(MyColors.bg02),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          Constants.TANIMLI_FIYATLAR,
          style: TextStyle(
            color: Color(MyColors.bg01),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
