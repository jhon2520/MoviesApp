import 'package:flutter/material.dart';
import 'package:movies/src/models/pelicula_model.dart';
import 'package:movies/src/providers/peliculas_provider.dart';

class DataSearch extends SearchDelegate{

  final peliculasProvider = new PeliculasProvider();

/*
  final peliculas = [
    'spiderman',
    'el care pene',
    'escroto mac bolas de moco',
    'rapido y ocioso',
    'como me pica la nalga'
  ];

  final peliculasRecientes = [
    'spiderman',
    'capitan care nalga'
  ];
*/
  //como sobreescribir el "search" que sale por defecto
@override
  String get searchFieldLabel => 'Buscar...';

  @override
  List<Widget> buildActions(BuildContext context) {
      // Acciones de nuestro appbar
      return[
        IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          //cuando se presione la x en el icono se borra lo que han escrito
          query =  '';
        },
        )];
    }
  
    @override
    Widget buildLeading(BuildContext context) {
      // Icono a la izquiera del appbar
      return IconButton(icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        //tiempo de animación
        progress: transitionAnimation ,
      ), onPressed: (){
        //regresar a la ventana anterior, se usa un método interno que ya viene en el 
        //search delegate
        close(context, null);

      });
    }
  
    @override
    Widget buildResults(BuildContext context) {
      // crea los resultados que se van a mostrar
      return Container();
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
      //sugerencias que aparecen cuando la persona escribe
      if(query.isEmpty)
      {
        return Container();
      } 
      return FutureBuilder(
        future: peliculasProvider.buscarPelicula(query),
        builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if(snapshot.hasData)
          {

            final peliculas = snapshot.data;

            return ListView(
              children:
                peliculas.map((pelicula) {
                    return ListTile(
                      leading: FadeInImage(
                        image: NetworkImage(pelicula.getPosterImg()),
                        placeholder: AssetImage("assets/img/no-image.jpg"),
                        width: 50.0
                        ,fit: BoxFit.contain,
                      ),
                      title: Text(pelicula.title),
                      subtitle: Text(pelicula.originalTitle),
                      onTap: (){
                        //método propio para cerrar la busqueda
                        close(context, null);
                        //tengo que poner el uniqueid vacío porque si no habría un fallo
                        pelicula.uniqueId = "";
                        Navigator.pushNamed(context, "detalle", arguments: pelicula);
                      },
                    );
            }).toList()
              
            );
          }
          else {
          return Center(child: CircularProgressIndicator(),);

          }
        },
      );

  }

/*
    @override
    Widget buildSuggestions(BuildContext context) {
      //sugerencias que aparecen cuando la persona escribe

      //usando notación ternaria para decir se tiene el siguiente código, si el query de búsqueda
      //está vacío devuelvo totas las peligulas pero si no lo está entonces convierto la busqueda
      //y lo buscado a minúsuculas y luego traigo el elemento que haga pareja con la búsqueda
      
        final listaSujerida = (query.isEmpty) ? 
        peliculasRecientes 
        : peliculas.where((element) => element.toLowerCase().contains(query.toLowerCase())).toList();


         return ListView.builder(itemBuilder: (context,i){
            return ListTile(
              leading: Icon(Icons.movie),
              title: Text(listaSujerida[i]),
              onTap: (){/* showResults() métoodo propio que ejecuta lo que tenga en el método buildResults */},
            );
         }, 
         itemCount: listaSujerida.length,);

  }

*/
}