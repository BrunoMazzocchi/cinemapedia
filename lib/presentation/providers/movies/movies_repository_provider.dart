import 'package:cinemapedia/config/api_client.dart';
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';
import 'package:cinemapedia/infraestructure/datasources/movie_db_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(
    baseUrl: 'https://api.themoviedb.org/3',
    apiKey: Environment.movieApiKey, 
  );
});

final movieRepositoryProvider = Provider<MoviesRepository>((ref) {
  return MovieRepositoryImpl(dataSource: MovieDbDatasource(client: ref.read(apiClientProvider)));
});