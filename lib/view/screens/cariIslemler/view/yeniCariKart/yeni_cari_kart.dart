import 'package:dinamik_otomasyon/Model/vergi_daire_model.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/common/search_input.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/viewmodel/login_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/common/common_types.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/common/list_of_types.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/common/save_button.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/yeniCariKart/cari_adres_list.dart';
import 'package:dinamik_otomasyon/view/common/common_textfield.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class YeniCariKart extends HookConsumerWidget {
  CariViewModel cariViewModel = CariViewModel();
  YeniCariKart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final GlobalKey<FormState> dropdownKey = GlobalKey<FormState>();
    final cariKoduController = useTextEditingController(text: '');
    final cariUnvanController = useTextEditingController(text: '');
    final verginoController = useTextEditingController(text: '');
    final vergiDaireController = useTextEditingController(text: '');
    final vergiDaireKoduController = useTextEditingController(text: '');
    final yetkiliAdiController = useTextEditingController(text: '');
    final yetkiliSoyAdiController = useTextEditingController(text: '');
    final adres1Controller = useTextEditingController(text: '');
    final faxController = useTextEditingController(text: '');
    final mailController = useTextEditingController(text: '');
    final hareketTipiSelectedItemIndex = useState(0);
    final baglantiTipiSelectedItemIndex = useState(0);
    final stokAlimCinsiSelectedItemIndex = useState(0);
    final stokSatisCinsiSelectedItemIndex = useState(0);
    final cariOdemeSekliSelectedItemIndex = useState(0);
    final cariFaturaCinsiTipiSelectedItemIndex = useState(0);
    final selectedItemDropDown = useState("Hareket Tipi");

    var list = ref.watch(vergiDaireleriProvider);
    var currentUser = ref.watch(currentUserProvider);
    var cariControl = ref.watch(cariKayitliMi);
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
            vergiDaireKoduController,
            currentUser.currentUser!.kullaniciNo,
            currentUser.currentUser!.kullaniciNo,
          );
        },
        backgroundColor: Color(MyColors.bg01),
        child: const Icon(
          Icons.save,
        ),
      ),
      //CARİ KOD
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              cariKoduTextField(cariControl, context, cariKoduController),
              CommonTextField(
                  controller: cariUnvanController,
                  field: Constants.CARI_UNVANI,
                  icon: Icons.person,
                  textInputType: TextInputType.name,
                  isMandatory: false,
                  validator: (value) {
                    return cariViewModel.validateString(value!);
                  }),
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
                isMandatory: true,
                validator: null,
              ),
              CommonTextField(
                  controller: verginoController,
                  field: Constants.VERGINO,
                  icon: Icons.account_balance,
                  textInputType: TextInputType.number,
                  isMandatory: true,
                  validator: (value) {
                    return cariViewModel.validateVergiTcNo(value!);
                  }),
              CommonTextField(
                  controller: yetkiliAdiController,
                  field: Constants.YETKILI_ADI,
                  icon: Icons.person,
                  textInputType: TextInputType.name,
                  isMandatory: false,
                  validator: (value) {
                    return cariViewModel.validateString(value!);
                  }),
              CommonTextField(
                  controller: yetkiliSoyAdiController,
                  field: Constants.YETKILI_SOYADI,
                  icon: Icons.person,
                  textInputType: TextInputType.name,
                  isMandatory: false,
                  validator: (value) {
                    return cariViewModel.validateString(value!);
                  }),
              buildAdresTextField(
                  adres1Controller, cariKoduController, context),
              CommonTextField(
                  controller: faxController,
                  field: Constants.FAX,
                  icon: Icons.fax,
                  textInputType: TextInputType.name,
                  isMandatory: false,
                  validator: (value) {
                    return cariViewModel.validateString(value!);
                  }),
              CommonTextField(
                  controller: mailController,
                  field: Constants.EMAIL,
                  icon: Icons.mail,
                  textInputType: TextInputType.emailAddress,
                  isMandatory: false,
                  validator: (value) {
                    return cariViewModel.validateEmail(value!);
                  }),
              CommonTypes(
                hareketTipi: Constants.HAREKET_TIPI,
                listOfTypes: ListOfTypes.hareketTipi,
                selectedItemIndex: hareketTipiSelectedItemIndex.value,
              ),
              const SizedBox(
                height: 200,
              ),

              // CommonTypes(
              //   hareketTipi: Constants.BAGLANTI_TIPI,
              //   listOfTypes: ListOfTypes.baglantiTipi,
              //   selectedItemIndex: baglantiTipiSelectedItemIndex.value,
              // ),
              // CommonTypes(
              //   hareketTipi: Constants.STOK_ALIM_CINSI,
              //   listOfTypes: ListOfTypes.stokAlimCinsi,
              //   selectedItemIndex: stokAlimCinsiSelectedItemIndex.value,
              // ),
              // CommonTypes(
              //   hareketTipi: Constants.STOK_SATIS_CINSI,
              //   listOfTypes: ListOfTypes.stokSatimCinsi,
              //   selectedItemIndex: stokSatisCinsiSelectedItemIndex.value,
              // ),
              // CommonTypes(
              //   hareketTipi: Constants.CARI_ODEME_SEKLI,
              //   listOfTypes: ListOfTypes.cariOdemeSekli,
              //   selectedItemIndex: cariOdemeSekliSelectedItemIndex.value,
              // ),
              // CommonTypes(
              //   hareketTipi: Constants.CARI_EFATURA_CINSI,
              //   listOfTypes: ListOfTypes.cariEfaturaCinsi,
              //   selectedItemIndex: cariFaturaCinsiTipiSelectedItemIndex.value,
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildAdresTextField(TextEditingController adres1Controller,
      TextEditingController cariKoduController, BuildContext context) {
    return Padding(
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
              cariKoduController.text.isEmpty
                  ? showAlertDialog(
                      context: context,
                      hataBaslik: "Hata",
                      hataIcerik: "Önce Cari Kodu Giriniz!",
                    )
                  : Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CariAdresList(
                            cariKoduController: cariKoduController,
                            adresNoController: adres1Controller),
                      ),
                    );
            },
          ),
          enabledBorder: CommonInputBorder.border,
          focusedBorder: CommonInputBorder.border,
        ),
      ),
    );
  }

  Padding cariKoduTextField(CariViewModel cariControl, BuildContext context,
      TextEditingController cariKoduController) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: TextFormField(
          onFieldSubmitted: (value) {
            cariControl.getAndControlCari(value, context);
          },
          onChanged: (value) {
            cariViewModel.validateString(value);
          },
          validator: (value) {
            return cariViewModel.validateString(value!);
          },
          readOnly: false,
          controller: cariKoduController,
          keyboardType: TextInputType.text,
          cursorColor: Color(MyColors.bg01),
          style: TextStyle(
            color: Color(
              MyColors.bg01,
            ),
          ),
          decoration: InputDecoration(
            labelText: "Cari Kod",
            labelStyle: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(
                MyColors.bg01,
              ),
            ),
            prefixIcon: Icon(
              Icons.abc,
              color: Color(MyColors.bg01),
            ),
            enabledBorder: CommonInputBorder.border,
            focusedBorder: CommonInputBorder.border,
          ),
        ));
  }

  _buildVergiDairesiTextField(
      TextEditingController vergiDaireController,
      context,
      List<VergiDaireModel> list,
      TextEditingController vergiDaireKoduController) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        validator: (value) =>
            value!.isEmpty ? "Vergi Dairesi Boş Olamaz!" : null,
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
            child: Icon(Icons.question_mark,
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
