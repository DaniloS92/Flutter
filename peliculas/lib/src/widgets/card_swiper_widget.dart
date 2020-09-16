import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  const CardSwiper({Key key, @required this.peliculas}) : super(key: key);
  // 0f31a56a1f07f3755f3c8eb22bb787e1
  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage("assets/img/loading.gif"),
              image: NetworkImage(peliculas[index].getPosterImg()),
              fit: BoxFit.cover,
            ),
          );
        },
        itemCount: peliculas.length,
      ),
    );
  }
}
