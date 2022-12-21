import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/model/stoklar_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UrunHangiDepoda extends HookConsumerWidget {
  final Stoklar stokModel;
  const UrunHangiDepoda({
    super.key,
    required this.stokModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: CommonAppbar(
        whichPage: 'Rapor Parametreleri',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStokFilter(context, stokModel.stokKodu),
            SizedBox(
              height: context.dynamicHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                _buildEmailButton(),
                SizedBox(
                  width: context.dynamicWidth * 0.02,
                ),
                _buildGoruntuleButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Column _buildGoruntuleButton() {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(MyColors.bg01),
          child: const Icon(
            Icons.document_scanner,
          ),
        ),
        Text(
          'Görüntüle',
          style: purpleTxtStyle,
        ),
      ],
    );
  }

  Column _buildEmailButton() {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Color(MyColors.bg01),
          child: const Icon(
            Icons.email,
          ),
        ),
        Text(
          'E-mail',
          style: purpleTxtStyle,
        ),
      ],
    );
  }

  Container _buildStokFilter(BuildContext context, String stokKodu) {
    return Container(
      margin: context.paddingDefault * 1.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Color(MyColors.bg),
        ),
      ),
      child: Card(
        elevation: 10,
        color: Color(MyColors.bg),
        child: Row(
          children: [
            SizedBox(
              width: context.dynamicWidth * 0.04,
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Constants.stokKodu,
                    style: purpleTxtStyle,
                  ),
                  SizedBox(
                    height: context.dynamicHeight * 0.04,
                  ),
                  Text(
                    Constants.stokIsim,
                    style: purpleTxtStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ':',
                    style: purpleTxtStyle,
                  ),
                  SizedBox(
                    height: context.dynamicHeight * 0.04,
                  ),
                  Text(
                    ':',
                    style: purpleTxtStyle,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: context.dynamicWidth * 0.01,
                    vertical: context.dynamicHeight * 0.01),
                child: Column(
                  children: [
                    Text(
                      stokKodu,
                      style: purpleTxtStyle,
                    ),
                    SizedBox(
                      height: context.dynamicHeight * 0.05,
                    ),
                    Text(
                      stokModel.stokIsim,
                      style: purpleTxtStyle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
