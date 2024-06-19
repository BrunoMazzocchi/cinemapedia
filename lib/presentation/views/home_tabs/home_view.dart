

import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/presentation/providers/movies/initial_loading_provider.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_provides.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_slideshow_provider.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    
    if (initialLoading) {
      return const FullScreenLoader();
    }

    final nowPlayingMovies = ref.watch(moviesSlideShowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Column(
                children: [
                  Column(
                    children: [
                      MoviesSlideshow(movies: nowPlayingMovies),
                      MoviesHorizontalListview(
                        movies: ref.watch(nowPlayingMoviesProvider),
                        title: 'En cartelera',
                        subtitle: HumanFormats.date(DateTime.now()),
                        loadNextPage: () {
                          ref
                              .read(nowPlayingMoviesProvider.notifier)
                              .loadNextPage();
                        },
                      ),
                      MoviesHorizontalListview(
                        movies: popularMovies,
                        title: 'Populares',
                        loadNextPage: () {
                          ref
                              .read(popularMoviesProvider.notifier)
                              .loadNextPage();
                        },
                      ),
                      MoviesHorizontalListview(
                        movies: topRatedMovies,
                        title: 'Mejor valoradas',
                        loadNextPage: () {
                          ref
                              .read(topRatedMoviesProvider.notifier)
                              .loadNextPage();
                        },
                      ),
                      MoviesHorizontalListview(
                        movies: upcomingMovies,
                        title: 'Próximamente',
                        loadNextPage: () {
                          ref
                              .read(upcomingMoviesProvider.notifier)
                              .loadNextPage();
                        },
                      ),
                    ],
                  )
                ],
              );
            },
            childCount: 1,
          ),
        )
      ],
    );
  }
}
