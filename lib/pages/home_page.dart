import 'package:flutter/material.dart';
import 'package:movies/src/widgets/card_swiper_widget.dart';



//import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
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
          children: [_swiperTarjetas(context)],
        ),
      ),
    );
  }

  Widget _swiperTarjetas(BuildContext context) {
    //return Container();

   return CardSwiper(
      peliculas: [1,2,3,4,5]
    );
  }
}
