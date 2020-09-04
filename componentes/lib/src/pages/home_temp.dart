import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final List<String> options = ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes Temp'),
      ),
      body: ListView(
        children: _createItemsShort(),
      ),
    );
  }

  List<Widget> _createItemsShort() {
    return options.map((e) => Column(
      children: <Widget>[
        ListTile(
          title: Text(e),
          subtitle: Text('Cualquier cosa jeje'),
          leading: Icon(Icons.accessibility_new),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () { },
        ),
        Divider(),
      ],
    )).toList();
  }
}
