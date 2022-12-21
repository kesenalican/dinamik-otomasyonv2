import 'package:dinamik_otomasyon/core/routing/navigation/navigation_service.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/view/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dinamik_otomasyon/core/constants/constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [],
      title: Constants.dinamikOtomasyon,
      onGenerateRoute: RouteGenerator.routeGenerator,
      home: Login(),
    );
  }
}
