import 'package:flutter/material.dart';

import 'package:componentes/src/providers/menu_provider.dart';
import 'package:componentes/src/utils/icon_string_util.dart';
////import 'package:componentes/src/pages/alert_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _createList(),
    );
  }

  Widget _createList() {
    return FutureBuilder(
        future: menuProvider.loadData(),
        initialData: [], //Informacion por defecto mientras inicia
        builder: (context, snapshot) {
          return ListView(children: _createListItems(snapshot.data, context));
        });
  }

  List<Widget> _createListItems(List<dynamic> items, BuildContext context) {
    List<Widget> options = [];

    items.forEach((element) {
      final widgetTemp = ListTile(
        title: Text(element['texto']),
        leading: getIconFromString(element['icon']),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          Navigator.pushNamed(context, element['ruta']);
          // final route = MaterialPageRoute(
          //   builder: (context) => AlertPage(),
          // );
          // Navigator.push(context, route);
        },
      );
      options..add(widgetTemp)..add(Divider());
    });

    return options;
  }
}
