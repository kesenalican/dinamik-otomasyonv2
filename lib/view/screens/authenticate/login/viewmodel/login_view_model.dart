import 'package:dinamik_otomasyon/view/screens/authenticate/login/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginViewModel extends ChangeNotifier {
  UserModel? currentUser;

  setCurrentUser(UserModel user) {
    currentUser = user;
    notifyListeners();
  }
}

final currentUserProvider = ChangeNotifierProvider((ref) => LoginViewModel());
