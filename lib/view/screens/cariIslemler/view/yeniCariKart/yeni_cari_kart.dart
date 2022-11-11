import 'package:dinamik_otomasyon/Model/vergi_daire_model.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/common/search_input.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_adres_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_save.model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/service/cari_services.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/cari_kartlar.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/common/common_types.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/common/list_of_types.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/yeniCariKart/cari_adres_button.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/yeniCariKart/common_textfield.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/yeniCariKart/yeni_cari_adres.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:email_validator/email_validator.dart';

class YeniCariKart extends HookConsumerWidget {
  const YeniCariKart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final cariKoduController = useTextEditingController(text: '');
    final cariUnvanController = useTextEditingController(text: '');
    final verginoController = useTextEditingController(text: '');
    final vergiDaireController = useTextEditingController(text: '');
    final vergiDaireKoduController = useTextEditingController(text: '');
    final yetkiliAdiController = useTextEditingController(text: '');
    final yetkiliSoyAdiController = useTextEditingController(text: '');
    final adres1Controller = useTextEditingController(text: '');
    final adres2Controller = useTextEditingController(text: '');
    final ilController = useTextEditingController(text: '');
    final ilceController = useTextEditingController(text: '');
    final ulkeController = useTextEditingController(text: '');
    final ulkeKoduController = useTextEditingController(text: '(90)');
    final telefon1Controller = useTextEditingController(text: '');
    final faxController = useTextEditingController(text: '');
    final mailController = useTextEditingController(text: '');

    var list = ref.watch(vergiDaireleriProvider);
    var cariAdresList = ref.watch(cariAdresProvider("003"));

