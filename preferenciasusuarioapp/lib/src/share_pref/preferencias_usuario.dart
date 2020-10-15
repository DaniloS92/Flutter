import 'package:flutter/material.dart';
import 'package:preferenciasusuarioapp/src/pages/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsario {
  static final PreferenciasUsario _instancia =
      new PreferenciasUsario._internal();

  factory PreferenciasUsario() {
    return _instancia;
  }

  PreferenciasUsario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    WidgetsFlutterBinding.ensureInitialized();
    this._prefs = await SharedPreferences.getInstance();
  }

  //GET y SET
  get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('generi', value);
  }

  get colorSecundario {
    return _prefs.getBool('colorSecundario') ?? false;
  }

  set colorSecundario(bool value) {
    _prefs.setBool('colorSecundario', value);
  }

  get nombreUsuario {
    return _prefs.getString('nombreUsuario') ?? '';
  }

  set nombreUsuario(String value) {
    _prefs.setString('nombreUsuario', value);
  }

  get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? HomePage.routeName;
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }
}
