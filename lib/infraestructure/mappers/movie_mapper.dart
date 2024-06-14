import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieMapper { 
  static Movie movieDBToEntity (MovieMovieDB movieDb) {
    return Movie(
      id: movieDb.id,
      title: movieDb.title,
      overview: movieDb.overview,
      posterPath: movieDb.posterPath != '' ? 'https://image.tmdb.org/t/p/w500${movieDb.posterPath}' : 'https://via.placeholder.com/500x281.png?text=No+Image',
      backdropPath: movieDb.backdropPath != '' ? 'https://image.tmdb.org/t/p/w500${movieDb.backdropPath}' : 'https://via.placeholder.com/500x281.png?text=No+Image',
      releaseDate: movieDb.releaseDate,
      voteAverage: movieDb.voteAverage,
      voteCount: movieDb.voteCount,
      adult: movieDb.adult,
      originalLanguage: movieDb.originalLanguage,
      originalTitle: movieDb.originalTitle,
      popularity: movieDb.popularity,
      video: movieDb.video,
      genreIds: movieDb.genreIds.map((e) => e.toString()).toList()
    );
  }
}