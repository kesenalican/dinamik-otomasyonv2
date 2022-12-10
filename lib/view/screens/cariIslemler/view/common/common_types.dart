// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dinamik_otomasyon/view/styles/colors.dart';
import 'package:flutter/material.dart';
import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';

// ignore: must_be_immutable
class CommonTypes extends StatefulWidget {
  String hareketTipi;
  List<String> listOfTypes;
  int selectedItemIndex;
  String? selectedItem;
  CommonTypes({
    Key? key,
    required this.hareketTipi,
    required this.listOfTypes,
    required this.selectedItemIndex,
  }) : super(key: key);

  @override
  State<CommonTypes> createState() => _CommonTypesState();
}

class _CommonTypesState extends State<CommonTypes> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: context.dynamicWidth * 0.05,
        ),
        Text(
          widget.hareketTipi,
          style: purpleBoldTxtStyle,
        ),
        SizedBox(
          width: context.dynamicWidth * 0.05,
        ),
        Expanded(
          flex: 1,
          child: DropdownButtonFormField<String>(
            //validator: (value) => "${widget.listName} boş olamaz!",
            borderRadius: BorderRadius.circular(10),
            elevation: 3,
            dropdownColor: Color(MyColors.bg),
            icon: Icon(
              Icons.arrow_downward,
              color: Color(MyColors.bg01),
            ),
            hint: Text(
              widget.hareketTipi,
              style: purpleTxtStyle,
            ),
            style: TextStyle(
              fontSize: 15,
              color: Color(MyColors.bg01),
            ),
            onChanged: (String? selectedItem) {
              setState(() {
                selectedItem = selectedItem;
                widget.selectedItemIndex =
                    widget.listOfTypes.indexOf(selectedItem.toString());
                print('SEÇİLEN İNDEX == ${widget.selectedItemIndex}');
              });
            },
            items: widget.listOfTypes
                .map((String? oankiBirim) => DropdownMenuItem(
                      value: oankiBirim,
                      child: Text(
                        oankiBirim!,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: widget.selectedItem,
            autovalidateMode: AutovalidateMode.always,
            onSaved: (newValue) {
              widget.selectedItemIndex =
                  widget.listOfTypes.indexOf(newValue.toString());
            },
          ),
        ),
      ],
    );
  }
}
