import 'package:flutter/material.dart';

import 'widget/drawer_widget.dart';

class SettingsPage extends StatelessWidget {
  static final String routeName = 'settins';

  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias"),
      ),
      drawer: DrawerWidget(routeName: routeName),
      body: Center(
        child: Text("Ajustes Page"),
      ),
    );
  }
}
