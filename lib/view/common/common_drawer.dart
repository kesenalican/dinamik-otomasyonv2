import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/cari_kartlar.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/constant.dart';
import '../screens/module_card.dart';
import '../styles/colors.dart';
import '../../core/components/menu_components.dart';

class DrawerMenu extends ConsumerStatefulWidget {
  final String sirketAdi;
  const DrawerMenu({Key? key, required this.sirketAdi}) : super(key: key);

  @override
  ConsumerState<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu> {
  List<Menu> data = [];

  @override
  void initState() {
    for (var element in dataList) {
      data.add(Menu.fromJson(element));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(
            height: context.dynamicHeight * 0.15,
            child: UserAccountsDrawerHeader(
              accountName: Text(widget.sirketAdi),
              accountEmail: null,
              decoration: BoxDecoration(
                color: Color(MyColors.bg01),
              ),
              currentAccountPictureSize: Size.zero,
            ),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: false,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return _buildList(data[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildList(Menu list) {
  if (list.subMenu!.isEmpty) {
    return Builder(builder: (context) {
      return ListTile(
          focusColor: Color(MyColors.bg01),
          hoverColor: Color(MyColors.bg01),
          selectedTileColor: Color(MyColors.bg01),
          textColor: Color(MyColors.bg01),
          onTap: () {
            switch (list.name) {
              case Constants.AYARLAR:
                Navigator.pushNamed(context, '/settings');
                break;
              case Constants.CIKIS:
                Navigator.pushNamed(context, '/login');
                break;
              case "Stok Kart Detay":
                Navigator.pushNamed<dynamic>(context, '/stockList',
                    arguments: false);
                break;
              case Constants.CARI_DETAY:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CariKartlar(
                              detayaGitmesin: false,
                            )));
                break;
              case "Satış Faturaları":
                Navigator.pushNamed(context, "/satisFaturasi");
                break;
              case Constants.satisSiparisi:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CariKartlar(
                              detayaGitmesin: true,
                            )));

                break;
              case Constants.alimSiparisi:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CariKartlar(
                              detayaGitmesin: true,
                            )));
                break;
              default:
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ScheduleTab(
                              cardName: list.name,
                            )));
                break;
            }
          },
          leading: Icon(
            Icons.next_plan,
            color: Color(MyColors.bg01),
          ),
          title: Text(
            list.name!,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ));
    });
  }
  return ExpansionTile(
    trailing: Icon(
      Icons.arrow_drop_down_circle_outlined,
      color: Color(MyColors.bg01),
    ),
    textColor: Color(MyColors.bg01),
    iconColor: Color(MyColors.bg01),
    leading: Icon(
      list.icon,
      color: Color(MyColors.bg01),
    ),
    title: Text(
      list.name!,
      style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(MyColors.bg01)),
    ),
    children: list.subMenu!.map(_buildList).toList(),
  );
}
