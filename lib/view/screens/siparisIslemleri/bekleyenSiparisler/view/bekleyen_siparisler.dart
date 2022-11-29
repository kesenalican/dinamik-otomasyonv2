import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BekleyenSiparisler extends ConsumerWidget {
  const BekleyenSiparisler({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var siparisModel = ref.watch(satisSiparisViewModel);
    var siparisList = siparisModel.siparisler;
    return SingleChildScrollView(
        child: ListView.builder(
      itemCount: siparisModel.siparisler.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Text(siparisList[index].sipStokKod),
            Text(siparisList[index].sipMusteriKod),
            Text(siparisList[index].sipTutar.toString()),
            Text(siparisList[index].sipBFiyat.toString()),
          ],
        );
      },
    ));
  }
}
