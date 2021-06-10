import 'package:hive/hive.dart';
import 'package:movies_app/data/tables/movie_table.dart';

abstract class MovieLocalDataSource {
  final String movieBoxName = 'movieBox';
  Future<void> saveMovie(MovieTable movieTable);
  Future<List<MovieTable>> getMovies();
  Future<void> deleteMovie(int movieId);
  Future<bool> isMovieFavorite(int movieId);

}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {
  @override
  Future<void> saveMovie(MovieTable movieTable) async {
    final movieBox = await Hive.openBox(movieBoxName);
    movieBox.put(movieTable.id, movieTable);
  }

  @override
  Future<List<MovieTable>> getMovies() async {
    final movieBox = await Hive.openBox(movieBoxName);
    return movieBox.values.toList().cast<MovieTable>();
  }

  @override
  Future<void> deleteMovie(int movieId) async {
    final movieBox = await Hive.openBox(movieBoxName);
    movieBox.delete(movieId);
  }

  @override
  Future<bool> isMovieFavorite(int movieId) async {
    final movieBox = await Hive.openBox(movieBoxName);
    return movieBox.containsKey(movieId);
  }


}