import 'package:flutter/material.dart';

class NavigationService {
  static NavigationService? _instance;
  static NavigationService get instance {
    _instance ??= NavigationService._init();
    return _instance!;
  }

  NavigationService._init();

  // ignore: prefer_function_declarations_over_variables
  final removeAllOldRoutes = (Route<dynamic> route) => false;

  final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey(debugLabel: "navigator");

  Future navigate(String path, {Object? args}) async {
    return await navigatorKey.currentState!.pushNamed(path, arguments: args);
  }

  Future navigateToReset(String path, {Object? args}) async {
    return await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: args);
  }
}
