import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_button.dart';
import 'package:dinamik_otomasyon/view/common/common_textfield.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/viewmodel/login_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/bekleyenSiparisler/view/bekleyen_siparisler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/siparisler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/service/satis_siparisi_service.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/common/iskonto_page.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/cari_kod_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/cari_personel_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/depo_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/evrak_no_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/evrak_seri_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/kur_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/odeme_plani_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/proje_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/siparis_tarihi_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/sorm_merkezi_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/teslim_turu_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/siparis_satiri.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class YeniSatisSiparisi extends HookConsumerWidget {
  const YeniSatisSiparisi({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    CariViewModel cariViewModel = CariViewModel();
    List<SiparisSatiri> siparisList = [];

    final evrakSeriController = useTextEditingController(text: '');
    final evrakNoController = useTextEditingController(text: '');
    final belgeNoController = useTextEditingController(text: '');
    final cariKodController = useTextEditingController(text: '');
    final cariIsimController = useTextEditingController(text: '');
    final dovizController = useTextEditingController(text: 'Türk Lirası');
    final projeController = useTextEditingController(text: '');
    final sormMerkeziController = useTextEditingController(text: '');
    final odemePlaniController = useTextEditingController(text: 'PEŞİN');
    final depoController = useTextEditingController(text: "1");
    final saticiController = useTextEditingController(text: '');
    final teslimTuruController = useTextEditingController(text: '');
    final siparisTarihiController =
        useTextEditingController(text: DateTime.now().toString());
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
    final stokKoduController = useTextEditingController(text: '');
    final stokIsmiController = useTextEditingController(text: '');
    final stokMiktariController = useTextEditingController(text: '');
    final stokBirimController = useTextEditingController(text: '');
    final birimFiyatController = useTextEditingController(text: '');
    final sipTutariController = useTextEditingController(text: '');
    final aciklamaController = useTextEditingController(text: '');
    final focusNode = useFocusNode();
    var viewModel = ref.watch(satisSiparisViewModel);
    var currentUser = ref.watch(currentUserProvider);
    var evrakNo = ref.watch(evrakBilgileriProvider);

    fillEvrakBilgileri() {
      if (evrakSeriController.text != "") {
        viewModel.seriNoControl(
          seriNo: evrakSeriController.text,
        );
        var seriNoluListLength = viewModel.listLength;
        evrakNoController.text = seriNoluListLength.toString();
      } else {
        evrakNo.hasValue
            ? evrakNoController.text = (evrakNo.value!.length).toString()
            : 0;
      }
    }

    focusNode.addListener(() {
      fillEvrakBilgileri();
    });

    // useEffect(() {
    //   focusNode.addListener(() {
    //     fillEvrakBilgileri();
    //   });
    // });

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            //EVRAK NO
            EvrakSeriTextField(
              validator: (value) => null,
              focusNode: focusNode,
              controller: evrakSeriController,
              field: "Evrak Seri",
              icon: Icons.document_scanner,
              isMandatory: false,
              readOnly: false,
              textInputType: TextInputType.name,
            ),
            EvrakNoTextField(
              evrakNoController: evrakNoController,
            ),

            CommonTextField(
              validator: (value) => null,
              controller: belgeNoController,
              field: "Belge kodu",
              icon: Icons.document_scanner,
              isMandatory: false,
              readOnly: false,
              textInputType: TextInputType.name,
            ),
            CariKodTextField(
                cariKodController: cariKodController,
                cariIsimController: cariIsimController),
            CommonTextField(
              validator: (value) {
                return cariViewModel.validateIsNotEmpty(value!);
              },
              controller: cariIsimController,
              field: "Cari İsmi",
              icon: Icons.person,
              isMandatory: true,
              readOnly: true,
              textInputType: TextInputType.name,
            ),
            KurTextField(dovizController: dovizController),
            ProjeTextField(projeController: projeController),
            SormMerkeziTextField(sormMerkeziController: sormMerkeziController),
            OdemePlaniTextField(odemePlaniController: odemePlaniController),
            DepoTextField(depoController: depoController),
            CariPersonelTextField(cariPersonelController: saticiController),
            TeslimTuruTextField(teslimTuruController: teslimTuruController),
            SiparisTarihiTextField(
                siparisTarihiController: siparisTarihiController),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CommonTextField(
                    validator: (value) => null,
                    controller: aciklamaController,
                    field: "Açıklama",
                    icon: Icons.style,
                    isMandatory: true,
                    readOnly: true,
                    textInputType: TextInputType.name,
                  ),
                ),
              ],
            ),
            InkWell(
              onTap: () async {
                await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SiparisSatiri(
                              stokKoduController: stokKoduController,
                              stokIsmiController: stokIsmiController,
                              birimFiyatController: birimFiyatController,
                              sipTutariController: sipTutariController,
                              stokBirimController: stokBirimController,
                              stokMiktariController: stokMiktariController,
                            ))).then((value) {
                  siparisList.add(SiparisSatiri(
                      stokKoduController: stokKoduController,
                      stokIsmiController: stokIsmiController,
                      stokMiktariController: stokMiktariController,
                      stokBirimController: stokBirimController,
                      birimFiyatController: birimFiyatController,
                      sipTutariController: sipTutariController));
                });
                print("sipariş listemin uzunluğu ==== " +
                    siparisList.length.toString());
              },
              child: CommonButton(
                buttonName: "Ürün Gir",
              ),
            ),
            InkWell(
              onTap: () {
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
                              sipTutariController: sipTutariController,
                              mas1Controller: mas1Controller,
                              mas2Controller: mas2Controller,
                              mas3Controller: mas3Controller,
                              mas4Controller: mas4Controller,
                            )));
              },
              child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: context.dynamicHeight * 0.006,
                    horizontal: context.dynamicWidth * 0.05),
                padding: context.paddingDefault,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(MyColors.bg03),
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: Color(MyColors.bg01),
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.add_box_rounded,
                      color: Color(
                        MyColors.bg01,
                      ),
                    ),
                    Text(
                      "İskonto Ekle",
                      style: purpleTxtStyle,
                    ),
                  ],
                ),
              ),
            ),
            Text("Ürün Bilgisi", style: purpleBoldTxtStyle),
            Divider(
              color: Color(
                MyColors.bg01,
              ),
              indent: 50,
              endIndent: 50,
              thickness: 2,
            ),

            SizedBox(
              height: context.dynamicHeight * 0.07,
              width: context.dynamicWidth * 0.9,
              child: ListView.builder(
                itemCount: siparisList.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.all(context.dynamicHeight * 0.02),
                    padding: EdgeInsets.symmetric(
                        vertical: context.dynamicHeight * 0.02,
                        horizontal: context.dynamicHeight * 0.05),
                    decoration: BoxDecoration(
                      color: Color(
                        MyColors.bg,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Ürün 1",
                          style: purpleBoldTxtStyle,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Stok Kodu:",
                                style: purpleTxtStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                siparisList[index].stokKoduController.text,
                                style: purpleTxtStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Ürün İsmi:",
                                style: purpleTxtStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                siparisList[index].stokIsmiController.text,
                                style: purpleTxtStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Ürün Fiyatı:",
                                style: purpleTxtStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "${siparisList[index].birimFiyatController.text} TL",
                                style: purpleTxtStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Sipariş Miktarı:",
                                style: purpleTxtStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "${siparisList[index].stokMiktariController.text} ${siparisList[index].stokBirimController.text}",
                                style: purpleTxtStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                "Toplam Tutar:",
                                style: purpleTxtStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                " ${siparisList[index].sipTutariController.text} TL",
                                style: purpleTxtStyle,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            InkWell(
              onTap: () {
                if (!formKey.currentState!.validate()) {
                  Navigator.pop(context);
                  return;
                }
                ref
                    .watch(satisSiparisiSaveProvider(Siparisler(
                  sipCreateUser: currentUser.currentUser!.kullaniciNo,
                  sipLastupUser: currentUser.currentUser!.kullaniciNo,
                  sipTip: 0,
                  sipEvraknoSira: int.parse(evrakNoController.text),
                  sipSatirno: 0,
                  sipSaticiKod: saticiController.text,
                  sipMusteriKod: cariKodController.text,
                  sipStokKod: stokKoduController.text,
                  sipBFiyat: double.parse(birimFiyatController.text),
                  sipMiktar: int.parse(stokMiktariController.text),
                  sipTeslimMiktar: int.parse(stokMiktariController.text),
                  sipTutar: double.parse(sipTutariController.text),
                  siparislerSipIskonto1: int.parse(isk1Controller.text),
                  siparislerSipIskonto2: 0,
                  siparislerSipIskonto3: 0,
                  siparislerSipIskonto4: 0,
                  siparislerSipIskonto5: 0,
                  siparislerSipIskonto6: 0,
                  siparislerSipMasraf1: 0,
                  siparislerSipMasraf2: 0,
                  siparislerSipMasraf3: 0,
                  siparislerSipMasraf4: 0,
                  sipAciklama: aciklamaController.text,
                  sipDepono: int.parse(depoController.text),
                  sipOnaylayanKulNo: currentUser.currentUser!.kullaniciNo,
                  sipDovizCinsi: 1,
                )).future)
                    .then((value) {
                  return showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: Text(
                            "Sipariş Başarıyla Kaydedildi!",
                            style: purpleTxtStyle,
                          ),
                          actions: [
                            TextButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color(MyColors.bg01)),
                              ),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const BekleyenSiparisler()));
                              },
                              child: const Text(
                                Constants.OK,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        );
                      });
                });
              },
              child: CommonButton(
                buttonName: "Siparişi Kaydet",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
