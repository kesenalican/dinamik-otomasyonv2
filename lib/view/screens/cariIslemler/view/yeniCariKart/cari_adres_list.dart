import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_adres_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/service/cari_services.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CariAdresList extends ConsumerWidget {
  final TextEditingController cariKoduController;
  const CariAdresList({required this.cariKoduController, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var adresList = ref.watch(cariAdresProvider(cariKoduController.text));
    return Scaffold(
        appBar: CommonAppbar(whichPage: "Adresler"),
        floatingActionButton: FloatingActionButton(
          elevation: 3,
          backgroundColor: Color(
            MyColors.bg01,
          ),
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/yeniCariAdres',
                arguments: cariKoduController);
          },
        ),
        body: Center(
          child: adresList.when(
            data: (data) {
              List<CariAdresModel> cariAdresList = data.map((e) => e).toList();
              return cariAdresList.isNotEmpty
                  ? SizedBox(
                      height: context.dynamicHeight * 1,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: cariAdresList.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).pop(
                                  cariAdresList[index].adrAdresNo.toString(),
                                );
                              },
                              child: Container(
                                margin: context.paddingDefault,
                                child: Card(
                                  elevation: 4,
                                  color: Color(MyColors.bg),
                                  margin: EdgeInsets.zero,
                                  child: Padding(
                                    padding: context.paddingDefault,
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: context.dynamicWidth * 0.03,
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: _buildAdVeKod(
                                              index, context, cariAdresList),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }),
                    )
                  : Text(
                      "Bu Cari Koduna Yeni Adres Eklemek İçin Sağ Alttaki Butona Tıklayın!",
                      style: purpleTxtStyle,
                    );
            },
            error: (err, stack) => showAlertDialog(
                context: context,
                hataBaslik: "Hata",
                hataIcerik: "Hata ${err.toString()}"),
            loading: () => const CommonLoading(),
          ),
        ));
  }

  Column _buildAdVeKod(
      int index, BuildContext context, List<CariAdresModel> cariAdresList) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cariAdresList[index].adrCariKod,
          style: TextStyle(
            color: Color(MyColors.bg01),
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
        SizedBox(
          height: context.dynamicHeight * 0.01,
        ),
        Text(
          cariAdresList[index].adrIl,
          style: TextStyle(
            color: Color(MyColors.bg01),
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
