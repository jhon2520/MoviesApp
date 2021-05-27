import 'package:flutter/material.dart';
import 'package:movies/src/providers/peliculas_provider.dart';
import 'package:movies/src/widgets/card_swiper_widget.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = new PeliculasProvider();

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Peliculas en cine"),
      backgroundColor: Colors.indigo,
      actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
    ),
    body: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [_swiperTarjetas(context),_footer(context)],
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
                    height: 400.0,
                    child: Center(
                      child: CircularProgressIndicator()));
                }
              },
            );
          }
        
Widget _footer(BuildContext context) {

  return Container(
  width: double.infinity,
  child: Column(
    children: [Text("Populares", style: Theme.of(context).textTheme.subtitle1),
    
    FutureBuilder(
      future: peliculasProvider.getPopular(),
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
        //TODO: / Aquí me está generando un error
        snapshot.data.forEach((element) => print(element));
        return Container();
      },
    ),
    ],
  ),
  );

}
}
