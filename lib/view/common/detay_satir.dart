import 'package:flutter/material.dart';
import '../../core/base/state/base_state.dart';
import '../styles/colors.dart';

class DetaySatir extends StatefulWidget {
  final String? hangiOzellik;
  final String? urunBilgi;

  const DetaySatir(
      {Key? key, required this.hangiOzellik, required this.urunBilgi})
      : super(key: key);

  @override
  State<DetaySatir> createState() => _DetaySatirState();
}

class _DetaySatirState extends BaseState<DetaySatir> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingDefault,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Color(MyColors.bg02),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(
            width: 2,
            color: Color(MyColors.bg01),
          ),
        ),
        child: SizedBox(
          height: dynamicHeight(0.05),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(flex: 1, child: Text(widget.hangiOzellik!)),
                const Expanded(flex: 1, child: Text(':')),
                Expanded(
                  flex: 3,
                  child: Text(
                    widget.urunBilgi!,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
