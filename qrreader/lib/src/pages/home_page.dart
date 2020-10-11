import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qrreader/src/bloc/scans_block.dart';
import 'package:qrreader/src/models/scan_model.dart';
import 'package:qrreader/src/pages/direcciones_page.dart';
import 'package:qrreader/src/pages/mapa_page.dart';
import 'package:qrreader/src/utils/utils.dart' as utils;

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scansBloc = new ScansBloc();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: scansBloc.borrarTodosScans,
          )
        ],
      ),
      body: Center(
        child: _callPage(currentIndex),
      ),
      bottomNavigationBar: _crearBottomNavigationBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () => _scanQR(context),
        child: Icon(Icons.filter_center_focus),
      ),
    );
  }

  _scanQR(BuildContext context) async {
    //geo:40.701332383808946,-73.87135878046878
    //http://fullcode.site/
    dynamic futureString = 'http://nosolotec.elipsys.ec/';

    // try {
    //   futureString = await BarcodeScanner.scan();
    // } catch (e) {
    //   futureString = e.toString();
    // }
    // print('Future String: ${futureString.rawContent}');

    if (futureString != null) {
      final scan = ScanModel(valor: futureString);
      scansBloc.agregarScan(scan);

      final scan2 =
          ScanModel(valor: 'geo:40.701332383808946,-73.87135878046878');
      scansBloc.agregarScan(scan2);

      if (Platform.isIOS) {
        Future.delayed(
            Duration(milliseconds: 750), () => utils.abrirScan(context, scan));
      } else {
        utils.abrirScan(context, scan);
      }
    }
  }

  Widget _crearBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => {
        setState(() => {currentIndex = index})
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          title: Text("Mapa"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.brightness_5),
          title: Text("Direcciones"),
        )
      ],
    );
  }

  Widget _callPage(int pagActual) {
    switch (pagActual) {
      case 0:
        return MapaPage();
        break;
      case 1:
        return DireccionesPage();
        break;
      default:
        return MapaPage();
        break;
    }
  }
}
