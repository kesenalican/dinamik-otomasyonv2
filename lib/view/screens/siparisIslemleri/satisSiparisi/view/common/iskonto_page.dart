// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dinamik_otomasyon/view/common/common_textfield.dart';
import 'package:dinamik_otomasyon/view/screens/siparisIslemleri/satisSiparisi/viewmodel/satis_siparisi_view_model.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class IskontoEkle extends ConsumerWidget {
  TextEditingController? isk1Controller;
  TextEditingController? isk2Controller;
  TextEditingController? isk3Controller;
  TextEditingController? isk4Controller;
  TextEditingController? isk5Controller;
  TextEditingController? isk6Controller;
  TextEditingController? sipTutariController;
  TextEditingController? mas1Controller;
  TextEditingController? mas2Controller;
  TextEditingController? mas3Controller;
  TextEditingController? mas4Controller;
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
    this.sipTutariController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var viewModel = ref.watch(satisSiparisViewModel);
    return Scaffold(
      appBar: CommonAppbar(whichPage: "İskonto ve Masraflar"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(
            context,
            sipTutariController,
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
                isk: "İskonto 1",
                viewModel: viewModel,
                iskController: isk1Controller!,
              ),
              buildIskontoLine(
                context,
                isk: "İskonto 2",
                viewModel: viewModel,
                iskController: isk2Controller!,
              ),
              buildIskontoLine(
                context,
                isk: "İskonto 3",
                viewModel: viewModel,
                iskController: isk3Controller!,
              ),
              buildIskontoLine(
                context,
                isk: "İskonto 4",
                viewModel: viewModel,
                iskController: isk4Controller!,
              ),
              buildIskontoLine(
                context,
                isk: "İskonto 5",
                viewModel: viewModel,
                iskController: isk5Controller!,
              ),
              buildIskontoLine(
                context,
                isk: "İskonto 6",
                viewModel: viewModel,
                iskController: isk6Controller!,
              ),
              Center(
                child: Text(
                  "Masraflar",
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
                mas: "Masraf 1",
                masController: mas1Controller!,
              ),
              buildMasLine(
                context,
                viewModel: viewModel,
                mas: "Masraf 2",
                masController: mas2Controller!,
              ),
              buildMasLine(
                context,
                viewModel: viewModel,
                mas: "Masraf 3",
                masController: mas3Controller!,
              ),
              buildMasLine(
                context,
                viewModel: viewModel,
                mas: "Masraf 4",
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
                  context, value!, iskController, sipTutariController!);
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
              viewModel.calculateTotalPriceWithDiscount(
                  context, value!, masController, sipTutariController!);
            },
          ),
        ),
      ],
    );
  }
}
