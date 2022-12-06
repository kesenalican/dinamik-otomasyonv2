import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/viewmodel/login_view_model.dart';
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

// ignore: must_be_immutable
class UrunBilgileriGir extends HookConsumerWidget {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  double? kdvsizFiyat;
  // ignore: prefer_typing_uninitialized_variables
  double? netFiyat = 0;
  // ignore: prefer_typing_uninitialized_variables
  double? brutFiyat;
  UrunBilgileriGir({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var siparisModel = ref.watch(satisSiparisViewModel);
    var currentUser = ref.watch(currentInfoProvider);
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
    siparisModel.calculateKdv();
    focusNode.addListener(() {
      if (siparisMiktariController.text != "") {
        double miktar =
            double.parse(siparisMiktariController.text.replaceAll(',', ''));
        double fiyat = siparisModel.savedStok!.stokFiyat;
        double toplam = fiyat * miktar;
        sipTutariController.text = toplam.toString();
        //* KDVSİZ TUTARLARIDA TOPLUYORUM
        //siparisModel.calculateKdv();
        netFiyat = siparisModel.kdvsizNetFiyat! * miktar;
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
              //*Birim Fiyatı
              buildBirimFiyati(context, siparisModel),
              //* Kdv Oranı
              buildKdvOrani(context, siparisModel),
              //*Stok Miktarı
              Padding(
                padding: context.paddingDefault,
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "Miktar Giriniz:",
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
                        "Brüt Tutar:",
                        style: purpleTxtStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        "${netFiyat!.toStringAsFixed(2)} ${siparisModel.savedStok!.stokKur}",
                        style: purpleTxtStyle,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              // //*İskonto Ekle
              // InkWell(
              //   child: CommonButton(buttonName: "İskonto Ekle %"),
              //   onTap: () {
              //     if (siparisMiktariController.text != "") {
              //       Navigator.push(
              //           context,
              //           MaterialPageRoute(
              //               builder: (context) => IskontoEkle(
              //                     isk1Controller: isk1Controller,
              //                     isk2Controller: isk2Controller,
              //                     isk3Controller: isk3Controller,
              //                     isk4Controller: isk4Controller,
              //                     isk5Controller: isk5Controller,
              //                     isk6Controller: isk6Controller,
              //                     mas1Controller: mas1Controller,
              //                     mas2Controller: mas2Controller,
              //                     mas3Controller: mas3Controller,
              //                     mas4Controller: mas4Controller,
              //                     sipTutariController: sipTutariController,
              //                   ))).then((value) {});
              //     } else {
              //       // ignore: void_checks
              //       return showAlertDialog(
              //           context: context,
              //           hataBaslik: "Hata",
              //           hataIcerik: "Önce miktar giriniz!");
              //     }
              //   },
              // ),
              SizedBox(
                height: context.dynamicHeight * 0.005,
              ),
              Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: InkWell(
                  onTap: () async {
                    //TODOS:

                    return buildOrderSaveDialog(
                        context,
                        siparisMiktariController,
                        sipTutariController,
                        siparisModel,
                        currentUser,
                        isk1Controller,
                        isk2Controller,
                        isk3Controller,
                        isk4Controller,
                        isk5Controller,
                        isk6Controller,
                        mas1Controller,
                        mas2Controller,
                        mas3Controller,
                        mas4Controller);
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

  Future<void> buildOrderSaveDialog(
      BuildContext context,
      TextEditingController siparisMiktariController,
      TextEditingController sipTutariController,
      SatisSiparisiViewModel siparisModel,
      LoginViewModel currentUser,
      TextEditingController isk1Controller,
      TextEditingController isk2Controller,
      TextEditingController isk3Controller,
      TextEditingController isk4Controller,
      TextEditingController isk5Controller,
      TextEditingController isk6Controller,
      TextEditingController mas1Controller,
      TextEditingController mas2Controller,
      TextEditingController mas3Controller,
      TextEditingController mas4Controller) {
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
                            MaterialStateProperty.all(Color(MyColors.bg01))),
                    child: Text(
                      "Hayır",
                      style: whiteTxtStyle,
                    ),
                  ),
                  SizedBox(
                    width: context.dynamicWidth * 0.03,
                  ),
                  TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(MyColors.bg01))),
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
                          siparisMiktariController, sipTutariController);
                      siparisModel.addItemToSiparisList(StokCariBilgileri(
                        indirimliToplamTutar: 0,
                        sipCreateUser: currentUser.currentUser!.kullaniciNo,
                        sipLastupUser: currentUser.currentUser!.kullaniciNo,
                        sipTip: 0,
                        sipMusteriKod: siparisModel.savedCari!.cariKodu,
                        sipStokKod: siparisModel.savedStok!.stokKodu,
                        sipStokAd: siparisModel.savedStok!.stokIsim,
                        sipBFiyat: siparisModel.savedStok!.stokFiyat,
                        sipKdvsizFiyat: netFiyat!,
                        sipMiktar: int.parse(
                            siparisMiktariController.text.replaceAll(',', '')),
                        sipTeslimMiktar: int.parse(
                            siparisMiktariController.text.replaceAll(',', '')),
                        sipTutar: double.parse(sipTutariController.text),
                        siparislerSipIskonto1: isk1Controller.text.isNotEmpty
                            ? int.parse(isk1Controller.text)
                            : 0,
                        siparislerSipIskonto2: isk2Controller.text.isEmpty
                            ? 0
                            : int.parse(isk2Controller.text),
                        siparislerSipIskonto3: isk3Controller.text.isEmpty
                            ? 0
                            : int.parse(isk3Controller.text),
                        siparislerSipIskonto4: isk4Controller.text.isEmpty
                            ? 0
                            : int.parse(isk4Controller.text),
                        siparislerSipIskonto5: isk5Controller.text.isEmpty
                            ? 0
                            : int.parse(isk5Controller.text),
                        siparislerSipIskonto6: isk6Controller.text.isEmpty
                            ? 0
                            : int.parse(isk6Controller.text),
                        siparislerSipMasraf1: mas1Controller.text.isEmpty
                            ? 0
                            : int.parse(mas1Controller.text),
                        siparislerSipMasraf2: mas2Controller.text.isEmpty
                            ? 0
                            : int.parse(mas2Controller.text),
                        siparislerSipMasraf3: mas3Controller.text.isEmpty
                            ? 0
                            : int.parse(mas3Controller.text),
                        siparislerSipMasraf4: mas4Controller.text.isEmpty
                            ? 0
                            : int.parse(mas4Controller.text),
                      ));
                      Navigator.pushNamedAndRemoveUntil(
                          context,
                          '/satisSiparisi',
                          (route) => route.settings.name == '/home');
                    },
                  ),
                ],
              ),
            ],
          );
        });
  }

  Padding buildBirimFiyati(
      BuildContext context, SatisSiparisiViewModel siparisModel) {
    return Padding(
      padding: context.paddingDefault,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "Birim Fiyatı:",
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              siparisModel.kdvsizNetFiyat!.toStringAsFixed(2),
              style: purpleTxtStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Padding buildKdvOrani(
      BuildContext context, SatisSiparisiViewModel siparisModel) {
    return Padding(
      padding: context.paddingDefault,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              "KDV Oranı:",
              style: purpleTxtStyle,
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              siparisModel.savedStok!.perakendeVergiIsim,
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
