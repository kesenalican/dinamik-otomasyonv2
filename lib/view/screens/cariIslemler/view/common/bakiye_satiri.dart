import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';

class BakiyeSatiri extends StatelessWidget {
  final String cariBakiye;
  final String hangiBorc;
  const BakiyeSatiri({
    super.key,
    required this.cariBakiye,
    required this.hangiBorc,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          flex: 7,
          child: Text(
            hangiBorc,
            style: purpleTxtStyle,
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            ':',
            style: purpleTxtStyle,
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            cariBakiye,
            style: purpleTxtStyle,
          ),
        ),
      ],
    );
  }
}
