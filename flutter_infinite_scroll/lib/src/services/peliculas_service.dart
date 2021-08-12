import 'dart:async';
import 'dart:convert';

import 'package:flutter_infinite_scroll/src/models/pelicula_model.dart';
import 'package:http/http.dart' as http;

class PeliculasProvider {

  String _apikey    = '1a79bda8ac7d3180775f35e7e45b5431';
  String _url       = 'api.themoviedb.org';
  String _language  = 'es-ES';

  int _popularesPage = 0;
  bool _cargando = false;

  List<Pelicula> _populares = new List();

  final _popularesStreamController = StreamController<List<Pelicula>>.broadcast();

  Function (List<Pelicula>) get popularesSink => _popularesStreamController.sink.add;

  Stream<List<Pelicula>> get popularesStream => _popularesStreamController.stream;

  void disposeStreams(){

    _popularesStreamController?.close();

  }

  Future<List<Pelicula>> _procesarRespuesta (Uri url) async {
    
    final resp = await http.get(url);
    final decodedData = json.decode(resp.body);
    final peliculas = new Peliculas.fromJsonList(decodedData['results']);
    
    return peliculas.items;

  }

  Future<List<Pelicula>> getPopulares() async {
    
    if (_cargando) return [];
    
    _cargando = true;
    _popularesPage++;

    print('Cargando siguientes....');

    final url = Uri.https(_url, '3/movie/popular', {
      'api_key' : _apikey,
      'language' : _language,
      'page' : _popularesPage.toString(),
    });

    final resp = await _procesarRespuesta(url);

    _populares.addAll(resp);
    popularesSink(_populares);
    _cargando = false;

    return resp;

  }

}