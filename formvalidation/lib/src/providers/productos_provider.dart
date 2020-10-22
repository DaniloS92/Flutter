import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:formvalidation/src/models/producto.dart';

class ProductosProvider {
  final String _url = 'https://flutter-c8f15.firebaseio.com';

  Future<bool> crearProducto(ProductoModel producto) async {
    final url = '$_url/productos.json';
    final resp = await http.post(url, body: productoModelToJson(producto));

    final decodedData = json.decode(resp.body);
    print(decodedData);
    return true;
  }

  Future<List<ProductoModel>> cargarProductos() async {
    final url = '$_url/productos.json';
    final resp = await http.get(url);

    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel> productos = new List();

    if (decodedData == null) return [];
    decodedData.forEach((id, product) {
      final prodTemp = ProductoModel.fromJson(product);
      prodTemp.id = id;
      productos.add(prodTemp);
    });
    return productos;
  }
}
