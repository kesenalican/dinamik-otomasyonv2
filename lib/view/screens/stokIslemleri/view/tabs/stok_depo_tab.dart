import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/stoklar_model.dart';

class DepoTab extends ConsumerWidget {
  final Stoklar stokModel;
  const DepoTab({Key? key, required this.stokModel}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        _buildStokDepoDagilimText(context.dynamicHeight, context.dynamicWidth),
        _buildUrunDagilim(context.dynamicHeight, context.dynamicWidth),
        //veriyi çekince ayır
        _buildDepo2(context.dynamicHeight, context.dynamicWidth),
      ],
    );
  }

  _buildDepo2(double dynamicHeight, double width) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(dynamicHeight * 0.02),
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
                padding: EdgeInsets.all(dynamicHeight * 0.01),
                child: const Text(
                  'No: 1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(dynamicHeight * 0.01),
                child: const Text(
                  'Depo Adı: Merkez depo',
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
                padding: EdgeInsets.all(dynamicHeight * 0.01),
                child: const Text('Miktar: -461,99'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildUrunDagilim(double dynamicHeight, double width) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(dynamicHeight * 0.02),
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
                padding: EdgeInsets.all(dynamicHeight * 0.01),
                child: const Text(
                  'No: 1',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(dynamicHeight * 0.01),
                child: const Text(
                  '${Constants.depo} Merkez',
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
                padding: EdgeInsets.all(dynamicHeight * 0.01),
                child: Text(
                    //DEPODAKİ TOPLAM ÜRÜN
                    '${Constants.miktar} {stokModel.merkez.ceil()} ${stokModel.stokBirim1}'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildStokDepoDagilimText(double dynamicHeight, double width) {
    return Container(
      margin: EdgeInsets.all(dynamicHeight * 0.01),
      padding: EdgeInsets.all(dynamicHeight * 0.01),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(MyColors.bg02),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          Constants.stokDepoDagilimlari,
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
