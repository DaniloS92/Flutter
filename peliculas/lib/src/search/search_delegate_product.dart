import 'package:flutter/material.dart';
import 'package:peliculas/src/models/product_model.dart';
import 'package:peliculas/src/providers/odoo_provider.dart';

class DataSearchProduct extends SearchDelegate {
  String seleccion = '';
  final odooProvider = new OdooProvider();

  @override
  List<Widget> buildActions(BuildContext context) {
    // Las acciones de nuestro Appbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Icono a la izquierda del appbar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Crea los resultados que vamos a mostrar
    return Center(
      child: Container(
        height: 100,
        width: 100,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // Sugerencias que aparecen cuando la persona escribe

    final odooProvider = new OdooProvider();

    if (query.isEmpty) {
      return Container();
    }

    return FutureBuilder(
      future: odooProvider.getProductsByName(query),
      builder: (context, AsyncSnapshot<List<Product>> snapshot) {
        final peliculas = snapshot.data;
        if (snapshot.hasData) {
          return ListView(
            children: peliculas
                .map((product) => ListTile(
                      leading: FadeInImage(
                        placeholder: AssetImage("assets/img/no-image.jpg"),
                        image: (product.getImgBase64() != null)
                            ? MemoryImage(product.getImgBase64())
                            : AssetImage("assets/img/no-image.jpg"),
                        width: 50,
                        fit: BoxFit.contain,
                      ),
                      title: Text(product.name),
                      subtitle: Text("\$ ${product.price.toString()}"),
                      onTap: () {},
                    ))
                .toList(),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
