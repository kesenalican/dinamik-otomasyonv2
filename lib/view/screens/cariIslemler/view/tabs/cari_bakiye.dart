import 'package:dinamik_otomasyon/Model/cari_bakiye.dart';
import 'package:dinamik_otomasyon/View/styles/styles.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/common/bakiye_satiri.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CariBakiyeTab extends ConsumerWidget {
  final Cariler cariModel;
  const CariBakiyeTab({super.key, required this.cariModel});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cariBakiye = ref.watch(cariBakiyeProvider(cariModel.cariKodu));
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(context.dynamicHeight * 0.015),
        padding: EdgeInsets.all(context.dynamicHeight * 0.015),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(MyColors.bg),
          border: Border.all(color: Color(MyColors.bg01)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            cariBakiye.when(
              error: (error, stackTrace) => showAlertDialog(
                  context: context,
                  hataBaslik: 'Hata',
                  hataIcerik: 'Cari bakiyesi getirilirken bir hata oluştu.'),
              loading: () => const CommonLoading(),
              data: (data) {
                List<CariBakiye> cariBakiye = data.map((e) => e).toList();

                return Column(
                  children: [
                    Padding(
                      padding: context.paddingDefault,
                      child: Text(
                        Constants.teminatRiskBilgileri,
                        style: purpleBoldTxtStyle,
                      ),
                    ),
                    Padding(
                      padding: context.paddingDefault,
                      child: BakiyeSatiri(
                        cariBakiye:
                            cariBakiye[0].anaDovizBorc!.toStringAsFixed(2),
                        hangiBorc: 'Ana Döviz Borç',
                      ),
                    ),
                    Padding(
                      padding: context.paddingDefault,
                      child: BakiyeSatiri(
                        cariBakiye:
                            cariBakiye[0].anaDovizAlacak!.toStringAsFixed(2),
                        hangiBorc: 'Ana Döviz Alacak',
                      ),
                    ),
                    Padding(
                      padding: context.paddingDefault,
                      child: BakiyeSatiri(
                        cariBakiye:
                            cariBakiye[0].altDovizBorc!.toStringAsFixed(2),
                        hangiBorc: 'Alt Döviz Borç',
                      ),
                    ),
                    Padding(
                      padding: context.paddingDefault,
                      child: BakiyeSatiri(
                        cariBakiye:
                            cariBakiye[0].altDovizAlacak!.toStringAsFixed(2),
                        hangiBorc: 'Alt Döviz Alacak',
                      ),
                    ),
                    Padding(
                      padding: context.paddingDefault,
                      child: BakiyeSatiri(
                        cariBakiye:
                            cariBakiye[0].orjDovizBorc!.toStringAsFixed(2),
                        hangiBorc: 'Orjinal Döviz Borç',
                      ),
                    ),
                    Padding(
                      padding: context.paddingDefault,
                      child: BakiyeSatiri(
                        cariBakiye:
                            cariBakiye[0].orjDovizAlacak!.toStringAsFixed(2),
                        hangiBorc: 'Orjinal Döviz Alacak',
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
