import 'package:dinamik_otomasyon/Model/odeme_plani_model.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class OdemePlaniTextField extends ConsumerWidget {
  final TextEditingController odemePlaniController;
  const OdemePlaniTextField({
    super.key,
    required this.odemePlaniController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var sormMerkezi = ref.watch(odemePlaniProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: odemePlaniController,
        keyboardType: TextInputType.name,
        cursorColor: Color(MyColors.bg01),
        textInputAction: TextInputAction.next,
        readOnly: true,
        style: TextStyle(
            color: Color(
          MyColors.bg01,
        )),
        decoration: InputDecoration(
          labelText: Constants.odemePlani,
          labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(
                MyColors.bg01,
              )),
          prefixIcon: Icon(
            Icons.payment,
            color: Color(MyColors.bg01),
          ),
          suffix: InkWell(
            onTap: () {
              sormMerkezi.when(
                data: (data) {
                  List<OdemePlani> odemePlaniList = data.map((e) => e).toList();
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text(
                            'Ödeme Planı Seçiniz',
                            style: purpleBoldTxtStyle,
                          ),
                          children: [
                            SizedBox(
                              height: context.dynamicHeight * 0.4,
                              width: context.dynamicWidth * 0.5,
                              child: ListView.builder(
                                  itemCount: odemePlaniList.length,
                                  itemBuilder: (context, index) {
                                    return SimpleDialogOption(
                                      onPressed: () {
                                        odemePlaniController.text =
                                            odemePlaniList[index]
                                                .odemePlanAdi
                                                .toString();
                                        Navigator.pop(
                                          context,
                                          OdemePlani(
                                            odemePlanNo: odemePlaniList[index]
                                                .odemePlanNo,
                                            odemePlanKod: odemePlaniList[index]
                                                .odemePlanKod,
                                            odemePlanAdi: odemePlaniList[index]
                                                .odemePlanAdi,
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              odemePlaniList[index]
                                                  .odemePlanNo
                                                  .toString(),
                                              style: purpleTxtStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              odemePlaniList[index]
                                                  .odemePlanKod,
                                              style: purpleTxtStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              odemePlaniList[index]
                                                  .odemePlanAdi,
                                              style: purpleTxtStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        );
                      });
                },
                error: (err, stack) => showAlertDialog(
                    context: context, hataBaslik: 'hata', hataIcerik: 'hata'),
                loading: () => const CommonLoading(),
              );
            },
            child: Icon(Icons.question_mark,
                size: 20,
                color: Color(
                  MyColors.bg01,
                )),
          ),
          enabledBorder: CommonInputBorder.border,
          focusedBorder: CommonInputBorder.border,
        ),
      ),
    );
  }
}
