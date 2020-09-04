import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 5.0),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://pley.today/__export/1585575753441/sites/mui/img/2020/03/30/alexandra_daddario-photo_background_wallpaper_1366x768.jpg_1865103617.jpg",
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 5.0),
            child: CircleAvatar(
              child: Text("DS"),
              foregroundColor: Colors.white,
              backgroundColor: Colors.brown,
            ),
          ),
        ],
      ),
      body: Center(
        child: FadeInImage(
          placeholder: AssetImage("assets/jar-loading.gif"),
          image: NetworkImage(
              "https://img2.freepng.es/20180404/ilw/kisspng-alexandra-daddario-zatanna-atrocitus-hal-jordan-th-cosplay-5ac4fbd0464c54.6935625515228589602879.jpg"),
        ),
      ),
    );
  }
}
