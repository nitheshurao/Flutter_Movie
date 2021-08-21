import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:my_app/Pages/Hom1.dart';
// import 'package:my_app/Pages/CartPage.dart';
// import 'package:my_app/Pages/Home.dart';
import 'package:my_app/Pages/Home_page.dart';
import 'package:my_app/Pages/Login.dart';
// import 'package:my_app/Pages/Movi/main.dart';
import 'package:my_app/Pages/User_page.dart';
import 'package:my_app/util/%20UserSimplePreferences.dart';
import 'package:my_app/util/routes.dart';

import 'package:flutter/material.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await UserSimplePreferences.init();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      routes: {
        "/": (context) => UserPage(),
        MyRoutes.RRouter: (context) => UserPage(),
        MyRoutes.LoginRoute: (context) => LoginPage(),
        MyRoutes.HomeRoute: (context) => Home_page(),
        // MyRoutes.HomeR: (context) => Main(),
        // MyRoutes.CarRoute: (context) => Ca,
      },
    );
  }
}
