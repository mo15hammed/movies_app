import 'package:movies_app/common/constants/api_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

class MovieDetailsModel extends MovieEntity {
  final bool? adult;
  // final String? backdropPath;
  final BelongsToCollection? belongsToCollection;
  final int? budget;
  final List<Genres>? genres;
  final String? homepage;
  // final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  // final String? overview;
  final double? popularity;
  // final String? posterPath;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  // final String? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;
  // final String? title;
  final bool? video;
  // final double? voteAverage;
  final int? voteCount;

  const MovieDetailsModel({
    this.adult,
    backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    overview,
    this.popularity,
    posterPath,
    this.productionCompanies,
    this.productionCountries,
    releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    title,
    this.video,
    voteAverage,
    this.voteCount,
  }) : super(
          id: id,
          title: title,
          overview: overview,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          backdropPath: ApiConstants.baseImageUrl + (backdropPath ?? ''),
          posterPath: ApiConstants.baseImageUrl + (posterPath ?? ''),
        );

  factory MovieDetailsModel.fromJson(dynamic json) {
    return MovieDetailsModel(
      adult: json['adult'],
      backdropPath: json['backdrop_path'],
      belongsToCollection: json['belongs_to_collection'] != null
          ? BelongsToCollection.fromJson(json['belongs_to_collection'])
          : null,
      budget: json['budget'],
      genres: json['genres']
              ?.map((v) => Genres.fromJson(v))
              ?.toList()
              ?.cast<Genres>() ??
          [],
      homepage: json['homepage'],
      id: json['id'],
      imdbId: json['imdb_id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      posterPath: json['poster_path'],
      productionCompanies: json['production_companies']
              ?.map((v) => ProductionCompany.fromJson(v))
              ?.toList()
              ?.cast<ProductionCompany>() ??
          [],
      productionCountries: json['production_countries']
              ?.map((v) => ProductionCountry.fromJson(v))
              ?.toList()
              ?.cast<ProductionCountry>() ??
          [],
      releaseDate: json['release_date'],
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: json['spoken_languages']
              ?.map((v) => SpokenLanguage.fromJson(v))
              ?.toList()
              ?.cast<SpokenLanguage>() ??
          [],
      status: json['status'],
      tagline: json['tagline'],
      title: json['title'],
      video: json['video'],
      voteAverage: json['vote_average'],
      voteCount: json['vote_count'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = adult;
    map['backdrop_path'] = backdropPath;
    if (belongsToCollection != null) {
      map['belongs_to_collection'] = belongsToCollection?.toJson();
    }
    map['budget'] = budget;
    if (genres != null) {
      map['genres'] = genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = homepage;
    map['id'] = id;
    map['imdb_id'] = imdbId;
    map['original_language'] = originalLanguage;
    map['original_title'] = originalTitle;
    map['overview'] = overview;
    map['popularity'] = popularity;
    map['poster_path'] = posterPath;
    if (productionCompanies != null) {
      map['production_companies'] =
          productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (productionCountries != null) {
      map['production_countries'] =
          productionCountries?.map((v) => v.toJson()).toList();
    }
    map['release_date'] = releaseDate;
    map['revenue'] = revenue;
    map['runtime'] = runtime;
    if (spokenLanguages != null) {
      map['spoken_languages'] =
          spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    map['tagline'] = tagline;
    map['title'] = title;
    map['video'] = video;
    map['vote_average'] = voteAverage;
    map['vote_count'] = voteCount;
    return map;
  }
}

/// english_name : "English"
/// iso_639_1 : "en"
/// name : "English"

class SpokenLanguage {
  SpokenLanguage({
    this.englishName,
    this.iso6391,
    this.name,
  });

  SpokenLanguage.fromJson(dynamic json) {
    englishName = json['english_name'];
    iso6391 = json['iso_639_1'];
    name = json['name'];
  }
  String? englishName;
  String? iso6391;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = englishName;
    map['iso_639_1'] = iso6391;
    map['name'] = name;
    return map;
  }
}

/// iso_3166_1 : "GB"
/// name : "United Kingdom"

class ProductionCountry {
  ProductionCountry({
    this.iso31661,
    this.name,
  });

  ProductionCountry.fromJson(dynamic json) {
    iso31661 = json['iso_3166_1'];
    name = json['name'];
  }
  String? iso31661;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    return map;
  }
}

/// id : 2
/// logo_path : "/wdrCwmRnLFJhEoH8GSfymY85KHT.png"
/// name : "Walt Disney Pictures"
/// origin_country : "US"

class ProductionCompany {
  ProductionCompany({
    this.id,
    this.logoPath,
    this.name,
    this.originCountry,
  });

  ProductionCompany.fromJson(dynamic json) {
    id = json['id'];
    logoPath = json['logo_path'];
    name = json['name'];
    originCountry = json['origin_country'];
  }
  int? id;
  String? logoPath;
  String? name;
  String? originCountry;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['logo_path'] = logoPath;
    map['name'] = name;
    map['origin_country'] = originCountry;
    return map;
  }
}

/// id : 35
/// name : "Comedy"

class Genres {
  Genres({
    this.id,
    this.name,
  });

  Genres.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }
  int? id;
  String? name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}

/// id : 837007
/// name : "Cruella Collection"
/// poster_path : "/lXiLDlf1AKOY6i0eOZ7gi7zLH2O.jpg"
/// backdrop_path : null

class BelongsToCollection {
  BelongsToCollection({
    this.id,
    this.name,
    this.posterPath,
    this.backdropPath,
  });

  BelongsToCollection.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
  }
  int? id;
  String? name;
  String? posterPath;
  dynamic backdropPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['poster_path'] = posterPath;
    map['backdrop_path'] = backdropPath;
    return map;
  }
}
