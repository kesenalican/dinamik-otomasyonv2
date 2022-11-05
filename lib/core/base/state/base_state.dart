import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T>{
  ThemeData get themeData => Theme.of(context);
  double dynamicHeight(value) => MediaQuery.of(context).size.height * value;
  double dynamicWidth(value) => MediaQuery.of(context).size.height * value;
  ThemeData get theme => Theme.of(context);
  EdgeInsets get paddingDefault => EdgeInsets.all(dynamicHeight(0.01));
  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: dynamicWidth(0.05));
  EdgeInsets get paddingTextField => EdgeInsets.symmetric(horizontal:dynamicWidth(0.07),vertical: dynamicHeight(0.1));
}