import 'package:dinamik_otomasyon/View/common/common_appbar.dart';
import 'package:dinamik_otomasyon/View/styles/styles.dart';
import 'package:flutter/material.dart';

import '../../../styles/colors.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(whichPage: "Ayarlar"),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
              children: [
                Text(
                  "Görünümü Değiştir = ",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(MyColors.bg01),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  dropdownCallBack(String? selectedValue) {
    if (selectedValue is String) {
      setState(() {});
    }
  }
}
