import 'package:equatable/equatable.dart';

class MovieDetailEntity extends Equatable {
  final int id;
  final String title, overview, releaseDate, backdropPath, posterPath;
  final num voteAverage;

  const MovieDetailEntity({
    this.id,
    this.title,
    this.overview,
    this.releaseDate,
    this.backdropPath,
    this.posterPath,
    this.voteAverage,
  });

  @override
  List<Object> get props => [id];
}
