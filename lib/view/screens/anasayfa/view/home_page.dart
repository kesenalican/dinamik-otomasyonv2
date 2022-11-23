import 'package:dinamik_otomasyon/Model/module_name.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:dinamik_otomasyon/view/common/common_drawer.dart';
import 'package:dinamik_otomasyon/view/common/module_card_button.dart';
import 'package:dinamik_otomasyon/view/common/search_input.dart';
import 'package:dinamik_otomasyon/view/screens/module_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class HomePage extends ConsumerStatefulWidget {
  String? sirketAdi;

  HomePage({
    Key? key,
    required this.sirketAdi,
  }) : super(key: key);

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(whichPage: Constants.ANASAYFA),
      drawer: DrawerMenu(sirketAdi: widget.sirketAdi!),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth * 0.02),
        child: ListView(
          children: [
            //SizedBox(height:dynamicHeight(0.01)),
            const SearchInput(),
            SizedBox(
              height: context.dynamicHeight * 0.02,
            ),
            _buildKartlarText(),
            SizedBox(
              height: context.dynamicHeight * 0.02,
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.pushNamed(context, '/stokKartlari', arguments: {});
              },
              cardName: Modules[0],
              iconData: const Icon(Icons.attach_money_rounded),
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.pushNamed(context, '/cariKartlar');
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

            //Text(ref.read(userCodeValue).toString()),
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
          style: context.theme.textTheme.headline6,
        ),
      ],
    );
  }
}
