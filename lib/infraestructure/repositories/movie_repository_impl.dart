import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl implements MoviesRepository {
  final MoviesDataSource _dataSource;

  const MovieRepositoryImpl({required MoviesDataSource dataSource}) : _dataSource = dataSource;

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return _dataSource.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return _dataSource.getPopular(page: page);
  }
}