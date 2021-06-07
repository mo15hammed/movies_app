import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:movies_app/domain/entities/movie_detail_entity.dart';

class MovieEntity extends Equatable {
  final String posterPath;
  final int id;
  final String backdropPath;
  final String title;
  final num voteAverage;
  final String releaseDate;
  final String overview;

  const MovieEntity({
    @required this.posterPath,
    @required this.id,
    @required this.backdropPath,
    @required this.title,
    @required this.voteAverage,
    @required this.releaseDate,
    @required this.overview,
  }) : assert(id != null, 'Movie id must not be null');

  @override
  List<Object> get props => [id, title, backdropPath];

  @override
  bool get stringify => true;

  factory MovieEntity.fromMovieDetailEntity(MovieDetailEntity movie) {
    return MovieEntity(
      posterPath: movie.posterPath,
      id: movie.id,
      backdropPath: movie.backdropPath,
      title: movie.title,
      voteAverage: movie.voteAverage,
      releaseDate: movie.releaseDate,
      overview: movie.overview,
    );
  }
}
