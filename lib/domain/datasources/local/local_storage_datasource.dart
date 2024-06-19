import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageDatasource {
  Future<void> toogleFavorite(Movie movie);

  Future<List<Movie>> getFavorites({int page = 0, int pageSize = 10});

  Future<bool> isFavorite(int movieId);

  Future<void> clearFavorites();
}