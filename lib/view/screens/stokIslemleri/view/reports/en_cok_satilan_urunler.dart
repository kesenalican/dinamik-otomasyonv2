import 'package:dinamik_otomasyon/core/base/state/base_state.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/show_date_picker.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/reports/en_cok_satilan_urun_list.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class EnCokSatilanUrunler extends StatefulWidget {
  const EnCokSatilanUrunler({super.key});

  @override
  State<EnCokSatilanUrunler> createState() => _EnCokSatilanUrunlerState();
}

class _EnCokSatilanUrunlerState extends BaseState<EnCokSatilanUrunler> {
  bool isSelected = false;
  DateTime dateTimeBaslangic = DateTime.parse(DateTime.now().toString());
  DateTime dateTimeBitis = DateTime.parse("${DateTime.now().year}-01-01");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CommonAppbar(
        whichPage: 'En Çok Satılan Ürünler',
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(context.dynamicWidth * 0.007),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(MyColors.bg02),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Color(MyColors.bg01),
                  ),
                ),
                child: SizedBox(
                  height: context.dynamicHeight * 0.05,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              "Başlangıç Tarihi",
                              style: purpleTxtStyle,
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              ":",
                              style: purpleBoldTxtStyle,
                            )),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            child: Text(
                              "${dateTimeBitis.year}-${dateTimeBitis.month}-${dateTimeBitis.day}",
                              style: purpleBoldTxtStyle.copyWith(fontSize: 14),
                            ),
                            onTap: () async {
                              await showDatePicker(
                                      context: context,
                                      initialDate: dateTimeBitis,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2030))
                                  .then((secilenTarih) {
                                dateTimeBitis = secilenTarih!;
                                setState(() {});
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(context.dynamicWidth * 0.007),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(MyColors.bg02),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 3), // changes position of shadow
                    ),
                  ],
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    width: 2,
                    color: Color(MyColors.bg01),
                  ),
                ),
                child: SizedBox(
                  height: context.dynamicHeight * 0.05,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              "Bitiş Tarihi",
                              style: purpleTxtStyle,
                            )),
                        Expanded(
                            flex: 1,
                            child: Text(
                              ":",
                              style: purpleBoldTxtStyle,
                            )),
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            child: Text(
                              "${dateTimeBaslangic.year}-${dateTimeBaslangic.month}-${dateTimeBaslangic.day}",
                              style: purpleBoldTxtStyle.copyWith(fontSize: 14),
                            ),
                            onTap: () async {
                              await showDatePicker(
                                      context: context,
                                      initialDate: dateTimeBaslangic,
                                      firstDate: DateTime(2000),
                                      lastDate: DateTime(2030))
                                  .then((secilenTarih) {
                                dateTimeBaslangic = secilenTarih!;
                                setState(() {});
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            _buildListeleButton(),
            isSelected
                ? SingleChildScrollView(
                    child: LiquidPullToRefresh(
                      onRefresh: handleRefresh,
                      color: Color(
                        MyColors.bg01,
                      ),
                      height: context.dynamicHeight * 0.1,
                      animSpeedFactor: 2,
                      child: SizedBox(
                        height: context.dynamicHeight * 0.75,
                        width: double.infinity,
                        child: EnCokSatilanList(
                          tarih: dateTimeBaslangic.toString(),
                        ),
                      ),
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }

  Future<void> handleRefresh() async {
    return await Future.delayed(
      const Duration(seconds: 2),
      () {},
    );
  }

  _buildListeleButton() {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSelected = true;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: dynamicWidth(0.03), vertical: dynamicHeight(0.01)),
        padding: paddingDefault,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color(MyColors.bg01),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Color(MyColors.bg01),
          ),
        ),
        child: const Center(
          child: Text(
            Constants.HEPSINI_LISTELE,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  // Future<dynamic> showCupertinoDatePicker(BuildContext context) {
  //   return showModalBottomSheet(
  //       context: context,
  //       builder: (BuildContext bc) {
  //         return Container(
  //             height: MediaQuery.of(context).copyWith().size.height / 3,
  //             child: CupertinoDatePicker(
  //               onDateTimeChanged: (DateTime newdate) {
  //                 setState(() {
  //                   _dateTime = newdate;
  //                 });
  //               },
  //               maximumYear: DateTime.now().year,
  //               initialDateTime: DateTime.now(),
  //               mode: CupertinoDatePickerMode.date,
  //             ));
  //       });
  // }
}
