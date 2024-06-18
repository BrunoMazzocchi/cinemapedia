import 'package:animate_do/animate_do.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MoviesSlideshow extends StatelessWidget {
  final List<Movie> movies; 
  const MoviesSlideshow({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Swiper(
        onTap: (index) => debugPrint('Movie: ${movies[index].title}'),
        pagination: SwiperPagination( 
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: Theme.of(context).colorScheme.primary,
            color: Colors.grey,
          ),
        ),
        itemCount: movies.length,
        viewportFraction: 0.8,
        scale: 0.9,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          return _MovieSlide(movie: movie);
        },
      ),
    );
  }
}

class _MovieSlide extends StatelessWidget {
  final Movie movie;
  const _MovieSlide({required this.movie});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
    );

    return Padding(
      padding: const EdgeInsets.only(bottom: 30), 
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            movie.backdropPath, 
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress != null) {
                return const DecoratedBox(
                  decoration: BoxDecoration( 
                    color: Colors.black12,
                  ),
                );
              }
              // Fade in transition
              return GestureDetector(
                onTap: ()=> context.push('/movie/${movie.id}'),
                child: FadeIn(
                  duration: const Duration(milliseconds: 500),
                  child: child,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}