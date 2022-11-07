import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginViewModel {
  void _loadLoginInfo(bool rememberMe) async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _company = _prefs.getString("company_name");
      var _user = _prefs.getString("user_name");
      var _password = _prefs.getString("password");
      if (rememberMe) {}
    } catch (e) {
      print("hata");
    }
  }
}
