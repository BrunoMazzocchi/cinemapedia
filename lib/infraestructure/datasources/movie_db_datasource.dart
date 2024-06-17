import 'package:cinemapedia/config/api_client.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_moviedb.dart';

class MovieDbDatasource implements MoviesDataSource {
  final ApiClient _client; 

  const MovieDbDatasource({required ApiClient client}) : _client = client;  

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return _client.dio.get('/movie/now_playing', queryParameters: {'page': page}).then((response) {
      final List<MovieMovieDB> movies = List<MovieMovieDB>.from(response.data['results'].map((x) => MovieMovieDB.fromJson(x)));
      return movies.map((e) => MovieMapper.movieDBToEntity(e)).toList();
    });
  } 

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return _client.dio.get('/movie/popular', queryParameters: {'page': page}).then((response) {
      final List<MovieMovieDB> movies = List<MovieMovieDB>.from(response.data['results'].map((x) => MovieMovieDB.fromJson(x)));
      return movies.map((e) => MovieMapper.movieDBToEntity(e)).toList();
    });
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return _client.dio.get('/movie/top_rated', queryParameters: {'page': page}).then((response) {
      final List<MovieMovieDB> movies = List<MovieMovieDB>.from(response.data['results'].map((x) => MovieMovieDB.fromJson(x)));
      return movies.map((e) => MovieMapper.movieDBToEntity(e)).toList();
    });
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return _client.dio.get('/movie/upcoming', queryParameters: {'page': page}).then((response) {
      final List<MovieMovieDB> movies = List<MovieMovieDB>.from(response.data['results'].map((x) => MovieMovieDB.fromJson(x)));
      return movies.map((e) => MovieMapper.movieDBToEntity(e)).toList();
    });
  }
}