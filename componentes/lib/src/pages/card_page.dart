import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          _cardtipo1(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
          _cardTipo2(),
          SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _cardTipo2() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2, 10),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: Container(
          child: Column(
            children: [
              FadeInImage(
                placeholder: AssetImage("assets/jar-loading.gif"),
                image: NetworkImage(
                    "https://i.pinimg.com/originals/e4/c9/75/e4c975e018f501b52eefaed696c4a3ff.jpg"),
                fadeInDuration: Duration(milliseconds: 200),
                height: 230,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("Ejemplo de texto"),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _cardtipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          SizedBox(height: 20.0),
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Este es el titulo del la lista'),
            subtitle: Text(
                'Esta es la wea de la wea de la wea suprema de toda la suprema' +
                    'de todo lo supremo de aprender en esta cosa que se llama futter'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              FlatButton(onPressed: () => {}, child: Text('Cancelar')),
              FlatButton(onPressed: () => {}, child: Text('Ok')),
            ],
          )
        ],
      ),
    );
  }
}
