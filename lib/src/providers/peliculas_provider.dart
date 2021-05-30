import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:movies/src/models/pelicula_model.dart';

class PeliculasProvider {
  String _apiKey = "a27fc2203f51a1bb39546fb877cdac6a";
  String _url = "api.themoviedb.org";
  String _language = "es-Es";

  Future<List<Pelicula>> _procesarRespuesta(Uri url) async {
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData["results"]);
    return peliculas.items;

  }


  //Llamado al EndPoint
  Future<List<Pelicula>> getEnCines() async {
    //Uri es un objeto de dart para manipular url
    //Aquí se genera el URL, el número 3 es la versión de la api tal como está en la página de la apa indicado
    final url = Uri.https(_url, "3/movie/now_playing",
        {"api_key": _apiKey, "language": _language});
    //Aquí se va a  hacer la petición http, se debe instalar el paquete http  https://pub.dev/packages/http
    return await _procesarRespuesta(url);
  }

  Future<List<Pelicula>> getPopular() async{

    final url = Uri.https(_url, "3/movie/popular",{
      "api_key": _apiKey, "language": _language});
      return await _procesarRespuesta(url);
  }
}
