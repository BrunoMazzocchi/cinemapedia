import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final popularMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final topRatedMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

final upcomingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;
  return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
});

typedef MovieCallback = Future<List<Movie>> Function({int page});

class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;
  bool isLoading = false; 
  bool hasReachedEnd = false; 
  final MovieCallback fetchMoreMovies;

  MoviesNotifier({List<Movie> movies = const [], required this.fetchMoreMovies}) : super(movies);

  void addMovies(List<Movie> movies) {
    if (movies.isNotEmpty) {
      state = [...state, ...movies];
    } else {
      hasReachedEnd = true;
    }
    isLoading = false;
  }

  void clearMovies() {
    state = [];
    currentPage = 0;
    hasReachedEnd = false;
  }

  void removeMovie(Movie movie) {
    state = state.where((element) => element.id != movie.id).toList();
  }

  Future<void> loadNextPage() async {
    if (isLoading || hasReachedEnd) return; 
    isLoading = true;
    currentPage++;
    try {
      final movies = await fetchMoreMovies(page: currentPage);
      addMovies(movies);
    } catch (e) {
      isLoading = false;
      rethrow; 
    }
  }
}