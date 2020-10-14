import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'widget/drawer_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settins';

  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _colorSecundario = true;
  int _genero = 1;
  String _nombre = 'Danilo';

  TextEditingController textController;

  @override
  void initState() {
    super.initState();
    cargarData();
    this.textController = new TextEditingController(text: this._nombre);
  }

  cargarData() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this._genero = prefs.getInt('genero');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias"),
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
              onChanged: (value) {},
            ),
          )
        ],
      ),
    );
  }

  void _setSelectedRadio(int value) async {
    WidgetsFlutterBinding.ensureInitialized();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('genero', value);
    this._genero = value;
    setState(() {});
  }
}
