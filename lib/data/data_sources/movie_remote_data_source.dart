import 'package:movies_app/data/core/dio_helper.dart';
import 'package:movies_app/data/models/cast_crew_result_model.dart';
import 'package:movies_app/data/models/movie_detail_model.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/movies_result_model.dart';
import 'package:movies_app/data/models/video_model.dart';
import 'package:movies_app/data/models/video_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  Future<MovieDetailModel> getMovieDetail(int id);
  Future<List<CastModel>> getCastCrew(int id);
  Future<List<VideoModel>> getVideos(int id);
  Future<List<MovieModel>> getSearchMovies(String query);
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
    // print(movie.toJson());
    return movie;
  }

  @override
  Future<List<CastModel>> getCastCrew(int id) async {
    final response = await DioHelper.get(url: 'movie/$id/credits');
    final cast = CastCrewResultModel.fromJson(response).cast;
    // print(cast);
    return cast;
  }

  @override
  Future<List<VideoModel>> getVideos(int id) async {
    final response = await DioHelper.get(url: 'movie/$id/videos');
    final videos = VideoResultModel.fromJson(response).videos;
    // print(videos);
    return videos;
  }

  @override
  Future<List<MovieModel>> getSearchMovies(String query) async {
    final response = await DioHelper.get(url: 'search/movie', queryParams: {
      'query': query,
    });
    final movies = MoviesResultModel.fromJson(response).movies;
    return movies;
  }
}
