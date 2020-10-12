import 'package:flutter/material.dart';
import 'package:qrreader/src/bloc/scans_block.dart';
import 'package:qrreader/src/models/scan_model.dart';
import 'package:qrreader/src/utils/utils.dart' as utils;

class MapaPage extends StatelessWidget {
  final scansBloc = new ScansBloc();

  @override
  Widget build(BuildContext context) {
    scansBloc.obtenerScans();

    return StreamBuilder<List<ScanModel>>(
      stream: scansBloc.scanStream,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        final scans = snapshot.data;
        if (scans.length == 0) {
          return Center(child: Text("No hay info"));
        }

        return ListView.builder(
          itemCount: scans.length,
          itemBuilder: (context, index) {
            return Dismissible(
                key: UniqueKey(),
                background: Container(color: Colors.red),
                onDismissed: (direction) =>
                    scansBloc.borrarScan(scans[index].id),
                child: ListTile(
                  onTap: () => utils.abrirScan(context, scans[index]),
                  leading:
                      Icon(Icons.map, color: Theme.of(context).primaryColor),
                  title: Text(scans[index].valor),
                  subtitle: Text('Id del registro: ${scans[index].id}'),
                  trailing:
                      Icon(Icons.keyboard_arrow_right, color: Colors.grey),
                ));
          },
        );
      },
    );
  }
}
