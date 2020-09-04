import 'dart:math';

import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({Key key}) : super(key: key);

  @override
  _AnimatedContainerPageState createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 50.0;
  double _heigth = 50.0;
  Color _color = Colors.red;

  BorderRadiusGeometry _borderRadius = BorderRadius.circular(8.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Animated container"),
        ),
        body: Center(
          child: AnimatedContainer(
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn,
            width: _width,
            height: _heigth,
            decoration: BoxDecoration(
              color: _color,
              borderRadius: _borderRadius,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.adjust),
          onPressed: () {
            final random = new Random();
            setState(() {
              this._color = Color.fromRGBO(
                random.nextInt(300),
                random.nextInt(300),
                random.nextInt(300),
                1,
              );
              this._heigth = random.nextInt(300).toDouble();
              this._width = random.nextInt(300).toDouble();
              this._borderRadius = BorderRadius.circular(
                random.nextInt(100).toDouble(),
              );
            });
          },
        ),
      ),
    );
  }
}
