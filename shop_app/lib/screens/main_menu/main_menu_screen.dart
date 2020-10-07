import 'package:flutter/material.dart';
import 'package:shop_app/screens/main_menu/components/body.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shop_app/screens/main_menu/custom_appbar.dart';

class MainMenuScreen extends StatelessWidget {
  static String ruteName = "/main_menu";
  const MainMenuScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar2(),
      body: Body(),
      bottomNavigationBar: CurvedNavigationBar(
        animationCurve: Curves.bounceInOut,
        animationDuration: Duration(milliseconds: 100),
        backgroundColor: Colors.white,
        color: Color.fromRGBO(252, 128, 40, 1.0),
        index: 2,
        items: <Widget>[
          Icon(Icons.attach_money, size: 30, color: Colors.white), //Consumos
          Icon(Icons.mood, size: 30, color: Colors.white), //Sonrisas
          Icon(Icons.home, size: 30, color: Colors.white), //Tablero
          Icon(Icons.receipt, size: 30, color: Colors.white), //Promociones
          Icon(Icons.low_priority,
              size: 30, color: Colors.white), //Medicacion cont
        ],
        onTap: (index) {
          //Handle button tap
        },
      ),
    );
  }

  Widget buildAppBar(BuildContext context) {
    return AppBar(
      title: Text("Tablero"),
      actions: [
        Container(
          padding: EdgeInsets.only(right: 5.0),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://lh3.googleusercontent.com/ogw/ADGmqu82kwUtGeHD4SUlhegDNLy16xw3iI_CdVnfx_EF=s32-c-mo"),
            ),
          ),
        )
      ],
    );
  }

  PreferredSize buildAppBar2() {
    return PreferredSize(
      child: Container(
        alignment: Alignment.bottomCenter,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => {}),
            Text(
              "Tablero",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Multi',
                fontSize: 18.0,
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://lh3.googleusercontent.com/ogw/ADGmqu82kwUtGeHD4SUlhegDNLy16xw3iI_CdVnfx_EF=s32-c-mo"),
              ),
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(50),
    );
  }
}
