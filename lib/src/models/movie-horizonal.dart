import 'package:flutter/material.dart';
import 'package:movies/src/models/pelicula_model.dart';

class MovieHorizontal extends StatelessWidget {
  final List<Pelicula> peliculas;
  final Function siguientePagina;

  MovieHorizontal({@required this.peliculas, @required this.siguientePagina});

  final _pageController =
      new PageController(initialPage: 1, viewportFraction: 0.22);

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >=
          _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return Container(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        //se quita el magneto a la hora de arrastrar las imágenes
        pageSnapping: false,
        //cantidad de tarjetas mostradas en pantalla viewportFraction
        controller: _pageController,
        itemCount: peliculas.length,
        itemBuilder: (context, index) {
          return _tarjeta(context, peliculas[index]);
        },
       // children: _tarjetas(),
      ),
    );
  }

Widget _tarjeta(BuildContext context, Pelicula pelicula){

   pelicula.uniqueId = "${pelicula.id}-poster";
    final tarjeta =  Container(
        margin: EdgeInsets.only(right: 15.0),
        child: Column(
          children: [
            //el hero crea una transición de las tarjetas entre las páginas
            Hero(
              tag: pelicula.uniqueId ,
                child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: FadeInImage(
                  placeholder: AssetImage("assets/img/no-image.jpg"),
                  image: NetworkImage(pelicula.getPosterImg()),
                  fit: BoxFit.cover,
                  height: 100.0,
                ),
              ),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              pelicula.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 9),
            )
          ],
        ),
      );

      return GestureDetector(
        child: tarjeta,
        onTap: (){

          //en el navigator estoy mandando la película a modo de argumento
          //para que en la página detalle esta llegue con todas sus
          //características y poderlas usar
          Navigator.pushNamed(context, 'detalle',arguments: pelicula);
        },
      );
}

}
