import 'package:flutter/material.dart';
import 'package:qrreader/src/pages/home_page.dart';
import 'package:qrreader/src/pages/mapa_ind_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext context) => HomePage(),
        'mapa': (BuildContext context) => MapaIndPage(),
      },
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
      ),
    );
  }
}
