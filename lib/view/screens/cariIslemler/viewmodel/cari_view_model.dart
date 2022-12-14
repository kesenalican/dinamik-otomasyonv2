import 'package:dinamik_otomasyon/View/styles/colors.dart';
import 'package:dinamik_otomasyon/core/constants/api_constant.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_save.model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cariKayitliMi = ChangeNotifierProvider((ref) => CariViewModel());

class CariViewModel extends ChangeNotifier {
  late List<Cariler> cariKoduVarmi;
  late List<Cariler> cariKodSorgula = [];
  getAndControlCari(String cariKod, context) async {
    final result = await Dio()
        .get('${ConstantProvider.baseUrl}${ConstantProvider.fullCari}');
    if (result.statusCode == 200) {
      List<Map<String, dynamic>> mapData = List.from(result.data);
      List<Cariler> cariList = mapData.map((e) => Cariler.fromMap(e)).toList();
      cariKoduVarmi =
          cariList.where((element) => element.cariKodu == cariKod).toList();
      notifyListeners();
      if (cariKoduVarmi.isNotEmpty) {
        return Future.delayed(const Duration(milliseconds: 500), () {
          return showAlertDialog(
            context: context,
            hataBaslik: Constants.hataBaslik,
            hataIcerik: Constants.cariKodKayitli,
          );
        });
      }
    } else {
      return false;
    }
  }

  searchCari(String cariUnvan, String cariKodu) async {
    final map = {
      'CariKodu': cariKodu,
      'cariUnvani': cariUnvan,
    };
    final result = await Dio().get(
        '${ConstantProvider.baseUrl}${ConstantProvider.searchCari}',
        queryParameters: map);
    if (result.statusCode == 200) {
      List<Map<String, dynamic>> mapData = List.from(result.data);
      List<Cariler> cariList = mapData.map((e) => Cariler.fromMap(e)).toList();
      cariKodSorgula = cariList
          .where((element) =>
              element.cariUnvani1!
                  .toLowerCase()
                  .contains(cariUnvan.toLowerCase()) ||
              element.cariKodu.toLowerCase().contains(cariKodu.toLowerCase()))
          .toList();
      notifyListeners();
      return cariKodSorgula;
    }
  }

  validateIsNotEmpty(String value) {
    if (value.isEmpty) {
      return 'Bu alan bo?? olamaz!';
    }
  }

  validateAdresNo(String value) {
    if (value.isEmpty) {
      return 'Adres No bo?? olamaz';
    }
  }

  validateVergiTcNo(String value) {
    if (value.length < 10) {
      return 'Vergi Numaras?? 10 haneden az olamaz!';
    }
  }

  validateString(String value) {
    if (value.length < 2) {
      return 'De??er 2 haneden az olamaz!';
    }
  }

  validateMobile(String value) {
    if (value.length != 10) {
      return 'L??tfen ba????nda 0 olmadan ge??erli bir telefon numaras?? giriniz!';
    }
  }

  validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    notifyListeners();
    if (!regex.hasMatch(value)) {
      return 'Ge??erli bir mail adresi giriniz!';
    }
  }

  saveCari(CariModel cari) async {
    // try {
    final result = await Dio().post(
      '${ConstantProvider.baseUrl}CariBilgiler',
      data: cari.toMap().toString(),
    );
    if (result.statusCode == 200) {
      return result;
    }
  }
}

class OpenBarcod extends HookWidget {
  const OpenBarcod({super.key});
  @override
  Widget build(BuildContext context) {
    // final barcode = useState('unknown');
    return InkWell(
      onTap: scanBarcode,
      child: CircleAvatar(
        backgroundColor: Color(MyColors.bg01),
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}

Future<void> scanBarcode() async {
  try {
    // final barcode = await FlutterBarcodeScanner.scanBarcode(
    //   '#ff0000',
    //   'Cancel',
    //   true,
    //   ScanMode.BARCODE,
    // );
  } catch (e) {
    return;
  }
}
