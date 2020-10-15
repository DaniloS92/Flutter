import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/share_pref/preferencias_usuario.dart';

import 'widget/drawer_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settins';

  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController textController;

  final prefs = new PreferenciasUsario();

  @override
  void initState() {
    super.initState();
    this._genero = prefs.genero;
    this._colorSecundario = prefs.colorSecundario;
    this.textController = new TextEditingController(text: prefs.nombreUsuario);
  }

  @override
  Widget build(BuildContext context) {
    prefs.ultimaPagina = SettingsPage.routeName;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias"),
        backgroundColor:
            (prefs.colorSecundario) ? Colors.teal : Colors.blueGrey,
      ),
      drawer: DrawerWidget(routeName: SettingsPage.routeName),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text(
              'Settings',
              style: TextStyle(
                fontSize: 45.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Divider(),
          SwitchListTile(
            value: this._colorSecundario,
            title: Text('Color secundario'),
            onChanged: (value) {
              this._colorSecundario = value;
              prefs.colorSecundario = value;
              setState(() {});
            },
          ),
          RadioListTile(
            value: 1,
            title: Text("Masculino"),
            groupValue: this._genero,
            onChanged: _setSelectedRadio,
          ),
          RadioListTile(
            value: 2,
            title: Text("Femenino"),
            groupValue: this._genero,
            onChanged: _setSelectedRadio,
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: textController,
              decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Nombre de la persona usando el telf'),
              onChanged: (value) {
                prefs.nombreUsuario = value;
              },
            ),
          )
        ],
      ),
    );
  }

  void _setSelectedRadio(int value) {
    prefs.genero = value;
    this._genero = value;
    setState(() {});
  }
}
