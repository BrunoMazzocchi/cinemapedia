import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia/domain/entities/movie.dart';

final movieInfoProvider = StateNotifierProvider<MovieMapNotifier, Map<String, Movie>>((ref) {
  final movieRepository = ref.watch( movieRepositoryProvider );
  return MovieMapNotifier(getMovie: movieRepository.getMovieDetail );
});

typedef GetMovieCallback = Future<Movie>Function(int movieId);
typedef GetMovieRecommendationsCallback = Future<List<Movie>> Function(int movieId, {int page});

class MovieMapNotifier extends StateNotifier<Map<String,Movie>> {

  final GetMovieCallback getMovie;

  MovieMapNotifier({
    required this.getMovie,
  }): super({});


  Future<void> loadMovie( String movieId ) async {
    if ( state[movieId] != null ) return;
    final movie = await getMovie( int.parse(movieId) );
    state = { ...state, movieId: movie };
  }
}

final movieRecommendationsProvider = StateNotifierProvider.family<MovieRecommendationNotifier, List<Movie>, int>((ref, movieId) {
  final movieRepository = ref.watch(movieRepositoryProvider);

  return MovieRecommendationNotifier(
    getRecommendations: movieRepository.getRecommendations,
    movieId: movieId,
  );
});

class MovieRecommendationNotifier extends StateNotifier<List<Movie>> {
  final GetMovieRecommendationsCallback getRecommendations;
  final int movieId;

  MovieRecommendationNotifier({
    required this.getRecommendations,
    required this.movieId
  }): super([]);

  Future<void> loadRecommendations() async {
    final recommendations = await getRecommendations(movieId);
    state = [ ...state, ...recommendations ];
  }
}