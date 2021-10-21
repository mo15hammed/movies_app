import 'movie_model.dart';

class MoviesResultModel {
  List<MovieModel>? movies;

  MoviesResultModel({
    this.movies,
  });


  MoviesResultModel.fromJson(dynamic json) {
    if (json['results'] != null) {
      movies = [];
      json['results'].forEach((v) {
        movies?.add(MovieModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (movies != null) {
      map['results'] = movies?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}