import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';

class CommonLoading extends StatefulWidget {
  const CommonLoading({super.key});

  @override
  State<CommonLoading> createState() => _CommonLoadingState();
}

class _CommonLoadingState extends State<CommonLoading> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: Color(MyColors.bg01),
      ),
    );
  }
}
