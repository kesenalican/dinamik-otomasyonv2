// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dinamik_otomasyon/view/common/common_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_textfield.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/common/iskonto_page.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/commonTextField/stok_kod_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';

// ignore: must_be_immutable
class SiparisSatiri extends HookConsumerWidget {
  TextEditingController stokKoduController;
  TextEditingController stokIsmiController;
  TextEditingController stokMiktariController;
  TextEditingController stokBirimController;
  TextEditingController birimFiyatController;
  TextEditingController sipTutariController;
  SiparisSatiri({
    super.key,
    required this.stokKoduController,
    required this.stokIsmiController,
    required this.stokMiktariController,
    required this.stokBirimController,
    required this.birimFiyatController,
    required this.sipTutariController,
  });
  siparisTemizle() {
    stokKoduController.clear();
    stokIsmiController.clear();
    stokMiktariController.clear();
    stokBirimController.clear();
    birimFiyatController.clear();
    sipTutariController.clear();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    CariViewModel cariViewModel = CariViewModel();
    var viewModel = ref.watch(satisSiparisViewModel);
    return Scaffold(
      appBar: CommonAppbar(
        whichPage: "Sipariş Oluştur",
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
            CommonButton(buttonName: "Kaydet ve Yeni Ürün Gir"),
            InkWell(
              onTap: () {
                Navigator.of(context).pop(SiparisSatiri(
                    stokKoduController: stokKoduController,
                    stokIsmiController: stokIsmiController,
                    stokMiktariController: stokMiktariController,
                    stokBirimController: stokBirimController,
                    birimFiyatController: birimFiyatController,
                    sipTutariController: sipTutariController));
                siparisTemizle();
              },
              child: CommonButton(
                buttonName: "Kaydet ve Çık",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
