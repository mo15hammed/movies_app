import 'package:movies_app/data/core/dio_helper.dart';
import 'package:movies_app/data/models/movie_detail_model.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/movies_result_model.dart';
import 'package:movies_app/domain/entities/movie_detail_entity.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();

  Future<MovieDetailModel> getMovieDetail(int id);
}

class MovieRemoteDataSourceImpl extends MovieRemoteDataSource {
  MovieRemoteDataSourceImpl() {
    DioHelper.init();
  }

  @override
  Future<List<MovieModel>> getTrending() async {
    final response = await DioHelper.get(url: 'trending/movie/day');
    final movies = MoviesResultModel.fromJson(response).movies;
    // print(movies);
    return movies;
  }


  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await DioHelper.get(url: 'movie/popular');
    final movies = MoviesResultModel.fromJson(response).movies;
    // print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final response = await DioHelper.get(url: 'movie/upcoming');
    final movies = MoviesResultModel.fromJson(response).movies;
    // print(movies);
    return movies;
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final response = await DioHelper.get(url: 'movie/now_playing');
    final movies = MoviesResultModel.fromJson(response).movies;
    // print(movies);
    return movies;
  }
  
  @override
  Future<MovieDetailModel> getMovieDetail(int id) async {
    final response = await DioHelper.get(url: 'movie/$id');
    final movie = MovieDetailModel.fromJson(response);
    print(movie.toJson());
    return movie;
  }
}
