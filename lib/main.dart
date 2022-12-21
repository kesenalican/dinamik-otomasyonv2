import 'package:dinamik_otomasyon/core/routing/navigation/navigation_service.dart';
import 'package:dinamik_otomasyon/view/screens/authenticate/login/view/login_view.dart';
import 'package:dinamik_otomasyon/view/styles/colors.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [],
      theme: ThemeData.light().copyWith(
          progressIndicatorTheme: ProgressIndicatorThemeData(
            color: Color(MyColors.bg01),
          ),
          dividerTheme: DividerThemeData(
            color: Color(MyColors.bg01),
          )),
      title: Constants.dinamikOtomasyon,
      onGenerateRoute: RouteGenerator.routeGenerator,
      home: const Login(),
    );
  }
}
