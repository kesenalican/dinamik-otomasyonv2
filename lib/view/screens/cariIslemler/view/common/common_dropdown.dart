import 'package:dinamik_otomasyon/core/extensions/extensions.dart';
import 'package:dinamik_otomasyon/view/common/common_input_border.dart';
import 'package:dinamik_otomasyon/view/styles/styles.dart';
import 'package:flutter/material.dart';

import 'package:dinamik_otomasyon/view/styles/colors.dart';

// ignore: must_be_immutable
class CommonDropDown extends StatefulWidget {
  String? selectedItem;
  int selectedItemIndex;
  final List<String> list;
  final String listName;
  CommonDropDown({
    Key? key,
    required this.list,
    required this.listName,
    required this.selectedItemIndex,
  }) : super(key: key);

  @override
  State<CommonDropDown> createState() => _CommonDropDownState();
}

class _CommonDropDownState extends State<CommonDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: context.dynamicWidth * 0.02),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          contentPadding: context.paddingDefault,
          alignLabelWithHint: true,
          border: CommonInputBorder.border,
        ),
        //validator: (value) => "${widget.listName} boş olamaz!",
        isExpanded: true,
        borderRadius: BorderRadius.circular(10),
        elevation: 3,
        dropdownColor: Color(MyColors.bg),
        icon: Icon(
          Icons.arrow_downward,
          color: Color(MyColors.bg01),
        ),
        hint: Text(
          widget.listName,
          style: purpleTxtStyle,
          overflow: TextOverflow.ellipsis,
        ),
        style: TextStyle(
          fontSize: 15,
          color: Color(MyColors.bg01),
        ),
        onChanged: (String? selectedItem) {
          setState(() {
            widget.selectedItem = selectedItem;
            widget.selectedItemIndex =
                widget.list.indexOf(selectedItem.toString());
            print('SEÇİLEN İNDEX == ${widget.selectedItemIndex}');
          });
        },
        items: widget.list
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
          widget.selectedItemIndex = widget.list.indexOf(newValue.toString());
        },
      ),
    );
  }
}
