import 'package:flutter/material.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';
import 'package:dartz/dartz.dart';
import 'domain/entities/app_error.dart';
import 'di/get_it.dart' as getIt;

Future<void> main() async {
  getIt.init();
  GetTrending getTrending = getIt.getItInstance<GetTrending>();

  final Either<AppError, List<MovieEntity>> eitherRes = await getTrending(NoParams());

  eitherRes.fold((l) {
    print('error');
    print(l.message);
  }, (movies) {
    print('list of movies');
    print(movies);
  });

  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
