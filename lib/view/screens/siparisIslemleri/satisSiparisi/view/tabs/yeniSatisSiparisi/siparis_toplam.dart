import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/common/common_button.dart';
import 'package:dinamik_otomasyon/view/common/common_textfield.dart';
import 'package:dinamik_otomasyon/view/screens/anasayfa/view/home_page.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/viewmodel/login_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/siparisler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/service/satis_siparisi_service.dart';
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
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SiparisToplam extends HookConsumerWidget {
  SiparisToplam({super.key});
  static final GlobalKey<FormFieldState<String>> searchFormKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final satisSiparisi = useState(0);
    final evrakSeriController = useTextEditingController(text: '');
    final evrakNoController = useTextEditingController(text: '');
    final belgeNoController = useTextEditingController(text: '');

    final dovizController = useTextEditingController(text: 'Türk Lirası');
    final projeController = useTextEditingController(text: '');
    final sormMerkeziController = useTextEditingController(text: '');
    final odemePlaniController = useTextEditingController(text: 'PEŞİN');
    final depoController = useTextEditingController(text: '1');
    final saticiController = useTextEditingController(text: '');
    final teslimTuruController = useTextEditingController(text: '');
    final siparisTarihiController = useTextEditingController(
        text:
            '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}');
    final aciklamaController = useTextEditingController(text: '');
    final orderDate = useState(DateTime.now());
    final focusNode = useFocusNode();
    var viewModel = ref.watch(satisSiparisViewModel);
    var currentUser = ref.watch(currentInfoProvider);
    var evrakNo = ref.watch(evrakBilgileriProvider);
    fillEvrakBilgileri() {
      if (evrakSeriController.text != '') {
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
              field: 'Evrak Seri',
              icon: Icons.document_scanner,
              isMandatory: false,
              searchFormKey: searchFormKey,
              readOnly: false,
              textInputType: TextInputType.name,
            ),
            EvrakNoTextField(
              evrakNoController: evrakNoController,
            ),

            CommonTextField(
              validator: (value) => null,
              controller: belgeNoController,
              field: 'Belge kodu',
              icon: Icons.document_scanner,
              isMandatory: false,
              readOnly: false,
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
              siparisTarihiController: siparisTarihiController,
              orderDate: orderDate,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CommonTextField(
                    validator: (value) => null,
                    controller: aciklamaController,
                    field: 'Açıklama',
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
                  //Navigator.pop(context);
                  return;
                }
                for (int i = 0; i < viewModel.siparisler.length; i++) {
                  ref
                      .watch(satisSiparisiSaveProvider(Siparisler(
                    sipCreateUser: currentUser.currentUser!.kullaniciNo,
                    sipLastupUser: currentUser.currentUser!.kullaniciNo,
                    sipTip: satisSiparisi.value,
                    sipEvraknoSeri: evrakSeriController.text.isNotEmpty
                        ? evrakSeriController.text
                        : '',
                    sipEvraknoSira: int.parse(evrakNoController.text),
                    sipSatirno: i,
                    sipSaticiKod: saticiController.text,
                    sipMusteriKod: viewModel.savedCari!.cariKodu,
                    sipStokKod: viewModel.siparisler[i].sipStokKod,
                    sipBFiyat: viewModel.siparisler[i].sipBFiyat,
                    sipMiktar: viewModel.siparisler[i].sipMiktar,
                    sipTeslimMiktar: viewModel.siparisler[i].sipMiktar,
                    sipTutar: viewModel.siparisler[i].sipTutar,
                    siparislerSipIskonto1: viewModel
                            .siparisler[i].siparislerSipIskonto1
                            .toString()
                            .isNotEmpty
                        ? viewModel.siparisler[i].siparislerSipIskonto1
                        : 0,
                    siparislerSipIskonto2: viewModel
                            .siparisler[i].siparislerSipIskonto2
                            .toString()
                            .isNotEmpty
                        ? viewModel.siparisler[i].siparislerSipIskonto2
                        : 0,
                    siparislerSipIskonto3: viewModel
                            .siparisler[i].siparislerSipIskonto3
                            .toString()
                            .isNotEmpty
                        ? viewModel.siparisler[i].siparislerSipIskonto3
                        : 0,
                    siparislerSipIskonto4: viewModel
                            .siparisler[i].siparislerSipIskonto4
                            .toString()
                            .isNotEmpty
                        ? viewModel.siparisler[i].siparislerSipIskonto4
                        : 0,
                    siparislerSipIskonto5: viewModel
                            .siparisler[i].siparislerSipIskonto5
                            .toString()
                            .isNotEmpty
                        ? viewModel.siparisler[i].siparislerSipIskonto5
                        : 0,
                    siparislerSipIskonto6: viewModel
                            .siparisler[i].siparislerSipIskonto6
                            .toString()
                            .isNotEmpty
                        ? viewModel.siparisler[i].siparislerSipIskonto6
                        : 0,
                    siparislerSipMasraf1: viewModel
                            .siparisler[i].siparislerSipMasraf1
                            .toString()
                            .isNotEmpty
                        ? viewModel.siparisler[i].siparislerSipMasraf1
                        : 0,
                    siparislerSipMasraf2: viewModel
                            .siparisler[i].siparislerSipMasraf2
                            .toString()
                            .isNotEmpty
                        ? viewModel.siparisler[i].siparislerSipMasraf2
                        : 0,
                    siparislerSipMasraf3: viewModel
                            .siparisler[i].siparislerSipMasraf3
                            .toString()
                            .isNotEmpty
                        ? viewModel.siparisler[i].siparislerSipMasraf3
                        : 0,
                    siparislerSipMasraf4: viewModel
                            .siparisler[i].siparislerSipMasraf4
                            .toString()
                            .isNotEmpty
                        ? viewModel.siparisler[i].siparislerSipMasraf4
                        : 0,
                    sipAciklama: aciklamaController.text,
                    sipDepono: int.parse(depoController.text),
                    sipOnaylayanKulNo: currentUser.currentUser!.kullaniciNo,
                    sipDovizCinsi: 1,
                    sipTeslimTarih: orderDate.value,
                  )).future)
                      .then((value) {
                    viewModel
                        .deleteItemToSiparisListAfterSave(viewModel.siparisler);
                    return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                              'Sipariş Başarıyla Kaydedildi!',
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
                                          builder: (context) => HomePage(
                                                sirketAdi: currentUser
                                                    .currentCari!.cariUnvani1,
                                              )));
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
                }
              },
              child: CommonButton(
                buttonName: 'Siparişi Kaydet',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
