import 'package:dinamik_otomasyon/Model/module_name.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_drawer.dart';
import 'package:dinamik_otomasyon/view/common/module_card_button.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/view/login_view.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/view/cari_kartlar.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends ConsumerStatefulWidget {
  final String? sirketAdi;
  const HomePage({
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
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: Text(
          Constants.anaSayfa,
          style: TextStyle(
              color: Color(MyColors.bg01), fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: Color(MyColors.bg01), size: 30),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () async {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Login()));
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.remove('company_name');
              prefs.remove('user_name');
              prefs.remove('user_code');
              prefs.remove('password');
              prefs.remove('remember_me');
              prefs.clear();
            },
            icon: Icon(
              Icons.logout,
              color: Color(
                MyColors.bg01,
              ),
            ),
          ),
        ],
      ),
      drawer: DrawerMenu(sirketAdi: widget.sirketAdi!),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth * 0.02),
        child: ListView(
          children: [
            //SizedBox(height:dynamicHeight(0.01)),
            // const SearchInput(),
            SizedBox(
              height: context.dynamicHeight * 0.02,
            ),
            _buildKartlarText(),
            SizedBox(
              height: context.dynamicHeight * 0.02,
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.pushNamed<dynamic>(
                  context,
                  '/stockList',
                  arguments: false,
                );
              },
              cardName: modules[0],
              iconData: const Icon(Icons.attach_money_rounded),
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CariKartlar(
                              detayaGitmesin: false,
                            )));
              },
              cardName: modules[1],
              iconData: const Icon(Icons.account_tree_sharp),
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CariKartlar(
                            alisMi: false, detayaGitmesin: true)));
              },
              cardName: modules[2],
              iconData: const Icon(Icons.info_outline_rounded),
            ),
            ModuleCardButton(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CariKartlar(
                              alisMi: true,
                              detayaGitmesin: true,
                            )));
              },
              cardName: modules[3],
              iconData: const Icon(Icons.warehouse),
            ),
            ModuleCardButton(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const CariKartlar(
                //               alisMi: false,
                //               detayaGitmesin: true,
                //               irsaliyeMi: true,
                //             )));
              },
              cardName: modules[4],
              iconData: const Icon(Icons.warehouse),
            ),
            ModuleCardButton(
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const CariKartlar(
                //               alisMi: true,
                //               detayaGitmesin: true,
                //               irsaliyeMi: true,
                //             )));
              },
              cardName: modules[5],
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
          Constants.kartlar,
          style: context.theme.textTheme.headline6!
              .copyWith(color: Color(MyColors.bg01)),
        ),
      ],
    );
  }
}
