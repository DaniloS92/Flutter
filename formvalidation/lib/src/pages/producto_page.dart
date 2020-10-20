import 'package:flutter/material.dart';
import 'package:formvalidation/src/models/producto.dart';
import 'package:formvalidation/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {
  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();

  ProductoModel producto = ProductoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto',
      ),
      onSaved: (newValue) => producto.titulo = newValue,
      validator: (value) {
        if (value.length < 3) return 'Ingrese min 3 caracteres cojudo';
        return null;
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio',
      ),
      onSaved: (newValue) => producto.valor = double.parse(newValue),
      validator: (value) {
        return (utils.isNumeric(value)) ? null : 'Número invalido pendejo';
      },
    );
  }

  _crearBoton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: _submitForm,
      icon: Icon(Icons.save),
      label: Text('Guardar'),
    );
  }

  void _submitForm() {
    if (!formKey.currentState.validate()) return;

    formKey.currentState.save();

    print('Toda la wea esa ok');
    print(producto.titulo);
    print(producto.valor);
  }

  _crearDisponible() {
    return SwitchListTile(
      value: producto.disponible,
      title: Text("Disponible"),
      activeColor: Colors.deepPurple,
      onChanged: (value) {
        producto.disponible = value;
        setState(() {});
      },
    );
  }
}
