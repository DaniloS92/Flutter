import 'dart:convert';
import 'dart:typed_data';

class ListProducts {
  List<Product> productos = List();

  ListProducts.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    jsonList.forEach((element) => productos.add(Product.fromJsonMap(element)));
  }
}

class Product {
  int id;
  String name;
  String type;
  String image;
  String lastUpdate;
  double price;

  Product({
    this.id,
    this.name,
    this.type,
    this.image,
    this.lastUpdate,
    this.price,
  });

  Product.fromJsonMap(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    image = (json['image_128'].runtimeType == bool) ? '' : json['image_128'];
    lastUpdate = json['__last_update'];
    price = json['list_price'];
  }

  Uint8List getImgBase64() {
    Uint8List bytes = base64.decode(image);
    return bytes;
  }
}
