import 'package:flutter/material.dart';

class BasicoPage extends StatelessWidget {
  final stiloTitulo = TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold);
  final stiloSubTitulo = TextStyle(fontSize: 14.0, color: Colors.grey);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImage(),
            buildTittleBlock(),
            buildActions(),
            buildText(),
            buildText(),
            buildText(),
            buildText(),
            buildText(),
            buildText(),
          ],
        ),
      ),
    );
  }

  Widget buildText() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 40.0),
        child: Text(
          "Exercitation incididunt excepteur laborum qui voluptate minim occaecat excepteur reprehenderit minim. Nulla incididunt ut Lorem mollit dolor eiusmod veniam. Anim commodo magna ex dolor. Nulla ex incididunt voluptate pariatur quis. Velit veniam anim officia qui et veniam. Consequat nulla dolor nisi consequat mollit exercitation officia nulla ex laboris Lorem officia.",
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }

  Widget buildActions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        buildActionOnly(Icons.call, 'Call'),
        buildActionOnly(Icons.near_me, 'Route'),
        buildActionOnly(Icons.share, 'Share'),
      ],
    );
  }

  Column buildActionOnly(IconData icon, String text) {
    return Column(
      children: [
        Icon(icon, color: Colors.blue, size: 30.0),
        SizedBox(height: 5.0),
        Text(text, style: TextStyle(fontSize: 15.0, color: Colors.blue)),
      ],
    );
  }

  Widget buildTittleBlock() {
    return SafeArea(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Imagen de montañas',
                    style: stiloTitulo,
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  Text(
                    'Fotografia del sitio Palosolo en Ecuador.',
                    style: stiloSubTitulo,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.star,
              color: Colors.red,
              size: 25.0,
            ),
            Text(
              "41",
              style: TextStyle(fontSize: 18.0),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage() {
    return Container(
      width: double.infinity,
      child: Image(
        image: NetworkImage(
          "https://learn.zoner.com/wp-content/uploads/2018/08/landscape-photography-at-every-hour-part-ii-photographing-landscapes-in-rain-or-shine.jpg",
        ),
        height: 220.0,
        fit: BoxFit.cover,
      ),
    );
  }
}
