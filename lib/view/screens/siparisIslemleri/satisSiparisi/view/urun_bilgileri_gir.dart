import 'package:dinamik_otomasyon/Model/stok_satis_fiyat_tanimlari.dart';
import 'package:dinamik_otomasyon/core/components/dialog_utils.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/viewmodel/login_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/stok_cari_bilgileri.dart';
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
  final double? kdvsizFiyat = 0;
  final double? brutFiyat = 0;
  final bool? alisSiparisi;
  UrunBilgileriGir({super.key, required this.alisSiparisi});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var siparisModel = ref.watch(satisSiparisViewModel);
    var currentUser = ref.watch(currentInfoProvider);
    var fiyatTurleri = ref.watch(stokSatisFiyatiListeleri);
    var selectedCariSatisTuru = siparisModel.savedCari!.cariBagliStok;

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
    final netFiyat = useState(0.0);
    siparisModel.calculateKdv();
    focusNode.addListener(() {
      if (siparisMiktariController.text != '') {
        double miktar =
            double.parse(siparisMiktariController.text.replaceAll(',', ''));
        double fiyat = siparisModel.savedStok!.stokFiyat;
        double toplam = fiyat * miktar;
        sipTutariController.text = toplam.toString();
        //* KDVSİZ TUTARLARIDA TOPLUYORUM
        //siparisModel.calculateKdv();
        netFiyat.value = siparisModel.kdvsizNetFiyat! * miktar;
        siparisModel.kdvsizBrutFiyat = netFiyat.value;
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: const CommonAppbar(
        whichPage: Constants.urunEkle,
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

              // //* Fiyat Türü
              fiyatTurleri.when(
                error: (err, stack) => showAlertDialog(
                    context: context,
                    hataBaslik: Constants.hataBaslik,
                    hataIcerik: Constants.hataIcerik),
                loading: () => const CommonLoading(),
                data: (data) {
                  List<StokSatisFiyatListeleri> fiyatTurleri =
                      data.map((e) => e).toList();
                  List<StokSatisFiyatListeleri> fiyati = fiyatTurleri
                      .where(
                          (element) => element.siraNo == selectedCariSatisTuru)
                      .toList();
                  return Padding(
                    padding: context.paddingDefault,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Text(
                            '${Constants.fiyat} :',
                            style: purpleTxtStyle,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Text(
                            fiyati.isNotEmpty
                                ? fiyati.first.aciklama
                                : 'Satış Fiyatı Tanımlanmamış',
                            style: purpleTxtStyle,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  );
                },
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
                        Constants.miktarGiriniz,
                        style: purpleTxtStyle,
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        // height: context.dynamicHeight * 0.05,
                        width: context.dynamicWidth * 0.05,
                        child: TextFormField(
                          controller: siparisMiktariController,
                          focusNode: focusNode,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          cursorColor: Color(MyColors.bg01),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return Constants.miktarBosOlamaz;
                            }
                            return null;
                          },
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
                        Constants.brutTutar,
                        style: purpleTxtStyle,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${netFiyat.value.toStringAsFixed(2)} ${siparisModel.savedStok!.stokKur}',
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
              //                     kdvsizTutar: netFiyat.value,
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
                        mas4Controller,
                        netFiyat.value);
                  },
                  child: const CommonButton(buttonName: Constants.ekle),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showFiyatTurleri(context, List<StokSatisFiyatListeleri> list,
      TextEditingController fiyatTuruController) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            Constants.fiyatTuruSeciniz,
            style: purpleBoldTxtStyle,
          ),
          children: [
            SizedBox(
              height: context.dynamicHeight * 0.4,
              width: context.dynamicWidth * 0.5,
              child: ListView.builder(
                itemCount: list.length,
                itemBuilder: (context, index) {
                  return SimpleDialogOption(
                    onPressed: () {
                      fiyatTuruController.text = list[index].aciklama;
                      Navigator.of(context).pop(StokSatisFiyatListeleri(
                          siraNo: list[index].siraNo,
                          aciklama: list[index].aciklama));
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            list[index].siraNo.toString(),
                            style: purpleTxtStyle,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            list[index].aciklama,
                            style: purpleTxtStyle,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
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
      TextEditingController mas4Controller,
      double netFiyat) {
    return showDialog(
        context: context,
        builder: (context) {
          if (siparisMiktariController.text != '') {
            double miktar =
                double.parse(siparisMiktariController.text.replaceAll(',', ''));
            double fiyat = siparisModel.savedStok!.stokFiyat;
            double toplam = fiyat * miktar;
            sipTutariController.text = toplam.toString();
            //* KDVSİZ TUTARLARIDA TOPLUYORUM
            //siparisModel.calculateKdv();
            netFiyat = siparisModel.kdvsizNetFiyat! * miktar;
            siparisModel.kdvsizBrutFiyat = netFiyat;
          }
          return AlertDialog(
            title: Text(
              Constants.kayitMesaji,
              style: purpleTxtStyle,
            ),
            actions: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      siparisMiktariController.clear();
                      sipTutariController.text = '';
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(MyColors.bg01))),
                    child: Text(
                      Constants.hayir,
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
                      Constants.evet,
                      style: whiteTxtStyle,
                    ),
                    onPressed: () {
                      if (!formKey.currentState!.validate()) {
                        Navigator.pop(context);
                        return;
                      }
                      showProgressDialog(context);
                      siparisModel.saveStokBilgileri(
                          siparisMiktariController, sipTutariController);
                      // siparisModel.calculateKdv();

                      siparisModel.addItemToSiparisList(StokCariBilgileri(
                        sipCreateUser: currentUser.currentUser!.kullaniciNo,
                        sipLastupUser: currentUser.currentUser!.kullaniciNo,
                        sipTip: 0,
                        sipMusteriKod: siparisModel.savedCari!.cariKodu,
                        sipStokKod: siparisModel.savedStok!.stokKodu,
                        sipStokAd: siparisModel.savedStok!.stokIsim,
                        sipBFiyat: siparisModel.savedStok!.stokFiyat,
                        sipKdvsizFiyat: siparisModel.kdvsizNetFiyat!,
                        sipKdvsizTutar: netFiyat,
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
                      dismissDialog(context);
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
              '${Constants.birimFiyati}:',
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
              Constants.kdvOrani,
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
              Constants.stokAdi,
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
              '${Constants.stokKodu}:',
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
