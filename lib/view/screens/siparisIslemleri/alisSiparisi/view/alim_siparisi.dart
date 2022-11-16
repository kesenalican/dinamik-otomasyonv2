import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:dinamik_otomasyon/view/common/common_appbar.dart';
import 'package:flutter/material.dart';

class AlisSiparisi extends StatelessWidget {
  const AlisSiparisi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppbar(whichPage: Constants.alimSiparisi),
      body: const Center(
        child: Text(Constants.alimSiparisi),
        
      ),
    );
  }
}
