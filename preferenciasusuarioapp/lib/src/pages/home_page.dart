import 'package:flutter/material.dart';

import 'widget/drawer_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home';

  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de usuario"),
      ),
      drawer: DrawerWidget(routeName: routeName),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Color Secundario"),
          Divider(),
          Text("Genero"),
          Divider(),
          Text("Nombre usuario"),
          Divider(),
        ],
      ),
    );
  }
}
