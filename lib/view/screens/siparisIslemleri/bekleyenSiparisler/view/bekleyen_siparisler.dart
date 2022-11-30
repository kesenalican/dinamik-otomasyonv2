import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BekleyenSiparisler extends ConsumerWidget {
  const BekleyenSiparisler({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var siparisModel = ref.watch(satisSiparisViewModel);
    return SingleChildScrollView(
        child: SizedBox(
      height: context.dynamicHeight * 0.7,
      child: Column(
        children: [
          Text(siparisModel.savedStok!.stokKodu),
          Text(siparisModel.savedStok!.stokIsim),
          Text(siparisModel.siparisMiktari.toString()),
          Text(siparisModel.toplamTutar.toString()),
        ],
      ),
    ));
  }
}
