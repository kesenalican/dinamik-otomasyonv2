import 'package:flutter/material.dart';

class BekleyenSiparisler extends StatelessWidget {
  const BekleyenSiparisler({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Bekleyen Siparişler"),
        ],
      ),
    );
  }
}
