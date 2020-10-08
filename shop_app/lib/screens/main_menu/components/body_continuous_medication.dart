import 'package:flutter/material.dart';

class BodyContinuosMedication extends StatelessWidget {
  const BodyContinuosMedication({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: Center(
          child: Text("MEDICACION CONTINUA"),
        ),
      ),
    );
  }
}
