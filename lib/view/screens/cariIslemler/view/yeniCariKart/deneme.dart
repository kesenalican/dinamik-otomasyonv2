import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_adres_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/service/cari_services.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DEneme extends ConsumerWidget {
  const DEneme({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var list = ref.watch(cariAdresProvider('005'));
    return Scaffold(
      appBar: CommonAppbar(whichPage: 'deneme'),
      body: SimpleDialog(
        title: Text(
          'Cari Adres Kartlar',
          style: purpleTxtStyle,
        ),
        children: [
          list.when(
              data: (data) {
                List<CariAdresModel> carliList = data.map((e) => e).toList();
                return SizedBox(
                  height: context.dynamicHeight * 0.4,
                  width: context.dynamicWidth * 0.4,
                  child: ListView.builder(
                    itemCount: carliList.length,
                    itemBuilder: (context, index) {
                      return SimpleDialogOption(
                        child: Text(carliList[index].adrIl),
                      );
                    },
                  ),
                );
              },
              error: (err, stack) => showAlertDialog(
                  context: context, hataBaslik: '', hataIcerik: ''),
              loading: () => const CommonLoading()),
        ],
      ),
    );
  }
}
