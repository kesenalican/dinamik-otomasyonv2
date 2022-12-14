import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/viewmodel/login_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_adres_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/service/cari_services.dart';
import 'package:dinamik_otomasyon/view/common/common_textfield.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class YeniCariAdres extends HookConsumerWidget {
  final TextEditingController cariKoduController;
  final CariViewModel cariViewModel = CariViewModel();
  YeniCariAdres({super.key, required this.cariKoduController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final adresNoController = useTextEditingController(text: '');
    final caddeController = useTextEditingController(text: '');
    final mahalleController = useTextEditingController(text: '');
    final sokakController = useTextEditingController(text: '');
    final ilController = useTextEditingController(text: '');
    final ilceController = useTextEditingController(text: '');
    final ulkeController = useTextEditingController(text: '');
    final ulkeKoduController = useTextEditingController(text: '90');
    final telefon1Controller = useTextEditingController(text: '');
    var currentUser = ref.watch(currentInfoProvider);
    return Scaffold(
      appBar: CommonAppbar(whichPage: Constants.yeniCariAdresOlustur),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!formKey.currentState!.validate()) {
            return;
          }
          ref
              .watch(cariAdresSaveProvider(CariAdresModel(
            adrAdresNo: int.parse(adresNoController.text),
            adrCariKod: cariKoduController.text,
            adrCreateUser: currentUser.currentUser!.kullaniciNo,
            adrCadde: caddeController.text,
            adrIl: ilController.text,
            adrIlce: ilceController.text,
            adrMahalle: mahalleController.text,
            adrSokak: sokakController.text,
            adrTelModem: telefon1Controller.text,
            adrTelUlkeKodu: ulkeKoduController.text,
            adrUlke: ulkeController.text,
          )).future)
              .then((value) {
            return showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text(
                      'Cari Adres Ba??ar??yla Kaydedildi!',
                      style: purpleTxtStyle,
                    ),
                    actions: [
                      TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(MyColors.bg01)),
                        ),
                        onPressed: () {
                          ref.refresh(
                              cariAdresProvider(cariKoduController.text));
                          Navigator.of(context).pop(
                            CariAdresModel(
                                adrCreateUser: 0,
                                adrCariKod: cariKoduController.text,
                                adrAdresNo: int.parse(adresNoController.text),
                                adrCadde: caddeController.text,
                                adrMahalle: mahalleController.text,
                                adrSokak: sokakController.text,
                                adrIlce: ilceController.text,
                                adrIl: ilController.text,
                                adrUlke: ulkeController.text,
                                adrTelUlkeKodu: ulkeKoduController.text,
                                adrTelModem: telefon1Controller.text),
                          );
                          Navigator.pop(
                            context,
                            CariAdresModel(
                                adrCreateUser: 0,
                                adrCariKod: cariKoduController.text,
                                adrAdresNo: int.parse(adresNoController.text),
                                adrCadde: caddeController.text,
                                adrMahalle: mahalleController.text,
                                adrSokak: sokakController.text,
                                adrIlce: ilceController.text,
                                adrIl: ilController.text,
                                adrUlke: ulkeController.text,
                                adrTelUlkeKodu: ulkeKoduController.text,
                                adrTelModem: telefon1Controller.text),
                          );
                          Navigator.pop(
                            context,
                            CariAdresModel(
                                adrCreateUser: 0,
                                adrCariKod: cariKoduController.text,
                                adrAdresNo: int.parse(adresNoController.text),
                                adrCadde: caddeController.text,
                                adrMahalle: mahalleController.text,
                                adrSokak: sokakController.text,
                                adrIlce: ilceController.text,
                                adrIl: ilController.text,
                                adrUlke: ulkeController.text,
                                adrTelUlkeKodu: ulkeKoduController.text,
                                adrTelModem: telefon1Controller.text),
                          );
                        },
                        child: const Text(
                          Constants.ok,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                });
          });
        },
        backgroundColor: Color(MyColors.bg01),
        child: const Icon(
          Icons.save,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CommonTextField(
                  controller: adresNoController,
                  field: 'Adres No',
                  icon: Icons.map,
                  textInputType: TextInputType.number,
                  isMandatory: true,
                  validator: (value) {
                    return cariViewModel.validateAdresNo(value!);
                  }),
              CommonTextField(
                controller: cariKoduController,
                field: Constants.cariKodu,
                icon: Icons.map,
                textInputType: TextInputType.name,
                isMandatory: true,
                readOnly: true,
                validator: null,
              ),
              CommonTextField(
                controller: caddeController,
                field: 'Cadde',
                icon: Icons.map,
                textInputType: TextInputType.name,
                isMandatory: false,
                validator: null,
              ),
              CommonTextField(
                controller: mahalleController,
                field: 'Mahalle',
                icon: Icons.map,
                textInputType: TextInputType.name,
                isMandatory: false,
                validator: null,
              ),
              CommonTextField(
                controller: sokakController,
                field: 'Sokak',
                icon: Icons.map,
                textInputType: TextInputType.name,
                isMandatory: false,
                validator: null,
              ),
              InkWell(
                onTap: () async {},
                child: CommonTextField(
                    controller: ilController,
                    field: Constants.il,
                    icon: Icons.map,
                    textInputType: TextInputType.name,
                    isMandatory: true,
                    validator: (value) {
                      return cariViewModel.validateString(value!);
                    }),
              ),
              CommonTextField(
                  controller: ilceController,
                  field: Constants.ilce,
                  icon: Icons.maps_home_work,
                  textInputType: TextInputType.name,
                  isMandatory: true,
                  validator: (value) {
                    return cariViewModel.validateString(value!);
                  }),
              CommonTextField(
                  controller: ulkeController,
                  field: Constants.ulke,
                  icon: Icons.maps_home_work_sharp,
                  textInputType: TextInputType.name,
                  isMandatory: true,
                  validator: (value) {
                    return cariViewModel.validateString(value!);
                  }),
              CommonTextField(
                controller: ulkeKoduController,
                field: Constants.ulkeKodu,
                icon: Icons.maps_home_work_sharp,
                textInputType: TextInputType.number,
                isMandatory: false,
                validator: null,
              ),
              CommonTextField(
                  controller: telefon1Controller,
                  field: Constants.telefon,
                  icon: Icons.phone,
                  textInputType: TextInputType.phone,
                  isMandatory: false,
                  validator: (value) {
                    return cariViewModel.validateMobile(value!);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
