import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/share_pref/preferencias_usuario.dart';

import 'widget/drawer_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';
  final prefs = new PreferenciasUsario();

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = HomePage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de usuario"),
        backgroundColor:
            (prefs.colorSecundario) ? Colors.teal : Colors.blueGrey,
      ),
      drawer: DrawerWidget(routeName: routeName),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Color Secundario ${prefs.colorSecundario}"),
          Divider(),
          Text("Genero ${prefs.genero}"),
          Divider(),
          Text("Nombre usuario ${prefs.nombreUsuario}"),
          Divider(),
        ],
      ),
    );
  }
}
