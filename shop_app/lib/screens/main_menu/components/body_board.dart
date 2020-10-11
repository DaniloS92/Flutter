import 'package:flutter/material.dart';

class BodyBoard extends StatelessWidget {
  const BodyBoard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 60.0,
        // color: Colors.white,
        child: Stack(
          children: [
            ClipPath(
              clipper: MyCustomClipper(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [
                      Color.fromRGBO(171, 178, 72, 1.0),
                      Color.fromRGBO(7, 154, 136, 1.0)
                    ],
                  ),
                ),
                // margin: EdgeInsets.only(top: 20.0),
                height: double.infinity,
                width: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    var s = size;
    final widthEnd = s.width / 5;

    path.lineTo(0.0, s.height / 3);
    path.quadraticBezierTo(
      s.width - (s.width / 1.15),
      s.height - 50,
      widthEnd,
      s.height - 30,
    );

    path.quadraticBezierTo(
      s.width - (s.width / 1.43),
      s.height - 5,
      widthEnd * 2,
      s.height - 30,
    );

    path.quadraticBezierTo(
      s.width - (s.width / 1.95),
      s.height - 50,
      widthEnd * 3,
      s.height - 30,
    );

    path.quadraticBezierTo(
      s.width - (s.width / 3.5),
      s.height - 5,
      widthEnd * 4,
      s.height - 30,
    );

    path.quadraticBezierTo(
      s.width - 44,
      s.height - 50,
      widthEnd * 5,
      s.height - 30,
    );

    path.lineTo(size.width, size.height - 20);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
