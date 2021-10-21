import 'package:movies_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final String? overview;
  final int? id;
  final bool? adult;
  final String? backdropPath;
  final List<int>? genreIds;
  final int? voteCount;
  final String? originalLanguage;
  final String? originalTitle;
  final String? posterPath;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final String? releaseDate;
  final double? popularity;
  final String? mediaType;

  MovieModel({
    this.overview,
    this.id,
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.voteCount,
    this.originalLanguage,
    this.originalTitle,
    this.posterPath,
    this.title,
    this.video,
    this.voteAverage,
    this.releaseDate,
    this.popularity,
    this.mediaType,
  }) : super(
          id: id,
          backdropPath: backdropPath,
          posterPath: posterPath,
          releaseDate: releaseDate,
          title: title,
          voteAverage: voteAverage,
          overview: overview,
        );

  factory MovieModel.fromJson(dynamic json) {
    return MovieModel(
      overview: json['overview'],
      id: json['id'],
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      genreIds: json['genre_ids'] == null ? json['genre_ids'].cast<int>() : [],
      voteCount: json['vote_count'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      posterPath: json['poster_path'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average']?.toDouble() ?? 0.0,
      releaseDate: json['release_date'],
      popularity: json['popularity']?.toDouble() ?? 0.0,
      mediaType: json['media_type'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['overview'] = overview;
    map['id'] = id;
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['vote_count'] = voteCount;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['poster_path'] = posterPath;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['release_date'] = releaseDate;
    map['popularity'] = popularity;
    map['media_type'] = mediaType;
    return map;
  }}
