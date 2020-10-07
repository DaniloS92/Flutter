import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBar appBar;

  CustomAppBar()
      : appBar = new AppBar(
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

  @override
  Widget build(BuildContext context) {
    return new Theme(child: appBar, data: new ThemeData.light());
  }

  @override
  Size get preferredSize => appBar.preferredSize;
}
