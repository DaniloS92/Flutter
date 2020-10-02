import 'package:flutter/material.dart';

class ScrollPage extends StatelessWidget {
  const ScrollPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        scrollDirection: Axis.vertical,
        children: [
          _pagina1(),
          _pagina2(),
        ],
      ),
    );
  }

  Widget _pagina1() {
    return Container(
      child: Center(child: Text("pagina 1")),
    );
  }

  Widget _pagina2() {
    return Container(
      child: Center(child: Text("pagina 2")),
    );
  }
}
