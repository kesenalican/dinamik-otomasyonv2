import 'dart:convert';

import 'package:dinamik_otomasyon/Model/city_model.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_adres_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/service/cari_services.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/choose_city.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/yeniCariKart/common_textfield.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class YeniCariAdres extends HookConsumerWidget {
  final TextEditingController cariKoduController;
  const YeniCariAdres({super.key, required this.cariKoduController});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _isLoadingFinish = useState(false);
    final _selectedCity = useState('');
    final _selectedCounty = useState('');
    final _cityChosen = useState(false);
    final _countyChosen = useState(false);
    final cityList = useState(<City>[]);
    final cityNameList = useState(<City>[]);
    final countyNameList = useState(<County>[]);
    final selectedCityIndex = useState(int);
    final selectedCountyIndex = useState(int);
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
    Future<void> getCities() async {
      String jsonString = await rootBundle.loadString('json/il-ilce.json');
      final jsonResponse = json.decode(jsonString);
      cityList.value = jsonResponse.map((x) => City.fromJson(x)).toList();
    }

    void getCityNames() {
      cityNameList.value = [];

      for (var element in cityList.value) {
        cityNameList.value.add(element.cityName as City);
      }
      _isLoadingFinish.value = true;
    }

    Future<void> selectCityPage() async {
      if (_isLoadingFinish.value) {
        selectedCityIndex.value = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChooseCity(
              cityNames: cityNameList.value,
            ),
          ),
        );
        _cityChosen.value = true;
      }
    }

    useEffect(() {
      getCities().then(
        (value) => getCityNames(),
      );
      return () {
        getCities();
      };
    }, [cityList]);
    _selectedCity.value = ilController.text;
    _selectedCounty.value = ilceController.text;
    return Scaffold(
      appBar: CommonAppbar(whichPage: Constants.YENI_CARI_ADRES_OLUSTUR),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          if (!formKey.currentState!.validate()) {
            return;
          }
          ref
              .watch(cariAdresSaveProvider(CariAdresModel(
            adrAdresNo: int.parse(adresNoController.text),
            adrCariKod: cariKoduController.text,
            adrCreateUser: 0,
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
                      "Cari Adres Başarıyla Kaydedildi!",
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
                          Constants.OK,
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
                field: "Adres No",
                icon: Icons.map,
                textInputType: TextInputType.number,
                isMandatory: true,
              ),
              CommonTextField(
                controller: cariKoduController,
                field: Constants.CARI_KODU,
                icon: Icons.map,
                textInputType: TextInputType.name,
                isMandatory: true,
                readOnly: true,
              ),
              CommonTextField(
                controller: caddeController,
                field: "Cadde",
                icon: Icons.map,
                textInputType: TextInputType.name,
                isMandatory: false,
              ),
              CommonTextField(
                controller: mahalleController,
                field: "Mahalle",
                icon: Icons.map,
                textInputType: TextInputType.name,
                isMandatory: false,
              ),
              CommonTextField(
                controller: sokakController,
                field: "Sokak",
                icon: Icons.map,
                textInputType: TextInputType.name,
                isMandatory: false,
              ),
              InkWell(
                onTap: () async {},
                child: CommonTextField(
                  controller: ilController,
                  field: Constants.IL,
                  icon: Icons.map,
                  textInputType: TextInputType.name,
                  isMandatory: true,
                  readOnly: true,
                ),
              ),
              CommonTextField(
                controller: ilceController,
                field: Constants.ILCE,
                icon: Icons.maps_home_work,
                textInputType: TextInputType.name,
                isMandatory: true,
              ),
              CommonTextField(
                controller: ulkeController,
                field: Constants.ULKE,
                icon: Icons.maps_home_work_sharp,
                textInputType: TextInputType.name,
                isMandatory: true,
              ),
              CommonTextField(
                controller: ulkeKoduController,
                field: Constants.ULKE_KODU,
                icon: Icons.maps_home_work_sharp,
                textInputType: TextInputType.number,
                isMandatory: false,
              ),
              CommonTextField(
                controller: telefon1Controller,
                field: Constants.TELEFON,
                icon: Icons.phone,
                textInputType: TextInputType.phone,
                isMandatory: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
