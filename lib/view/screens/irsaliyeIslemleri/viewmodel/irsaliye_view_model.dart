import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IrsaliyeViewModel extends ChangeNotifier {
  bool siparisVarmi = false;
}

final irsaliyeViewModel = ChangeNotifierProvider((ref) => IrsaliyeViewModel());
