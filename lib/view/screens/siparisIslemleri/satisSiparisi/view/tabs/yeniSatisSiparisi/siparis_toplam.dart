import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_button.dart';
import 'package:dinamik_otomasyon/view/common/common_textfield.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/viewmodel/login_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/tabs/yeniSatisSiparisi/bekleyen_siparisler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/model/siparisler.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/service/satis_siparisi_service.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/common/iskonto_page.dart';
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

class SiparisToplam extends HookConsumerWidget {
  SiparisToplam({super.key});
  static final GlobalKey<FormFieldState<String>> searchFormKey =
      GlobalKey<FormFieldState<String>>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CariViewModel cariViewModel = CariViewModel();
    List<SiparisSatiri> siparisList = [];
    List<SiparisSatiri> satirList = [];
    final satisSiparisi = useState(0);
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
    print(
        "GELEN MİKTAR == ${viewModel.siparisMiktari} ,, GELEN TUTAR ==== ${viewModel.toplamTutar.toString()} GELEN STOK KODU ===  ${viewModel.savedStok!.stokKodu}");
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
              field: "Belge kodu",
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
              onTap: () {
                if (!formKey.currentState!.validate()) {
                  //Navigator.pop(context);
                  return;
                }

                ref
                    .watch(satisSiparisiSaveProvider(Siparisler(
                  sipCreateUser: currentUser.currentUser!.kullaniciNo,
                  sipLastupUser: currentUser.currentUser!.kullaniciNo,
                  sipTip: satisSiparisi.value,
                  sipEvraknoSira: int.parse(evrakNoController.text),
                  sipSatirno: satirList.length - 1,
                  sipSaticiKod: saticiController.text,
                  sipMusteriKod: cariKodController.text,
                  sipStokKod: stokKoduController.text,
                  sipBFiyat: double.parse(birimFiyatController.text),
                  sipMiktar: int.parse(stokMiktariController.text),
                  sipTeslimMiktar: int.parse(stokMiktariController.text),
                  sipTutar: double.parse(sipTutariController.text),
                  siparislerSipIskonto1: int.parse(isk1Controller.text),
                  siparislerSipIskonto2: isk2Controller.text != ""
                      ? int.parse(isk2Controller.text)
                      : 0,
                  siparislerSipIskonto3: isk3Controller.text != ""
                      ? int.parse(isk3Controller.text)
                      : 0,
                  siparislerSipIskonto4: isk4Controller.text != ""
                      ? int.parse(isk4Controller.text)
                      : 0,
                  siparislerSipIskonto5: isk5Controller.text != ""
                      ? int.parse(isk5Controller.text)
                      : 0,
                  siparislerSipIskonto6: isk6Controller.text != ""
                      ? int.parse(isk6Controller.text)
                      : 0,
                  siparislerSipMasraf1: mas1Controller.text != ""
                      ? int.parse(mas1Controller.text)
                      : 0,
                  siparislerSipMasraf2: mas2Controller.text != ""
                      ? int.parse(mas2Controller.text)
                      : 0,
                  siparislerSipMasraf3: mas3Controller.text != ""
                      ? int.parse(mas3Controller.text)
                      : 0,
                  siparislerSipMasraf4: mas4Controller.text != ""
                      ? int.parse(mas4Controller.text)
                      : 0,
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
