import 'dart:io';
import 'package:odoo_rpc/odoo_rpc.dart';

class OdooProvider {
  String _url = 'http://192.99.151.183:8069/';
  String _db = 'test_indigo';
  String _user = 'admin';
  String _pass = 'admin';

  Future getModulesInstalled() async {
    final client = OdooClient(_url);
    try {
      await client.authenticate(_db, _user, _pass);
      final res = await client.callRPC('/web/session/modules', 'call', {});
      print('Installed modules: \n' + res.toString());
    } on OdooException catch (e) {
      print(e);
      client.close();
      exit(-1);
    }
    client.close();
    return null;
  }

  Future getProducts() async {
    final client = OdooClient(_url);
    try {
      final session = await client.authenticate(_db, _user, _pass);
      print(session);
      print('Authenticated');
      final imageField =
          session.serverVersion >= 13 ? 'image_128' : 'image_small';
      var products = await client.callKw({
        'model': 'product.template',
        'method': 'search_read',
        'args': [],
        'kwargs': {
          'fields': ['id', 'name', 'type', imageField],
        },
      });
      print('\nInstalled modules: \n' + products.toString());
    } on OdooException catch (e) {
      print(e);
      client.close();
      exit(-1);
    }
    client.close();
    return null;
  }
}
