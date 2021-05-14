import 'package:movies_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final String overview;
  final String releaseDate;
  final bool adult;
  final String backdropPath;
  final List<int> genreIds;
  final String title;
  final String originalLanguage;
  final String originalTitle;
  final String posterPath;
  final int voteCount;
  final int id;
  final double voteAverage;
  final bool video;
  final double popularity;
  final String mediaType;

  MovieModel({
    this.overview,
    this.releaseDate,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.title,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.voteCount,
    this.id,
    this.voteAverage,
    this.video,
    this.popularity,
    this.mediaType,
  }) : super(
    id: id,
    title: title,
    backdropPath: backdropPath,
    overview: overview,
    posterPath: posterPath,
    releaseDate: releaseDate,
    voteAverage: voteAverage,
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      overview: json['overview'],
      releaseDate: json['release_date'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'].cast<int>(),
      title: json['title'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
      voteCount: json['vote_count'],
      id: json['id'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      video: json['video'],
      popularity: json['popularity']?.toDouble() ?? 0.0,
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['title'] = this.title;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['vote_count'] = this.voteCount;
    data['id'] = this.id;
    data['vote_average'] = this.voteAverage;
    data['video'] = this.video;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    return data;
  }
}
