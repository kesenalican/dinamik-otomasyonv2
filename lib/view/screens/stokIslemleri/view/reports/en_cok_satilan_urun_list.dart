import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/service/stok_service.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EnCokSatilanList extends ConsumerWidget {
  final String? tarih;
  const EnCokSatilanList({super.key, required this.tarih});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final enCokSatilanList = ref.watch(enCokSatilanUrunlerProvider(tarih!));
    return enCokSatilanList.when(
      data: (data) {
        List enCokSatilanList = data.map((e) => e).toList();
        return ListView.builder(
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(5),
              child: Card(
                elevation: 4,
                color: Color(MyColors.bg),
                margin: EdgeInsets.zero,
                child: Padding(
                  padding: EdgeInsets.all(context.dynamicHeight * 0.01),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Color(MyColors.bg01),
                      ),
                      SizedBox(
                        width: context.dynamicWidth * 0.01,
                      ),
                      Expanded(
                        flex: 9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              enCokSatilanList[index].stokkodu,
                              style: TextStyle(
                                color: Color(MyColors.bg01),
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                            SizedBox(
                              height: context.dynamicHeight * 0.01,
                            ),
                            Text(
                              'liste[index].stokKodu',
                              style: TextStyle(
                                color: Color(MyColors.bg01),
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: context.dynamicWidth * 0.10,
                      ),
                      //FİYAT
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.all(context.dynamicHeight * 0.006),
                              child: Text(
                                'Adet: ',
                                style: TextStyle(
                                  color: Color(MyColors.bg01),
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Text(
                              '10 TL',
                              style: TextStyle(
                                color: Color(MyColors.bg01),
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      error: (err, stack) {
        return showAlertDialog(hataBaslik: 'HATA', hataIcerik: 'HATA');
      },
      loading: () => const CommonLoading(),
    );
  }
}
