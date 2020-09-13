import 'package:flutter/material.dart';

class SlidersPage extends StatefulWidget {
  SlidersPage({Key key}) : super(key: key);

  @override
  _SlidersPageState createState() => _SlidersPageState();
}

class _SlidersPageState extends State<SlidersPage> {
  double _valorActual = 50;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Sliders Page"),
        ),
        body: Column(
          children: [
            _crearSlider(),
            buildCheckboxListTile(),
            buildSitchListTile(),
            Expanded(
              child: _crearImagen(),
            )
          ],
        ),
      ),
    );
  }

  CheckboxListTile buildCheckboxListTile() {
    return CheckboxListTile(
      title: Text("Bloquear esta wea"),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
  }

  SwitchListTile buildSitchListTile() {
    return SwitchListTile(
      title: Text("Bloquear esta wea"),
      value: _bloquearCheck,
      onChanged: (value) {
        setState(() {
          _bloquearCheck = value;
        });
      },
    );
  }

  Image _crearImagen() {
    return Image(
      fit: BoxFit.contain,
      width: _valorActual,
      image: NetworkImage(
        'https://pbs.twimg.com/profile_images/1009469376490192896/hW_ZFLHm_400x400.jpg',
      ),
    );
  }

  Container _crearSlider() {
    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Slider(
            activeColor: Colors.purple,
            label: 'Tamaño de la imagen',
            // divisions: 20,
            value: _valorActual,
            min: 0.0,
            max: 500.0,
            onChanged: (value) => _bloquearCheck == false
                ? setState(
                    () {
                      _valorActual = value;
                    },
                  )
                : null,
          ),
        ],
      ),
    );
  }
}
