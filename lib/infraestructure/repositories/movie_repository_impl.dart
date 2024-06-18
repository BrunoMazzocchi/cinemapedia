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

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return _dataSource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return _dataSource.getUpcoming(page: page);
  }

  @override
  Future<Movie> getMovieDetail(int movieId) {
    return _dataSource.getMovieDetail(movieId);
  }

  @override
  Future<List<Movie>> searchMovies(String query, {int page = 1}) {
    return _dataSource.searchMovies(query, page: page);
  }
}