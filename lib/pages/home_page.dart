import 'package:flutter/material.dart';

//import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Peliculas en cine"),
        backgroundColor: Colors.indigo,
        actions: [IconButton(icon: Icon(Icons.search),
         onPressed: () {})],
      ),
      body: Container(
        child: Column(
          children: [
            _swiperTarjetas()
          ],
        ),
      ),
    );
  }

  Widget _swiperTarjetas() {

    return Container();
    
  }
}
