// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dinamik_otomasyon/Model/projeler.dart';
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

// ignore: must_be_immutable
class ProjeTextField extends ConsumerWidget {
  TextEditingController projeController;
  ProjeTextField({
    super.key,
    required this.projeController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var projeler = ref.watch(projeProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: projeController,
        keyboardType: TextInputType.name,
        cursorColor: Color(MyColors.bg01),
        readOnly: true,
        style: TextStyle(
            color: Color(
          MyColors.bg01,
        )),
        decoration: InputDecoration(
          labelText: Constants.projeSeciniz,
          labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(
                MyColors.bg01,
              )),
          prefixIcon: Icon(
            Icons.paste_rounded,
            color: Color(MyColors.bg01),
          ),
          suffix: InkWell(
            onTap: () {
              projeler.when(
                data: (data) {
                  List<Projeler> projeList = data.map((e) => e).toList();
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text(
                            'Proje',
                            style: purpleBoldTxtStyle,
                          ),
                          children: [
                            SizedBox(
                              height: context.dynamicHeight * 0.4,
                              width: context.dynamicWidth * 0.5,
                              child: ListView.builder(
                                  itemCount: projeList.length,
                                  itemBuilder: (context, index) {
                                    return SimpleDialogOption(
                                      onPressed: () {
                                        projeController.text = projeList[index]
                                            .projeAdi
                                            .toString();
                                        Navigator.pop(
                                          context,
                                          Projeler(
                                            projeKodu:
                                                projeList[index].projeKodu,
                                            projeAdi: projeList[index].projeAdi,
                                          ),
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              projeList[index].projeKodu,
                                              style: purpleTxtStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              projeList[index].projeAdi,
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
          errorBorder: CommonInputBorder.errorBorder,
          enabledBorder: CommonInputBorder.border,
          focusedBorder: CommonInputBorder.border,
        ),
      ),
    );
  }
}
