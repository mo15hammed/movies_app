import 'package:movies_app/data/core/dio_helper.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final DioHelper _dioHelper;

  MovieRemoteDataSourceImpl(this._dioHelper);

  @override
  Future<List<MovieModel>> getTrending() async {
    final data = await _dioHelper.get('trending/movie/day');
    final movies = MoviesResultModel.fromJson(data).movies;
    // print(movies);
    return movies ?? [];
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final data = await _dioHelper.get('movie/popular');
    final movies = MoviesResultModel.fromJson(data).movies;
    // print(movies);
    return movies ?? [];
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final data = await _dioHelper.get('movie/now_playing');
    final movies = MoviesResultModel.fromJson(data).movies;
    // print(movies);
    return movies ?? [];
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final data = await _dioHelper.get('movie/upcoming');
    final movies = MoviesResultModel.fromJson(data).movies;
    // print(movies);
    return movies ?? [];
  }

}
