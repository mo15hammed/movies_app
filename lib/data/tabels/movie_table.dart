import 'package:hive_flutter/adapters.dart';
import 'package:movies_app/common/constants/api_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';

part 'movie_table.g.dart';

@HiveType(typeId: 0)
class MovieTable extends MovieEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String posterPath;

  const MovieTable({
    required this.id,
    required this.title,
    required this.posterPath,
  }) : super(
          id: id,
          title: title,
          posterPath: ApiConstants.baseImageUrl + posterPath,
          backdropPath: '',
          releaseDate: '',
          voteAverage: 0,
          overview: '',
        );

  factory MovieTable.fromEntity(MovieEntity movie) {
    return MovieTable(
      id: movie.id,
      title: movie.title,
      posterPath: movie.posterPath,
    );
  }
}
