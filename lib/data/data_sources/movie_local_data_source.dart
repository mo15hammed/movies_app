import 'package:hive/hive.dart';
import 'package:movies_app/data/tables/movie_table.dart';

abstract class MovieLocalDataSource {
  Future<void> saveMovie(MovieTable movieTable);
  Future<List<MovieTable>> getMovies();
  Future<void> deleteMovie(int movieId);
  Future<bool> isMovieFavorite(int movieId);

}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  @override
  Future<void> saveMovie(MovieTable movieTable) async {
    final movieBox = await Hive.openBox('movieBox');
    movieBox.put(movieTable.id, movieTable);
  }

  @override
  Future<List<MovieTable>> getMovies() async {
    final movieBox = await Hive.openBox('movieBox');
    final movieIds = movieBox.keys;
    return movieIds.map((id) => movieBox.get(id) as MovieTable).toList();
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    movieBox.delete(movieId);
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    return movieBox.containsKey(movieId);
  }


}