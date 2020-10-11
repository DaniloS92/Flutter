import 'package:flutter/material.dart';

import 'package:shop_app/routs.dart';
import 'package:shop_app/screens/main_menu/main_menu_screen.dart';
import 'package:shop_app/screens/splash/splash_screen.dart';
import 'package:shop_app/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce',
      theme: theme(),
      initialRoute: MainMenuScreen.routeName,
      routes: routes,
    );
  }
}
