import 'package:flutter/material.dart';
import 'package:peliculas/src/pages/home_page.dart';
import 'package:peliculas/src/pages/pelicula_detalle.dart';
import 'package:peliculas/src/providers/odoo_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final demoOdoo = new OdooProvider();
  @override
  Widget build(BuildContext context) {
    demoOdoo.getProducts();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peliculas',
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomePage(),
        'detalle': (BuildContext context) => PeliculaDetalle(),
      },
    );
  }
}
