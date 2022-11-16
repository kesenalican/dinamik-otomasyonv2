import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:flutter/material.dart';

class SatisSiparisi extends StatelessWidget {
  const SatisSiparisi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(whichPage: "Satış Siparişi"),
      body: const Center(
        child: Text("Satış Siparişi sayfası"),
      ),
    );
  }
}
