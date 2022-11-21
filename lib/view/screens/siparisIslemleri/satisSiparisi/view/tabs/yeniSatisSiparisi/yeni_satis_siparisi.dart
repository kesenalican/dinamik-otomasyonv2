import 'package:dinamik_otomasyon/Model/kur_model.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/service/Providers/all_providers.dart';
import 'package:dinamik_otomasyon/view/common/common_error_dialog.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/common/common_loading.dart';
import 'package:dinamik_otomasyon/view/common/common_textfield.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/cari_kartlar.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/viewmodel/cari_view_model.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/common/cari_kod_text_field.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/view/common/kur_text_field.dart';
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
    final dovizController = useTextEditingController(text: '');
    final projeController = useTextEditingController(text: '');
    final sormMerkeziController = useTextEditingController(text: '');
    final odemePlaniController = useTextEditingController(text: '');
    final depoController = useTextEditingController(text: '');
    final saticiController = useTextEditingController(text: '');
    final teslimTuruController = useTextEditingController(text: '');
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
          ],
        ),
      ),
    );
  }

  Row buildEvrakNoTextField(TextEditingController evrakSeriController, TextEditingController evrakNoController) {
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
