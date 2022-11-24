import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_button.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/common/common_textfield.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/viewmodel/login_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/siparisler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/service/satis_siparisi_service.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/common/iskonto_page.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/cari_kod_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/cari_personel_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/depo_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/kur_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/odeme_plani_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/proje_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/siparis_tarihi_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/sorm_merkezi_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/stok_kod_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/teslim_turu_text_field.dart';
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

    final evrakSeriController = useTextEditingController(text: '');
    final evrakNoController = useTextEditingController(text: '');
    final belgeNoController = useTextEditingController(text: '');
    final cariKodController = useTextEditingController(text: '');
    final cariIsimController = useTextEditingController(text: '');
    final dovizController = useTextEditingController(text: 'Türk Lirası');
    final projeController = useTextEditingController(text: '');
    final sormMerkeziController = useTextEditingController(text: '');
    final odemePlaniController = useTextEditingController(text: 'PEŞİN');
    final depoController = useTextEditingController(text: 'Merkez depo');
    final saticiController = useTextEditingController(text: '');
    final teslimTuruController = useTextEditingController(text: '');
    final siparisTarihiController = useTextEditingController(
        text:
            "${DateTime.now().year} - ${DateTime.now().month} - ${DateTime.now().day}");
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
    var viewModel = ref.watch(satisSiparisViewModel);
    var currentUser = ref.watch(currentUserProvider);
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
            Text("Ürün Bilgisi", style: purpleBoldTxtStyle),
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
                viewModel.calculateTotalPrice(
                    value, birimFiyatController, sipTutariController);
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
              onTap: () {
                if (!formKey.currentState!.validate()) {
                  Navigator.pop(context);
                  return;
                }
            
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
