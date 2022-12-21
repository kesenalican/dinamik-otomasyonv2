import 'package:dinamik_otomasyon/Model/depo_model.dart';
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
class DepoTextField extends ConsumerWidget {
  TextEditingController depoController;
  DepoTextField({
    super.key,
    required this.depoController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var depolar = ref.watch(depolarProvider);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) {
          if (value!.isEmpty) return 'Bu alan boş olamaz';
          return null;
        },
        controller: depoController,
        keyboardType: TextInputType.name,
        cursorColor: Color(MyColors.bg01),
        readOnly: true,
        style: TextStyle(
            color: Color(
          MyColors.bg01,
        )),
        decoration: InputDecoration(
          labelText: Constants.depo,
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
              depolar.when(
                data: (data) {
                  List<Depo> depolarList = data.map((e) => e).toList();
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return SimpleDialog(
                          title: Text(
                            Constants.depoSeciniz,
                            style: purpleBoldTxtStyle,
                          ),
                          children: [
                            SizedBox(
                              height: context.dynamicHeight * 0.4,
                              width: context.dynamicWidth * 0.5,
                              child: ListView.builder(
                                  itemCount: depolarList.length,
                                  itemBuilder: (context, index) {
                                    return SimpleDialogOption(
                                      onPressed: () {
                                        depoController.text = depolarList[index]
                                            .depAdi
                                            .toString();
                                        Navigator.pop(
                                          context,
                                        );
                                      },
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              depolarList[index]
                                                  .depNo
                                                  .toString(),
                                              style: purpleTxtStyle,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              depolarList[index].depAdi,
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
