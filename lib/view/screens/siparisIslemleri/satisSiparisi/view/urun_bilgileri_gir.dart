import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/viewmodel/login_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/siparisler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/stok_cari_bilgileri.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/common/iskonto_page.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_button.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UrunBilgileriGir extends HookConsumerWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  UrunBilgileriGir({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var siparisModel = ref.watch(satisSiparisViewModel);
    var currentUser = ref.watch(currentUserProvider);
    final focusNode = useFocusNode();
    final siparisMiktariController = useTextEditingController(text: '');
    final sipTutariController = useTextEditingController(text: '');
    final isk1Controller = useTextEditingController(text: '');
    final isk2Controller = useTextEditingController(text: '');
    final isk3Controller = useTextEditingController(text: '');
    final isk4Controller = useTextEditingController(text: '');
    final isk5Controller = useTextEditingController(text: '');
    final isk6Controller = useTextEditingController(text: '');
    final mas1Controller = useTextEditingController(text: '');
    final mas2Controller = useTextEditingController(text: '');
    final mas3Controller = useTextEditingController(text: '');
    final mas4Controller = useTextEditingController(text: '');

    focusNode.addListener(() {
      if (siparisMiktariController.text != "") {
        double miktar = double.parse(siparisMiktariController.text);
        double fiyat = siparisModel.savedStok!.stokFiyat;
        double toplam = fiyat * miktar;
        sipTutariController.text = toplam.toString();
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CommonAppbar(
        whichPage: "Ürün Ekle",
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Divider(
                color: Color(
                  MyColors.bg01,
                ),
                indent: 50,
                endIndent: 50,
                thickness: 1,
              ),
              //*Stok Kodu
              buildStokKodu(context, siparisModel),
              //*Stok Adı
              buildStokAdi(context, siparisModel),
              //*Stok Fiyatı
              buildStokFiyati(context, siparisModel),

              //*Stok Miktarı
              Padding(
                padding: context.paddingDefault,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Miktar Giriniz",
                        style: purpleTxtStyle,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        height: context.dynamicHeight * 0.03,
                        width: context.dynamicWidth * 0.05,
                        child: TextFormField(
                          controller: siparisMiktariController,
                          focusNode: focusNode,
                          keyboardType: TextInputType.number,
                          cursorColor: Color(MyColors.bg01),
                          style: TextStyle(
                            color: Color(
                              MyColors.bg01,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: context.dynamicHeight * 0.02,
              ),

              //*Toplam Tutar
              Padding(
                padding: context.paddingDefault,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Toplam Tutar",
                        style: purpleTxtStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "${sipTutariController.text} ${siparisModel.savedStok!.stokKur}",
                        style: purpleTxtStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              //*İskonto Ekle
              InkWell(
                child: CommonButton(buttonName: "İskonto Ekle %"),
                onTap: () {
                  if (siparisMiktariController.text != "") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => IskontoEkle(
                                  isk1Controller: isk1Controller,
                                  isk2Controller: isk2Controller,
                                  isk3Controller: isk3Controller,
                                  isk4Controller: isk4Controller,
                                  isk5Controller: isk5Controller,
                                  isk6Controller: isk6Controller,
                                  mas1Controller: mas1Controller,
                                  mas2Controller: mas2Controller,
                                  mas3Controller: mas3Controller,
                                  mas4Controller: mas4Controller,
                                  sipTutariController: sipTutariController,
                                ))).then((value) {});
                  } else {
                    // ignore: void_checks
                    return showAlertDialog(
                        context: context,
                        hataBaslik: "Hata",
                        hataIcerik: "Önce miktar giriniz!");
                  }
                },
              ),
              SizedBox(
                height: context.dynamicHeight * 0.005,
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: InkWell(
                  onTap: () async {
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Ürünü kayıt etmek istiyor musunuz?",
                              style: purpleTxtStyle,
                            ),
                            actions: [
                              Row(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                      siparisMiktariController.clear();
                                      sipTutariController.text = "";
                                    },
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(MyColors.bg01))),
                                    child: Text(
                                      "Hayır",
                                      style: whiteTxtStyle,
                                    ),
                                  ),
                                  TextButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all(
                                                Color(MyColors.bg01))),
                                    child: Text(
                                      "Evet",
                                      style: whiteTxtStyle,
                                    ),
                                    onPressed: () {
                                      if (!formKey.currentState!.validate()) {
                                        Navigator.pop(context);
                                        return;
                                      }
                                      if (siparisMiktariController.text == "") {
                                        // ignore: void_checks
                                        return showAlertDialog(
                                            context: context,
                                            hataBaslik: "Hata",
                                            hataIcerik: "Önce miktar giriniz!");
                                      }
                                      siparisModel.saveStokBilgileri(
                                          siparisMiktariController,
                                          sipTutariController);

                                      siparisModel.addItemToSiparisList(
                                          StokCariBilgileri(
                                        sipCreateUser: currentUser
                                            .currentUser!.kullaniciNo,
                                        sipLastupUser: currentUser
                                            .currentUser!.kullaniciNo,
                                        sipTip: 0,
                                        sipSatirno: siparisModel.satirNo,
                                        sipMusteriKod:
                                            siparisModel.savedCari!.cariKodu,
                                        sipStokKod:
                                            siparisModel.savedStok!.stokKodu,
                                        sipStokAd:
                                            siparisModel.savedStok!.stokIsim,
                                        sipBFiyat:
                                            siparisModel.savedStok!.stokFiyat,
                                        sipMiktar: int.parse(
                                            siparisMiktariController.text),
                                        sipTeslimMiktar: int.parse(
                                            siparisMiktariController.text),
                                        sipTutar: double.parse(
                                            sipTutariController.text),
                                        siparislerSipIskonto1:
                                            isk1Controller.text.isNotEmpty
                                                ? int.parse(isk1Controller.text)
                                                : 0,
                                        siparislerSipIskonto2: isk2Controller
                                                .text.isEmpty
                                            ? 0
                                            : int.parse(isk2Controller.text),
                                        siparislerSipIskonto3: isk3Controller
                                                .text.isEmpty
                                            ? 0
                                            : int.parse(isk3Controller.text),
                                        siparislerSipIskonto4: isk4Controller
                                                .text.isEmpty
                                            ? 0
                                            : int.parse(isk4Controller.text),
                                        siparislerSipIskonto5: isk5Controller
                                                .text.isEmpty
                                            ? 0
                                            : int.parse(isk5Controller.text),
                                        siparislerSipIskonto6: isk6Controller
                                                .text.isEmpty
                                            ? 0
                                            : int.parse(isk6Controller.text),
                                        siparislerSipMasraf1: mas1Controller
                                                .text.isEmpty
                                            ? 0
                                            : int.parse(mas1Controller.text),
                                        siparislerSipMasraf2: mas2Controller
                                                .text.isEmpty
                                            ? 0
                                            : int.parse(mas2Controller.text),
                                        siparislerSipMasraf3: mas3Controller
                                                .text.isEmpty
                                            ? 0
                                            : int.parse(mas3Controller.text),
                                        siparislerSipMasraf4: mas4Controller
                                                .text.isEmpty
                                            ? 0
                                            : int.parse(mas4Controller.text),
                                      ));

                                      print("LİSTEMİN UZUNLUĞU" +
                                          siparisModel.siparisler.length
                                              .toString());
                                      Future.delayed(
                                          const Duration(milliseconds: 500),
                                          () {
                                        return showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                content: Text(
                                                  "Ürün başarıyla kaydedildi! Başka bir ürün eklemek istiyor musunuz?",
                                                  style: purpleTxtStyle,
                                                ),
                                                actions: [
                                                  TextButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                                  MyColors
                                                                      .bg01)),
                                                    ),
                                                    onPressed: () {
                                                      Navigator
                                                          .pushNamedAndRemoveUntil(
                                                              context,
                                                              '/satisSiparisi',
                                                              (route) =>
                                                                  route.settings
                                                                      .name ==
                                                                  '/home');
                                                    },
                                                    child: Text(
                                                      "Hayır",
                                                      style: whiteTxtStyle,
                                                    ),
                                                  ),
                                                  TextButton(
                                                    style: ButtonStyle(
                                                      backgroundColor:
                                                          MaterialStateProperty
                                                              .all(Color(
                                                                  MyColors
                                                                      .bg01)),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pushNamed<
                                                          dynamic>(
                                                        context,
                                                        '/stockList',
                                                        arguments: true,
                                                      );
                                                    },
                                                    child: Text(
                                                      "Evet",
                                                      style: whiteTxtStyle,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            });
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          );
                        });
                  },
                  child: CommonButton(buttonName: "EKLE"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildStokFiyati(
      BuildContext context, SatisSiparisiViewModel siparisModel) {
    return Padding(
      padding: context.paddingDefault,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "Stok Fiyatı:",
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              siparisModel.savedStok!.stokFiyat.toString(),
              style: purpleTxtStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildStokAdi(
      BuildContext context, SatisSiparisiViewModel siparisModel) {
    return Padding(
      padding: context.paddingDefault,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "Stok Adı:",
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              siparisModel.savedStok!.stokIsim,
              style: purpleTxtStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildStokKodu(
      BuildContext context, SatisSiparisiViewModel siparisModel) {
    return Padding(
      padding: context.paddingDefault,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "Stok Kodu:",
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              siparisModel.savedStok!.stokKodu,
              style: purpleTxtStyle,
            ),
          ),
        ],
      ),
    );
  }
}
