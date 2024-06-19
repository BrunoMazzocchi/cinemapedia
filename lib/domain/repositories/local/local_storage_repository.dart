import 'package:cinemapedia/domain/entities/movie.dart';

abstract class LocalStorageRepository {
  Future<void> toogleFavorite(Movie movie);

  Future<List<Movie>> getFavorites({int page = 1, int pageSize = 10});

  Future<bool> isFavorite(int movieId);

  Future<void> clearFavorites();
}