import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_save.model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/service/cari_services.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> buildSaveButton(
  BuildContext context,
  GlobalKey<FormState> formKey,
  WidgetRef ref,
  TextEditingController cariKoduController,
  TextEditingController cariUnvanController,
  TextEditingController vergiDaireAdiController,
  TextEditingController vergiDaireKoduController,
  int createUser,
  int lastUpUser,
) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text(
          "Cariyi kayıt etmek istiyor musunuz?",
          style: purpleTxtStyle,
        ),
        actions: [
          Row(
            children: [
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(MyColors.bg01)),
                ),
                child: const Text(
                  "Evet",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  //Navigator.pop(context);
                  if (!formKey.currentState!.validate()) {
                    Navigator.pop(context);
                    return;
                  }
                  ref
                      .watch(cariSaveProvider(
                    CariModel(
                      cariKod: cariKoduController.text,
                      cariUnvan1: cariUnvanController.text,
                      cariUnvan2: cariUnvanController.text,
                      cariVdaireAdi: vergiDaireAdiController.text,
                      cariVdaireNo: vergiDaireKoduController.text,
                      cariCreateUser: createUser,
                      cariLastupUser: lastUpUser,
                    ),
                  ).future)
                      .then((value) {
                    return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            "Cari Başarıyla Kaydedildi!",
                            style: purpleTxtStyle,
                          ),
                          actions: [
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(MyColors.bg01)),
                              ),
                              onPressed: () {
                                Navigator.of(context).popUntil((route) =>
                                    route.settings.name == '/cariKartlar');
                              },
                              child: const Text(
                                Constants.OK,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  });
                },
              ),
              SizedBox(
                width: context.dynamicWidth * 0.05,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Color(MyColors.bg01)),
                ),
                child: const Text(
                  "Hayır",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      );
    },
  );
}
