import 'package:cinemapedia/infraestructure/datasources/actor_db_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/actor_repository_impl.dart';
import 'package:cinemapedia/presentation/providers/api_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl( ActorMovieDbDatasource(
    client: ref.read( apiClientProvider )
  ) );
});