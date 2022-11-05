import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/son_satis_fiyatlari.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/son_alis_fiyatlari.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';

class FiyatlarTab extends ConsumerWidget {
  Stoklar stokModel;

  FiyatlarTab({Key? key, required this.stokModel}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => SonAlisFiyatlari(
                      stokModel: stokModel,
                    )));
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
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => SonSatisFiyatlari(
                      stokModel: stokModel,
                    )));
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

  Container buildUrunFiyat(BuildContext context) {
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
          Row(
            children: [
              Padding(
                padding: context.paddingDefault,
                child: const Text(
                  "Liste No: 1",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: context.paddingDefault,
                child: const Text(
                  Constants.SATIS_FIYATI,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(context.dynamicHeight * 0.01),
                child: Text(Constants.FIYAT +
                    stokModel.stokFiyat.toString() +
                    Constants.TURK_LIRASI),
              ),
              Padding(
                padding: context.paddingDefault,
                child: Text("  1 Adet Fiyatı"),
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
