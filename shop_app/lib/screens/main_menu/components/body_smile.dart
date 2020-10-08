import 'package:flutter/material.dart';

class BodySmile extends StatelessWidget {
  const BodySmile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Center(
          child: Text("TABLERO SONRISAS"),
        ),
      ),
    );
  }
}
