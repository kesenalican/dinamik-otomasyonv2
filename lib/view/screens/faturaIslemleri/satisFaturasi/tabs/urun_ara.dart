import 'package:dinamik_otomasyon/View/common/search_input.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import '../../../../../core/base/state/base_state.dart';
import '../../../../common/common_button.dart';
import '../../../../styles/colors.dart';

class UrunAra extends StatefulWidget {
  const UrunAra({Key? key}) : super(key: key);

  @override
  State<UrunAra> createState() => _UrunAraState();
}

class _UrunAraState extends BaseState<UrunAra> {
  @override
  Widget build(BuildContext context) {
    List<bool> isSelected = [true, false];
    return SingleChildScrollView(
      child: Column(
        children: [
          //ÜRÜN FİLTRELEME KISMI
          Container(
            margin: paddingDefault,
            child: Column(
              children: [
                //STOK KARTI / HİZMET KARTI
                ToggleButtons(
                  fillColor: Color(MyColors.bg01),
                  onPressed: (int newIndex) {
                    setState(() {
                      for (int index = 0; index < isSelected.length; index++) {
                        if (index == newIndex) {
                          isSelected[index] = true;
                        } else {
                          isSelected[index] = false;
                        }
                      }
                    });
                  },
                  color: Color(MyColors.bg01),
                  selectedColor: Colors.white,
                  isSelected: isSelected,
                  borderRadius: BorderRadius.circular(10),
                  children: [
                    Padding(
                      padding: paddingDefault,
                      child: const Text(Constants.STOK_KARTLARI),
                    ),
                    Padding(
                      padding: paddingDefault,
                      child: const Text(
                        Constants.HIZMET_KARTI,
                      ),
                    ),
                  ],
                ),

                const SearchInput(),
                CommonButton(
                  buttonName: Constants.URUN_ARA,
                ),
              ],
            ),
          ),
          //ÜRÜN ARAMA KISMI
        ],
      ),
    );
  }
}
