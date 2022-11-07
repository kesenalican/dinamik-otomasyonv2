import 'package:dinamik_otomasyon/Model/module_name.dart';
import 'package:dinamik_otomasyon/core/base/state/base_state.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_drawer.dart';
import 'package:dinamik_otomasyon/view/common/module_card_button.dart';
import 'package:dinamik_otomasyon/view/common/search_input.dart';
import 'package:dinamik_otomasyon/view/screens/module_card.dart';
import 'package:dinamik_otomasyon/view/screens/stokIslemleri/view/stok_karti.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String? sirketAdi;

  HomePage({
    Key? key,
    required this.sirketAdi,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(whichPage: Constants.ANASAYFA),
      drawer: DrawerMenu(sirketAdi: widget.sirketAdi!),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: dynamicWidth(0.02)),
        child: ListView(
          children: [
            //SizedBox(height:dynamicHeight(0.01)),
            const SearchInput(),
            SizedBox(
              height: dynamicHeight(0.02),
            ),
            _buildKartlarText(),
            SizedBox(
              height: dynamicHeight(0.02),
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StokKartlari()));
              },
              cardName: Modules[0],
              iconData: const Icon(Icons.attach_money_rounded),
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScheduleTab(
                              cardName: Modules[1],
                            )));
              },
              cardName: Modules[1],
              iconData: const Icon(Icons.account_tree_sharp),
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScheduleTab(
                              cardName: Modules[2],
                            )));
              },
              cardName: Modules[2],
              iconData: const Icon(Icons.info_outline_rounded),
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScheduleTab(
                              cardName: Modules[3],
                            )));
              },
              cardName: Modules[3],
              iconData: const Icon(Icons.warehouse),
            ),
          ],
        ),
      ),
    );
  }

  Row _buildKartlarText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          Constants.KARTLAR,
          style: theme.textTheme.headline6,
        ),
      ],
    );
  }
}
