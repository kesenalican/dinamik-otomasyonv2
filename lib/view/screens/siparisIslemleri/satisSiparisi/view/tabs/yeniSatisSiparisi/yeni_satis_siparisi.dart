import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/common/common_textfield.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/common/common_dropdown.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/cari_kod_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/cari_personel_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/common_iskonto_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/depo_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/kur_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/odeme_plani_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/proje_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/siparis_tarihi_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/sorm_merkezi_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/stok_kod_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/teslim_turu_text_field.dart';
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

    final evrakSeriController = useTextEditingController(text: '');
    final evrakNoController = useTextEditingController(text: '');
    final belgeNoController = useTextEditingController(text: '');
    final cariKodController = useTextEditingController(text: '');
    final cariIsimController = useTextEditingController(text: '');
    final dovizController = useTextEditingController(text: '');
    final projeController = useTextEditingController(text: '');
    final sormMerkeziController = useTextEditingController(text: '');
    final odemePlaniController = useTextEditingController(text: '');
    final depoController = useTextEditingController(text: '');
    final saticiController = useTextEditingController(text: '');
    final teslimTuruController = useTextEditingController(text: '');
    final siparisTarihiController = useTextEditingController(text: '');
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
    final miktar = useState(double);
    final fiyat = useState(double);
    final tutar = useState(double);

    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            //EVRAK NO
            buildEvrakNoTextField(evrakSeriController, evrakNoController),
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
            Divider(
              color: Color(
                MyColors.bg01,
              ),
              indent: 50,
              endIndent: 50,
              thickness: 2,
            ),
            StokKodTextField(
              stokKoduController: stokKoduController,
              stokIsmiController: stokIsmiController,
              stokBirimController: stokBirimController,
              stokFiyatController: birimFiyatController,
            ),
            CommonTextField(
              validator: (value) {
                return cariViewModel.validateIsNotEmpty(value!);
              },
              controller: stokIsmiController,
              field: "Stok İsmi",
              icon: Icons.abc,
              isMandatory: true,
              readOnly: true,
              textInputType: TextInputType.name,
            ),
            CommonTextField(
              validator: (value) {
                return cariViewModel.validateIsNotEmpty(value!);
              },
              controller: birimFiyatController,
              field: "Birim Fiyatı",
              icon: Icons.price_change,
              isMandatory: true,
              textInputType: TextInputType.number,
            ),
            CommonTextField(
              validator: (value) {
                return cariViewModel.validateIsNotEmpty(value!);
              },
              controller: stokMiktariController,
              field: "Miktarı",
              icon: Icons.format_list_numbered,
              isMandatory: true,
              textInputType: TextInputType.number,
              onFieldSubmit: (value) {
                if (value!.isNotEmpty && value != null) {
                  var miktar = double.parse(value);
                  var fiyat = double.parse(birimFiyatController.text);
                  var toplam = miktar * fiyat;
                  sipTutariController.text = toplam.toString();
                }
              },
            ),
            CommonTextField(
              validator: (value) {
                return cariViewModel.validateIsNotEmpty(value!);
              },
              controller: sipTutariController,
              field: "Tutarı",
              icon: Icons.price_change,
              isMandatory: true,
              readOnly: true,
              textInputType: TextInputType.number,
            ),
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
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        "İskonto Ekle",
                        style: purpleTxtStyle,
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return SimpleDialog(
                                  title: Text(
                                    "İskontolar",
                                    style: purpleTxtStyle,
                                  ),
                                  children: [
                                    const Padding(padding: EdgeInsets.all(8)),
                                    buildIskFirstLine(isk1Controller,
                                        isk2Controller, isk3Controller),
                                    buildIskSecondLine(isk4Controller,
                                        isk5Controller, isk6Controller),
                                    SizedBox(
                                      height: context.dynamicHeight * 0.05,
                                    ),
                                    Text(
                                      "Masraflar",
                                      style: purpleBoldTxtStyle,
                                    ),
                                    buildMasFirstLine(mas1Controller, mas2Controller),
                                    buildMasSecondLine(mas3Controller, mas4Controller),
                                    Row(
                                      children: [
                                        Spacer(),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Color(MyColors.bg)),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Text(
                                                "Kapat",
                                                style: purpleTxtStyle,
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Expanded(
                                            child: TextButton(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Color(MyColors.bg01)),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                "İskontoyu kaydet",
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              });
                        },
                        icon: Icon(
                          Icons.add_box_outlined,
                          color: Color(
                            MyColors.bg01,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row buildMasSecondLine(TextEditingController mas3Controller, TextEditingController mas4Controller) {
    return Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        "Masraf3%",
                                        overflow: TextOverflow.ellipsis,
                                        style: purpleTxtStyle,
                                      )),
                                      Expanded(
                                        child: CommonIskTextField(
                                          validator: (p0) => null,
                                          controller: mas3Controller,
                                          field: "",
                                          icon: Icons.discount,
                                          isMandatory: false,
                                          textInputType: TextInputType.number,
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        "Masraf4%",
                                        overflow: TextOverflow.ellipsis,
                                        style: purpleTxtStyle,
                                      )),
                                      Expanded(
                                        child: CommonIskTextField(
                                          validator: (p0) => null,
                                          controller: mas4Controller,
                                          field: "",
                                          icon: Icons.discount,
                                          isMandatory: false,
                                          textInputType: TextInputType.number,
                                        ),
                                      ),
                                    ],
                                  );
  }

  Row buildMasFirstLine(TextEditingController mas1Controller, TextEditingController mas2Controller) {
    return Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                        "Masraf1%",
                                        overflow: TextOverflow.ellipsis,
                                        style: purpleTxtStyle,
                                      )),
                                      Expanded(
                                        child: CommonIskTextField(
                                          validator: (p0) => null,
                                          controller: mas1Controller,
                                          field: "",
                                          icon: Icons.discount,
                                          isMandatory: false,
                                          textInputType: TextInputType.number,
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        "Masraf2%",
                                        overflow: TextOverflow.ellipsis,
                                        style: purpleTxtStyle,
                                      )),
                                      Expanded(
                                        child: CommonIskTextField(
                                          validator: (p0) => null,
                                          controller: mas2Controller,
                                          field: "",
                                          icon: Icons.discount,
                                          isMandatory: false,
                                          textInputType: TextInputType.number,
                                        ),
                                      ),
                                    ],
                                  );
  }

  Row buildIskSecondLine(
      TextEditingController isk4Controller,
      TextEditingController isk5Controller,
      TextEditingController isk6Controller) {
    return Row(
      children: [
        Expanded(
            child: Text(
          "İsk4%",
          overflow: TextOverflow.ellipsis,
          style: purpleTxtStyle,
        )),
        Expanded(
          child: CommonIskTextField(
            validator: (p0) => null,
            controller: isk4Controller,
            field: "İskonto-1 ",
            icon: Icons.discount,
            isMandatory: false,
            textInputType: TextInputType.number,
          ),
        ),
        Expanded(
            child: Text(
          "İsk5%",
          overflow: TextOverflow.ellipsis,
          style: purpleTxtStyle,
        )),
        Expanded(
          child: CommonIskTextField(
            validator: (p0) => null,
            controller: isk5Controller,
            field: "İskonto-1 ",
            icon: Icons.discount,
            isMandatory: false,
            textInputType: TextInputType.number,
          ),
        ),
        Expanded(
            child: Text(
          "İsk6%",
          overflow: TextOverflow.ellipsis,
          style: purpleTxtStyle,
        )),
        Expanded(
          child: CommonIskTextField(
            validator: (p0) => null,
            controller: isk6Controller,
            field: "İskonto-1 ",
            icon: Icons.discount,
            isMandatory: false,
            textInputType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  Row buildIskFirstLine(
      TextEditingController isk1Controller,
      TextEditingController isk2Controller,
      TextEditingController isk3Controller) {
    return Row(
      children: [
        Expanded(
            child: Text(
          "İsk1%",
          overflow: TextOverflow.ellipsis,
          style: purpleTxtStyle,
        )),
        Expanded(
          child: CommonIskTextField(
            validator: (p0) => null,
            controller: isk1Controller,
            field: "İskonto-1 ",
            icon: Icons.discount,
            isMandatory: false,
            textInputType: TextInputType.number,
          ),
        ),
        Expanded(
            child: Text(
          "İsk2%",
          overflow: TextOverflow.ellipsis,
          style: purpleTxtStyle,
        )),
        Expanded(
          child: CommonIskTextField(
            validator: (p0) => null,
            controller: isk2Controller,
            field: "İskonto-1 ",
            icon: Icons.discount,
            isMandatory: false,
            textInputType: TextInputType.number,
          ),
        ),
        Expanded(
            child: Text(
          "İsk3%",
          overflow: TextOverflow.ellipsis,
          style: purpleTxtStyle,
        )),
        Expanded(
          child: CommonIskTextField(
            validator: (p0) => null,
            controller: isk3Controller,
            field: "İskonto-1 ",
            icon: Icons.discount,
            isMandatory: false,
            textInputType: TextInputType.number,
          ),
        ),
      ],
    );
  }

  Row buildEvrakNoTextField(TextEditingController evrakSeriController,
      TextEditingController evrakNoController) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: CommonTextField(
            validator: (value) => null,
            controller: evrakSeriController,
            field: "Evrak Seri",
            icon: Icons.document_scanner,
            isMandatory: false,
            readOnly: false,
            textInputType: TextInputType.name,
          ),
        ),
        Expanded(
          flex: 2,
          child: CommonTextField(
            validator: (value) => null,
            controller: evrakNoController,
            field: "Evrak no",
            icon: Icons.document_scanner,
            isMandatory: false,
            readOnly: false,
            textInputType: TextInputType.name,
          ),
        ),
      ],
    );
  }
}
