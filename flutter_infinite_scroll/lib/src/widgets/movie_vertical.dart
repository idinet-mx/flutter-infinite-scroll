import 'package:flutter/material.dart';
import 'package:flutter_infinite_scroll/src/models/pelicula_model.dart';

class MovieVertical extends StatelessWidget {
  
  final List<Pelicula> peliculas;

  final Function siguientePagina;

  MovieVertical({@required this.peliculas, @required this.siguientePagina });

  final _pageController = new PageController(
    initialPage: 1,
    viewportFraction: 0.25
  );

  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;

    _pageController.addListener(() {
      if (_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200){
        siguientePagina();
      }


    });

    return Container(
      height: _screenSize.height * 0.75,
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        //pageSnapping: false,
        controller: _pageController,
        //children: _tarjetas(context),
        itemCount: peliculas.length,
        itemBuilder: ( context, i) => _tarjeta(context, peliculas[i])      
      ),
    );
  }

  Widget _tarjeta (BuildContext context, Pelicula pelicula) {

    pelicula.uniqueId = '${pelicula.id}-poster';

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        //margin: EdgeInsets.only(right: 15.0),
        child: Row(
          children: <Widget>[
            Hero(
              tag: pelicula.uniqueId,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: FadeInImage(
                  image: NetworkImage(pelicula.getPosterImg()),
                  placeholder: AssetImage('assets/img/no-image.jpg'),
                  fit: BoxFit.cover,
                  height: 200.0,
                ),
              ),
            ),
            SizedBox(width: 15.0,),
            Container(
              width: 200,
              child: Text (
                pelicula.title,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ],),
      );
  }

}