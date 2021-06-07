import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:movies/src/models/pelicula_model.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  //se crea el constructor de la clase el @required convierte la lista de
  //películas en un parámetro obligatorio
  CardSwiper({@required this.peliculas});

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 1.0),
      child: Swiper(
        layout: SwiperLayout.STACK,
        itemWidth: _screenSize.width * 0.7,
        itemHeight: _screenSize.height * 0.5,
        itemBuilder: (BuildContext context, int index) {

            peliculas[index].uniqueId = "${peliculas[index].id}-tarjeta";

          //redondear tarjetas
          return Hero(
            tag: peliculas[index].uniqueId,
                      child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              //Mandar a la página de detalle cuando se presione una de las 
              //imágenes grandes
              child: GestureDetector(
                onTap: ()=> Navigator.pushNamed(context, "detalle", arguments: peliculas[index]),
                              child: FadeInImage(
                  image: NetworkImage(peliculas[index].getPosterImg()),
                  placeholder: AssetImage("assets/img/no-image.jpg"),
                  fit: BoxFit.cover,),
              )
              
            ),
          );
        },
        itemCount: peliculas.length,
        pagination: new SwiperPagination(),

        //control: new SwiperControl(),
      ),
    );

  }
}
