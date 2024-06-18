import 'package:cinemapedia/domain/repositories/movies_repository.dart';
import 'package:cinemapedia/infraestructure/datasources/movie_db_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_repository_impl.dart';
import 'package:cinemapedia/presentation/providers/api_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final movieRepositoryProvider = Provider<MoviesRepository>((ref) {
  return MovieRepositoryImpl(dataSource: MovieDbDatasource(client: ref.read(apiClientProvider)));
});