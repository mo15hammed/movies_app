import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/data/repositories/movie_repository_impl.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';
import 'package:dartz/dartz.dart';
import 'data/core/dio_helper.dart';
import 'domain/entities/app_error.dart';

Future<void> main() async {
  DioHelper dioHelper = DioHelper(Dio());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(dioHelper);
  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  GetTrending getTrending = GetTrending(movieRepository);

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