    return Scaffold(
      appBar: CommonAppbar(whichPage: Constants.YENI_CARI_OLUSTUR),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          return buildSaveButton(
              context,
              formKey,
              ref,
              cariKoduController,
              cariUnvanController,
              vergiDaireController,
              vergiDaireKoduController);
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
                controller: cariKoduController,
                field: Constants.CARI_KODU,
                icon: Icons.code,
                textInputType: TextInputType.name,
                isMandatory: true,
              ),
              CommonTextField(
                controller: cariUnvanController,
                field: Constants.CARI_UNVANI,
                icon: Icons.person,
                textInputType: TextInputType.name,
                isMandatory: false,
              ),
              list.when(
                  error: (err, stack) => showAlertDialog(
                      context: context, hataBaslik: "hata", hataIcerik: "hata"),
                  loading: () => const CommonLoading(),
                  data: (data) {
                    List<VergiDaireModel> vergiDaireleri =
                        data.map((e) => e).toList();
                    return _buildVergiDairesiTextField(vergiDaireController,
                        context, vergiDaireleri, vergiDaireKoduController);
                  }),
              CommonTextField(
                controller: vergiDaireKoduController,
                field: Constants.VERGI_DAIRE_KODU,
                icon: Icons.account_balance,
                readOnly: true,
                textInputType: TextInputType.number,
                validator: (value) {
                  EmailValidator.validate(value);
                },
                isMandatory: true,
              ),
              CommonTextField(
                controller: verginoController,
                field: Constants.VERGINO,
                icon: Icons.account_balance,
                textInputType: TextInputType.number,
                validator: (value) {
                  EmailValidator.validate(value);
                },
                isMandatory: true,
              ),
              CommonTextField(
                controller: yetkiliAdiController,
                field: Constants.YETKILI_ADI,
                icon: Icons.person,
                textInputType: TextInputType.name,
                isMandatory: false,
              ),
              CommonTextField(
                controller: yetkiliSoyAdiController,
                field: Constants.YETKILI_SOYADI,
                icon: Icons.person,
                textInputType: TextInputType.name,
                isMandatory: false,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: adres1Controller,
                  keyboardType: TextInputType.name,
                  cursorColor: Color(MyColors.bg01),
                  readOnly: true,
                  style: TextStyle(
                      color: Color(
                    MyColors.bg01,
                  )),
                  decoration: InputDecoration(
                    labelText: Constants.ADRES,
                    labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(
                          MyColors.bg01,
                        )),
                    prefixIcon: Icon(
                      Icons.location_city,
                      color: Color(MyColors.bg01),
                    ),
                    suffix: InkWell(
                      child: Icon(Icons.add,
                          color: Color(
                            MyColors.bg01,
                          )),
                      onTap: () {
                        if (cariKoduController.text == "") {
                          showAlertDialog(
                            context: context,
                            hataBaslik: "Hata",
                            hataIcerik: "Önce Cari Kodu Giriniz!",
                          );
                          return;
                        }
                        showDialog(
                            context: context,
                            builder: (context) {
                              return SizedBox(
                                height: context.dynamicHeight * 0.4,
                                width: context.dynamicWidth * 0.5,
                                child: SimpleDialog(
                                  title: Text(
                                    "Adres Kartları",
                                    style: purpleBoldTxtStyle,
                                  ),
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => YeniCariAdres(
                                              cariKoduController:
                                                  cariKoduController,
                                            ),
                                          ),
                                        );
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Color(MyColors.bg01),
                                      ),
                                    ),
                                    cariAdresList.hasValue
                                        ? SizedBox(
                                            height: context.dynamicHeight * 0.4,
                                            width: context.dynamicWidth * 0.5,
                                            child: cariAdresList.when(
                                              data: (data) {
                                                List<CariAdresModel>
                                                    cariAdresler =
                                                    data.map((e) => e).toList();
                                                // if (cariAdresler.isNotEmpty) {
                                                return ListView.builder(
                                                  itemCount:
                                                      cariAdresler.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    return SimpleDialogOption(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop(
                                                          adres1Controller
                                                                  .text =
                                                              cariAdresler[
                                                                      index]
                                                                  .adrAdresNo
                                                                  .toString(),
                                                        );
                                                      },
                                                      child: Row(
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              cariAdresler[
                                                                      index]
                                                                  .adrAdresNo
                                                                  .toString(),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              cariAdresler[
                                                                      index]
                                                                  .adrUlke,
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              cariAdresler[
                                                                      index]
                                                                  .adrIl,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  },
                                                );
                                                // } else {
                                                //   return Text("Cari Adres Ekle");
                                                // }
                                              },
                                              error: (err, stack) =>
                                                  showAlertDialog(
                                                context: context,
                                                hataBaslik: "hata",
                                                hataIcerik: "hata",
                                              ),
                                              loading: () =>
                                                  const CommonLoading(),
                                            ),
                                          )
                                        : Text(
                                            "Cari Adres için butona basın",
                                            style: purpleTxtStyle,
                                          ),
                                  ],
                                ),
                              );
                            });
                      },
                    ),
                    enabledBorder: CommonInputBorder.border,
                    focusedBorder: CommonInputBorder.border,
                  ),
                ),
              ),
              CommonTextField(
                controller: faxController,
                field: Constants.FAX,
                icon: Icons.fax,
                textInputType: TextInputType.name,
                isMandatory: false,
              ),
              CommonTextField(
                controller: mailController,
                field: Constants.EMAIL,
                icon: Icons.mail,
                textInputType: TextInputType.emailAddress,
                isMandatory: false,
              ),
              CommonTypes(
                hareketTipi: Constants.HAREKET_TIPI,
                listOfTypes: ListOfTypes.hareketTipi,
              ),
              CommonTypes(
                hareketTipi: Constants.BAGLANTI_TIPI,
                listOfTypes: ListOfTypes.baglantiTipi,
              ),
              CommonTypes(
                hareketTipi: Constants.STOK_ALIM_CINSI,
                listOfTypes: ListOfTypes.stokAlimCinsi,
              ),
              CommonTypes(
                hareketTipi: Constants.STOK_SATIS_CINSI,
                listOfTypes: ListOfTypes.stokSatimCinsi,
              ),
              CommonTypes(
                hareketTipi: Constants.CARI_ODEME_SEKLI,
                listOfTypes: ListOfTypes.cariOdemeSekli,
              ),
              CommonTypes(
                hareketTipi: Constants.CARI_EFATURA_CINSI,
                listOfTypes: ListOfTypes.cariEfaturaCinsi,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> buildSaveButton(
    BuildContext context,
    GlobalKey<FormState> formKey,
    WidgetRef ref,
    TextEditingController cariKoduController,
    TextEditingController cariUnvanController,
    TextEditingController vergiDaireAdiController,
    TextEditingController vergiDaireKoduController,
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
                                onPressed: () => Navigator.pop(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const CariKartlar())),
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

  _buildVergiDairesiTextField(
      TextEditingController vergiDaireController,
      context,
      List<VergiDaireModel> list,
      TextEditingController vergiDaireKoduController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) => value!.isEmpty ? "Vergi No Boş Olamaz!" : null,
        controller: vergiDaireController,
        keyboardType: TextInputType.name,
        cursorColor: Color(MyColors.bg01),
        readOnly: true,
        style: TextStyle(
            color: Color(
          MyColors.bg01,
        )),
        decoration: InputDecoration(
          labelText: Constants.VERGI_DAIRESI_SECINIZ,
          labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(
                MyColors.bg01,
              )),
          prefixIcon: Icon(
            Icons.account_balance,
            color: Color(MyColors.bg01),
          ),
          suffix: InkWell(
            onTap: () {
              showVergiDaireleri(context, list, vergiDaireController,
                  vergiDaireKoduController);
            },
            child: Icon(Icons.replay_outlined,
                color: Color(
                  MyColors.bg01,
                )),
          ),
          enabledBorder: CommonInputBorder.border,
          focusedBorder: CommonInputBorder.border,
        ),
      ),
    );
  }

  showVergiDaireleri(
      context,
      List<VergiDaireModel> list,
      TextEditingController vergiDaireController,
      TextEditingController vergiDaireKoduController) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            "Vergi Dairesi Seçiniz",
            style: purpleBoldTxtStyle,
          ),
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: SearchInput(),
            ),
            SizedBox(
              height: context.dynamicHeight * 0.4,
              width: context.dynamicWidth * 0.5,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return SimpleDialogOption(
                    onPressed: () {
                      vergiDaireController.text = list[index].vergiDaireAdi;
                      vergiDaireKoduController.text =
                          list[index].vergiDaireKodu;
                      Navigator.of(context).pop(VergiDaireModel(
                          vergiDaireKodu: list[index].vergiDaireKodu,
                          vergiDaireAdi: list[index].vergiDaireAdi,
                          vergiDaireIl: list[index].vergiDaireIl));
                    },
                    child: Text(
                      list[index].vergiDaireAdi,
                      style: purpleTxtStyle,
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
}
