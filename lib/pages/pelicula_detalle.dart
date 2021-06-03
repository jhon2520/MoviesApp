import 'package:flutter/material.dart';
import 'package:movies/src/models/pelicula_model.dart';

class PeliculaDetalle extends StatelessWidget{



  @override
  Widget build(BuildContext context){

    //con el siguiente código se pueden traer los argumentos del Navigator.pushNamed
    final Pelicula pelicula = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      body: Center(
        child: Text(pelicula.title)
      ,),
    );
  }
}