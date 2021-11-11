import 'package:hive_flutter/hive_flutter.dart';
import 'package:movies_app/data/tabels/movie_table.dart';

abstract class MovieLocalDataSource {
  String movieBoxName = 'movie_box';

  Future<void> saveMovie(MovieTable movie);
  Future<List<MovieTable>> getMovies();
  Future<void> deleteMovie(int id);
  Future<bool> checkIfMovieIsFavorite(int id);

}

class MovieLocalDataSourceImpl extends MovieLocalDataSource {

  MovieLocalDataSourceImpl() {
    Hive.registerAdapter(MovieTableAdapter());
  }

  @override
  Future<void> saveMovie(MovieTable movie) async {
    var movieBox = await Hive.openBox(movieBoxName);
    await movieBox.put(movie.id, movie);
  }

  @override
  Future<List<MovieTable>> getMovies() async {
    var movieBox = await Hive.openBox(movieBoxName);
    return List<MovieTable>.from(movieBox.values);

    // final movieIds = movieBox.keys;
    // List<MovieTable> movies = [];
    // for (int movieId in movieIds) {
    //   movies.add(movieBox.get(movieId));
    // }
    // return movies;
  }

  @override
  Future<void> deleteMovie(int id) async {
    var movieBox = await Hive.openBox(movieBoxName);
    await movieBox.delete(id);
  }

  @override
  Future<bool> checkIfMovieIsFavorite(int id) async {
    var movieBox = await Hive.openBox(movieBoxName);
    return movieBox.containsKey(id);

  }
}
