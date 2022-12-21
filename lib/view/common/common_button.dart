import 'package:flutter/material.dart';

import '../styles/colors.dart';

class CommonButton extends StatefulWidget {
  final String? buttonName;
  const CommonButton({Key? key, required this.buttonName}) : super(key: key);
  final EdgeInsets edgeInsets = const EdgeInsets.all(10);

  @override
  State<CommonButton> createState() => _CommonButtonState();
}

class _CommonButtonState extends State<CommonButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      padding: widget.edgeInsets,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(MyColors.bg01),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Color(MyColors.bg01),
        ),
      ),
      child: Center(
        child: Text(
          widget.buttonName!,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
