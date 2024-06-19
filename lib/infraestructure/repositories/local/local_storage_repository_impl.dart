import 'package:cinemapedia/domain/datasources/local/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/local/local_storage_repository.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {

  final LocalStorageDatasource _datasource; 

  LocalStorageRepositoryImpl({required LocalStorageDatasource datasource}) : _datasource = datasource;

  @override
  Future<void> clearFavorites() {
    return _datasource.clearFavorites();
  }

  @override
  Future<List<Movie>> getFavorites({int page = 1, int pageSize = 10}) {
    return _datasource.getFavorites(page: page, pageSize: pageSize);
  }

  @override
  Future<bool> isFavorite(int movieId) {
    return _datasource.isFavorite(movieId);
  }

  @override
  Future<void> toogleFavorite(Movie movie) {
    return _datasource.toogleFavorite(movie);
  }
}