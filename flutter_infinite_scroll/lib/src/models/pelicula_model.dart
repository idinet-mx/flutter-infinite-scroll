class Peliculas{

  List<Pelicula> items =  new List();

  Peliculas();

  Peliculas.fromJsonList( List<dynamic> jsonList ) {

    if (jsonList == null) return;
    
    for (var item in jsonList){
      final pelicula = new Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }

  }

}

class Pelicula {
  
  String uniqueId;

  double popularity;
  int voteCount;
  bool video;
  String posterPath;
  int id;
  bool adult;
  String backdropPath;
  String originalLanguage;
  String originalTitle;
  List<int> genreIds;
  String title;
  double voteAverage;
  String overview;
  String releaseDate;

  Pelicula({
    this.popularity,
    this.voteCount,
    this.video,
    this.posterPath,
    this.id,
    this.adult,
    this.backdropPath,
    this.originalLanguage,
    this.originalTitle,
    this.genreIds,
    this.title,
    this.voteAverage,
    this.overview,
    this.releaseDate,
  });

  Pelicula.fromJsonMap( Map<String, dynamic> json ) {

    voteCount        = json['vote_count'];
    popularity       = json['popularity'] / 1;
    posterPath       = json['poster_path'];
    video            = json['video'];
    id               = json['id'];
    adult            = json['adult'];
    backdropPath     = json['backdrop_path'];
    originalLanguage = json['original_language'];
    originalTitle    = json['original_title'];
    genreIds         = json['genre_ids'].cast<int>();
    title            = json['title'];
    voteAverage      = json['vote_average'] / 1;
    overview         = json['overview'];
    releaseDate      = json['release_date'];
    
  }

  getPosterImg() {

    if ( posterPath== null ) {
      return 'https://www.india-itme.com/uploads/investment/no-image.jpg';
    } else {
      return 'http://image.tmdb.org/t/p/w500/$posterPath';
    }
  }

  getBackgroundImg() {

    if ( backdropPath== null ) {
      return 'https://www.india-itme.com/uploads/investment/no-image.jpg';
    } else {
      return 'http://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }

}

