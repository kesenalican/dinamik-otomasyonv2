import 'package:dinamik_otomasyon/view/screens/authenticate/login/model/user_model.dart';
import 'package:dinamik_otomasyon/view/screens/cariIslemler/model/cariler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends ChangeNotifier {
  UserModel? currentUser;
  Cariler? currentCari;
  setCurrentUser(UserModel user) {
    currentUser = user;
    notifyListeners();
  }

  setCurrentCari(Cariler cari) {
    currentCari = cari;
    notifyListeners();
  }
}

final currentInfoProvider = ChangeNotifierProvider((ref) => LoginViewModel());
