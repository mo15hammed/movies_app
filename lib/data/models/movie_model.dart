import 'package:movies_app/common/constants/api_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  final bool? adult;
  final List<int>? genreIds;
  final int? voteCount;
  final String? originalLanguage;
  final String? originalTitle;
  final bool? video;
  final double? popularity;
  final String? mediaType;

  const MovieModel({
    overview,
    id,
    this.adult,
    backdropPath,
    this.genreIds,
    this.voteCount,
    this.originalLanguage,
    this.originalTitle,
    posterPath,
    title,
    this.video,
    voteAverage,
    releaseDate,
    this.popularity,
    this.mediaType,
  }) : super(
          id: id,
          backdropPath: ApiConstants.baseImageUrl + (backdropPath ?? ''),
          posterPath: ApiConstants.baseImageUrl + (posterPath ?? ''),
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
  }
}
