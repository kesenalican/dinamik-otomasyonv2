import 'package:dinamik_otomasyon/View/styles/colors.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cari_save.model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/service/cari_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CariViewModel {
  saveCari(CariModel cari) async {
    try {
      final result = await Dio().post(
        "${ConstantProvider.BASE_URL}CariBilgiler",
        data: cari.toMap().toString(),
        options: Options(
          headers: {"Content-Type": "application/json"},
          responseType: ResponseType.json,
        ),
      );
      if (result.statusCode == 200) {
        return result;
      }
    } on DioError catch (e) {
      print("Type: ${e.type.toString()}");
      print("Message: ${e.message}");
      print("Error: ${e.error}");
    }
  }
}

class OpenBarcod extends HookWidget {
  const OpenBarcod({super.key});
  @override
  Widget build(BuildContext context) {
    final barcode = useState('unknown');
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
    final barcode = await FlutterBarcodeScanner.scanBarcode(
      "#ff0000",
      "Cancel",
      true,
      ScanMode.BARCODE,
    );
  } catch (e) {
    return;
  }
}
