import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/common/common_textfield.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IskontoEkle extends ConsumerWidget {
  final TextEditingController? isk1Controller;
  final TextEditingController? isk2Controller;
  final TextEditingController? isk3Controller;
  final TextEditingController? isk4Controller;
  final TextEditingController? isk5Controller;
  final TextEditingController? isk6Controller;
  final TextEditingController? mas1Controller;
  final TextEditingController? mas2Controller;
  final TextEditingController? mas3Controller;
  final TextEditingController? mas4Controller;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  IskontoEkle({
    super.key,
    this.isk1Controller,
    this.isk2Controller,
    this.isk3Controller,
    this.isk4Controller,
    this.isk5Controller,
    this.isk6Controller,
    this.mas1Controller,
    this.mas2Controller,
    this.mas3Controller,
    this.mas4Controller,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(satisSiparisViewModel);
    return Scaffold(
      appBar: CommonAppbar(whichPage: Constants.iskontoVeMasraflar),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
          );
        },
        backgroundColor: Color(MyColors.bg01),
        child: const Icon(
          Icons.save,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildIskontoLine(
                context,
                isk: Constants.iskonto1,
                viewModel: viewModel,
                iskController: isk1Controller!,
              ),
              buildIskontoLine(
                context,
                isk: Constants.iskonto2,
                viewModel: viewModel,
                iskController: isk2Controller!,
              ),
              buildIskontoLine(
                context,
                isk: Constants.iskonto3,
                viewModel: viewModel,
                iskController: isk3Controller!,
              ),
              buildIskontoLine(
                context,
                isk: Constants.iskonto4,
                viewModel: viewModel,
                iskController: isk4Controller!,
              ),
              buildIskontoLine(
                context,
                isk: Constants.iskonto5,
                viewModel: viewModel,
                iskController: isk5Controller!,
              ),
              buildIskontoLine(
                context,
                isk: Constants.iskonto6,
                viewModel: viewModel,
                iskController: isk6Controller!,
              ),
              Center(
                child: Text(
                  Constants.masraflar,
                  style: purpleBoldTxtStyle,
                ),
              ),
              Divider(
                color: Color(
                  MyColors.bg01,
                ),
                indent: 50,
                endIndent: 50,
                thickness: 2,
              ),
              buildMasLine(
                context,
                viewModel: viewModel,
                mas: Constants.masraf1,
                masController: mas1Controller!,
              ),
              buildMasLine(
                context,
                viewModel: viewModel,
                mas: Constants.masraf2,
                masController: mas2Controller!,
              ),
              buildMasLine(
                context,
                viewModel: viewModel,
                mas: Constants.masraf3,
                masController: mas3Controller!,
              ),
              buildMasLine(
                context,
                viewModel: viewModel,
                mas: Constants.masraf4,
                masController: mas4Controller!,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row buildIskontoLine(
    context, {
    required SatisSiparisiViewModel viewModel,
    required String isk,
    required TextEditingController iskController,
  }) {
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            validator: (p0) => null,
            controller: iskController,
            field: isk,
            icon: Icons.discount,
            isMandatory: false,
            textInputType: TextInputType.number,
            onFieldSubmit: (value) {
              viewModel.calculateTotalPriceWithDiscount(
                  context,
                  value!,
                  isk1Controller!,
                  isk2Controller!,
                  isk3Controller!,
                  isk4Controller!,
                  isk5Controller!,
                  isk5Controller!);
            },
          ),
        ),
      ],
    );
  }

  Row buildMasLine(
    context, {
    required SatisSiparisiViewModel viewModel,
    required String mas,
    required TextEditingController masController,
  }) {
    return Row(
      children: [
        Expanded(
          child: CommonTextField(
            validator: (p0) => null,
            controller: masController,
            field: mas,
            icon: Icons.discount,
            isMandatory: false,
            textInputType: TextInputType.number,
            onFieldSubmit: (value) {
              // viewModel.calculateTotalPriceWithDiscount(
              //     context, value!, masController, kdvsizTutar!);
            },
          ),
        ),
      ],
    );
  }
}
