import 'dart:async';

import 'package:qrreader/src/bloc/validators.dart';
import 'package:qrreader/src/providers/db_provider.dart';

class ScansBloc with Validators {
  static final ScansBloc _singleton = new ScansBloc._internal();

  factory ScansBloc() {
    return _singleton;
  }

  ScansBloc._internal() {
    obtenerScans();
  }

  final _scansController = new StreamController<List<ScanModel>>.broadcast();

  Stream<List<ScanModel>> get scanStream =>
      _scansController.stream.transform(validarGeo);
  Stream<List<ScanModel>> get scanStreamHttp =>
      _scansController.stream.transform(validarHttp);

  dispose() {
    _scansController?.close();
  }

  obtenerScans() async {
    _scansController.sink.add(await DBProvider.db.getScans());
  }

  agregarScan(ScanModel scan) async {
    await DBProvider.db.nuevoScan(scan);
    obtenerScans();
  }

  borrarScan(int id) async {
    await DBProvider.db.deleteScan(id);
    obtenerScans();
  }

  borrarTodosScans() async {
    await DBProvider.db.deleteAll();
    obtenerScans();
  }
}