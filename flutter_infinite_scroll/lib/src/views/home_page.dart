import 'package:flutter/material.dart';
import 'package:flutter_infinite_scroll/src/services/peliculas_service.dart';
import 'package:flutter_infinite_scroll/src/widgets/movie_vertical.dart';

class HomePage extends StatelessWidget {

  final peliculasProvider = new PeliculasProvider();

  @override
  Widget build(BuildContext context) {

    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas en cines'),
        backgroundColor: Colors.indigoAccent,         
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[            
            _cardList(context),
          ],
        ),
      ),
    );
  }

  Widget _cardList(BuildContext context){

    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start ,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Populares', style: Theme.of(context).textTheme.headline6,)),
          SizedBox(height: 5.0,),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            
            builder: (BuildContext context, AsyncSnapshot<List> snapshot) {             
              //snapshot.data?.forEach((p) => print(p.title));
              if (snapshot.hasData){
                return MovieVertical(
                  peliculas: snapshot.data,
                  siguientePagina: peliculasProvider.getPopulares);
              } else {
                return Center(child: CircularProgressIndicator());
              }                            
            },
          ),
        ],
      ),
    );

  }

}