import 'package:flutter/material.dart';
import 'package:movies/src/models/pelicula_model.dart';


class MovieHorizontal extends StatelessWidget{

final List<Pelicula> peliculas;

  MovieHorizontal({@required this.peliculas});

  @override 
  Widget build(BuildContext context){

final _screenSize = MediaQuery.of(context).size;

    return Container(

      height: _screenSize.height * 0.2,
      child: PageView(
        //se quita el magneto a la hora de arrastrar las imágenes
        pageSnapping: false,
        //cantidad de tarjetas mostradas en pantalla viewportFraction
        controller: PageController(initialPage: 1, viewportFraction: 0.22),
        children: _tarjetas(),
      ),

    );
  }

 List<Widget> _tarjetas() {

   return peliculas.map((pelicula) {

     return Container(
    margin: EdgeInsets.only(right: 15.0),
    child: Column(children: [
      ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
              child: FadeInImage(
          placeholder: AssetImage("assets/img/no-image.jpg"), 
          image: NetworkImage(pelicula.getPosterImg()),
          fit: BoxFit.cover,
          height: 100.0 ,
          ),
      ),
      SizedBox(height: 5.0 ,),
      Text(pelicula.title,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(fontSize: 9),)
    ],) ,
    );
   }).toList();

 }


}