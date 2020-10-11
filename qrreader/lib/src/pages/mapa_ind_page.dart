import 'package:flutter/material.dart';

import 'package:flutter_map/plugin_api.dart';
import 'package:qrreader/src/models/scan_model.dart';

class MapaIndPage extends StatelessWidget {
  const MapaIndPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("Coordenadas"),
        actions: [
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {},
          )
        ],
      ),
      body: _crearFlutterMap(scan),
    );
  }

  Widget _crearFlutterMap(ScanModel scan) {
    return FlutterMap(
      options: MapOptions(
        center: scan.getLatLng(),
        zoom: 15,
      ),
      layers: [
        _crearMapa(),
      ],
    );
  }

  _crearMapa() {
    return TileLayerOptions(
        urlTemplate:
            'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}@2x?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1IjoiZGFuaWxvczkyIiwiYSI6ImNrZzVvcXFtdDAxa2syeXIxcnA2eTR2emQifQ.BOZi0xGL-yUU5i6O_-nJxQ',
          'id': 'mapbox/streets-v11'
          // dark, light, outdoors, satellite
        });
  }
}
