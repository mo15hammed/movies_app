import 'package:movies_app/common/constants/api_constants.dart';
import 'package:movies_app/data/core/dio_helper.dart';
import 'package:movies_app/data/models/credits_result_model.dart';
import 'package:movies_app/data/models/movie_details_model.dart';
import 'package:movies_app/data/models/movie_model.dart';
import 'package:movies_app/data/models/videos_result_model.dart';
import 'package:movies_app/data/models/movies_result_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<MovieModel>> getTrending();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getPlayingNow();
  Future<List<MovieModel>> getComingSoon();
  Future<MovieDetailsModel> getMovieDetails(int id);
  Future<List<CastModel>> getMovieCast(int id);
  Future<List<VideoModel>> getMovieVideos(int id);
  Future<List<MovieModel>> getSearchedMovies(String query);
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final DioHelper _dioHelper;

  MovieRemoteDataSourceImpl(this._dioHelper);

  @override
  Future<List<MovieModel>> getTrending() async {
    final data = await _dioHelper.get(ApiConstants.trending);
    final movies = MoviesResultModel.fromJson(data).movies;
    // print(movies);
    return movies ?? [];
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final data = await _dioHelper.get(ApiConstants.popular);
    final movies = MoviesResultModel.fromJson(data).movies;
    // print(movies);
    return movies ?? [];
  }

  @override
  Future<List<MovieModel>> getPlayingNow() async {
    final data = await _dioHelper.get(ApiConstants.nowPlaying);
    final movies = MoviesResultModel.fromJson(data).movies;
    // print(movies);
    return movies ?? [];
  }

  @override
  Future<List<MovieModel>> getComingSoon() async {
    final data = await _dioHelper.get(ApiConstants.upcoming);
    final movies = MoviesResultModel.fromJson(data).movies;
    // print(movies);
    return movies ?? [];
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    final data = await _dioHelper.get('movie/$id');
    final movie = MovieDetailsModel.fromJson(data);
    // print(movie);
    return movie;
  }

  @override
  Future<List<CastModel>> getMovieCast(int id) async {
    final data = await _dioHelper.get('movie/$id/credits');
    final cast = CreditsResultModel.fromJson(data).cast;
    // print(cast);
    return cast ?? [];
  }

  @override
  Future<List<VideoModel>> getMovieVideos(int id) async {
    final data = await _dioHelper.get('movie/$id/videos');
    final videos = VideosResultModel.fromJson(data).videos;
    // print(videos);
    return videos ?? [];
  }

  @override
  Future<List<MovieModel>> getSearchedMovies(String query) async {
    final data = await _dioHelper.get(
      ApiConstants.search,
      queryParams: {
        'query': query,
      },
    );
    final movies = MoviesResultModel.fromJson(data).movies;
    // print(movies);
    return movies ?? [];
  }
}
