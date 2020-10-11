import 'package:flutter/material.dart';
import 'package:shop_app/screens/main_menu/components/body_board.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:shop_app/screens/main_menu/components/body_continuous_medication.dart';
import 'package:shop_app/screens/main_menu/components/body_promotions.dart';
import 'package:shop_app/screens/main_menu/components/body_shopping.dart';
import 'package:shop_app/screens/main_menu/components/body_smile.dart';

class MainMenuScreen extends StatefulWidget {
  static String routeName = "/main_menu";

  @override
  _MainMenuScreenState createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  int _page = 2;

  Widget _showPage = BodyBoard();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return BodyShopping();
        break;
      case 1:
        return BodySmile();
        break;
      case 2:
        return BodyBoard();
        break;
      case 3:
        return BodyPromotions();
        break;
      case 4:
        return BodyContinuosMedication();
        break;
      default:
        return BodyBoard();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(),
        bottomNavigationBar: CurvedNavigationBar(
          animationCurve: Curves.bounceInOut,
          animationDuration: Duration(milliseconds: 100),
          backgroundColor: Colors.white,
          color: Color.fromRGBO(252, 128, 40, 1.0),
          index: _page,
          items: <Widget>[
            Icon(Icons.attach_money, size: 30, color: Colors.white), //Consumos
            Icon(Icons.mood, size: 30, color: Colors.white), //Sonrisas
            Icon(Icons.home, size: 30, color: Colors.white), //Tablero
            Icon(Icons.receipt, size: 30, color: Colors.white), //Promociones
            Icon(Icons.low_priority,
                size: 30, color: Colors.white), //Medicacion cont
          ],
          onTap: (index) {
            setState(() {
              _showPage = _pageChooser(index);
            });
          },
        ),
        body: _showPage);
  }

  PreferredSize buildAppBar() {
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
                    "https://scontent.fmch2-1.fna.fbcdn.net/v/t1.0-9/119712786_10222191718416328_4879624957836146610_o.jpg?_nc_cat=107&_nc_sid=e3f864&_nc_ohc=xrOs6PopTEAAX89UkWU&_nc_ht=scontent.fmch2-1.fna&oh=88eb4d231f0a02f8dfc17b86a5116ac2&oe=5FA28981"),
              ),
            ),
          ],
        ),
      ),
      preferredSize: Size.fromHeight(50),
    );
  }
}
