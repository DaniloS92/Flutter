import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  
  final _styleText = new TextStyle(fontSize: 25.0);
  int _cont = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Titulo'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Numero de tabs", style: _styleText),
            Text("$_cont",style: _styleText)
          ],
        )),
        floatingActionButton: _createButtons());
  }

  Widget _createButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: 30.0),
        FloatingActionButton(child: Icon(Icons.exposure_zero),onPressed: _reset),
        Expanded(child: SizedBox(width: 5.0,)),
        FloatingActionButton(child: Icon(Icons.remove), onPressed: _sub),
        SizedBox(width: 5.0),
        FloatingActionButton(child: Icon(Icons.add),onPressed: _add),
      ],
    );
  }

  void _add() {
    setState(() => _cont++);
  }

  void _sub() {
    setState(() => _cont--);
  }

  void _reset() {
    setState(() => _cont = 0);
  }
}
