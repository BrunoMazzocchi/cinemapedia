import 'package:cinemapedia/domain/datasources/local/local_storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

// Current version uses ISAR as the local database
class MovieLocalDatasource implements LocalStorageDatasource {

  late Future<Isar> db; 

  MovieLocalDatasource() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    final dir = await getApplicationDocumentsDirectory();
    
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [MovieSchema], 
        inspector: true, 
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }
  

  @override
  Future<void> clearFavorites() async {
    return; 
  }

  @override
  Future<List<Movie>> getFavorites({int page = 0, int pageSize = 10}) async {
    final isar = await db;

    final List<Movie?> favorites = await isar.movies.where()
    .offset(page)
    .limit(pageSize)
    .findAll();


    return favorites.map((e) => e!).toList();
  }

  @override
  Future<bool> isFavorite(int movieId) async {
    final isar = await db;

    final Movie? isFavoriteMovie = await isar.movies
    .filter()
    .idEqualTo(movieId)
    .findFirst();

    return isFavoriteMovie != null;
  }

  @override
  Future<void> toogleFavorite(Movie movie) async {
    final isar = await db;

    final Movie? isFavoriteMovie = await isar.movies
    .filter()
    .idEqualTo(movie.id)
    .findFirst();

    if (isFavoriteMovie != null) {
      isar.writeTxn(() => isar.movies.delete(isFavoriteMovie.isarId!));
      return; 
    } else {
      isar.writeTxnSync(() => isar.movies.putSync(movie));
    }
  } 
  
}