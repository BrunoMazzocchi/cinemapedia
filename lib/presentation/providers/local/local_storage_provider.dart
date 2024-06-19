import 'package:cinemapedia/infraestructure/datasources/local/movie_local_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/local/local_storage_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localStorageRepositoryProvider = Provider((ref){
  return LocalStorageRepositoryImpl(datasource: MovieLocalDatasource());
});