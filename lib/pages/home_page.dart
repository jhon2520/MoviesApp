import 'package:flutter/material.dart';
import 'package:movies/src/models/movie-horizonal.dart';
import 'package:movies/src/providers/peliculas_provider.dart';
import 'package:movies/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();

  

  @override
  Widget build(BuildContext context) {

    peliculasProvider.getPopular();

    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas en cine"),
        backgroundColor: Colors.indigo,
        actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [_swiperTarjetas(context), _footer(context)],
        ),
      ),
    );
  }

  Widget _swiperTarjetas(BuildContext context) {
    return FutureBuilder(
      future: peliculasProvider.getEnCines(),
      //future: peliculasProvider.getEnCines(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        if (snapshot.hasData) {
          return CardSwiper(peliculas: snapshot.data);
        } else {
          return Container(
              height: 400.0, child: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }

  Widget _footer(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.only(left: 10.0),
              child: Text("Populares",
                  style: Theme.of(context).textTheme.subtitle1)),
          SizedBox(height: 5.0),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
              //snapshot.data?.forEach((element) => print(element));

              if (snapshot.hasData) {
                return MovieHorizontal(peliculas: snapshot.data, siguientePagina: peliculasProvider.getPopular);
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
