import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/data/core/dio_helper.dart';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/data/repositories/movie_repository_impl.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';

import 'domain/entities/app_error.dart';

Future<void> main() async {
  DioHelper.init();
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl();
  MovieRepository movieRepository = MovieRepositoryImpl(dataSource);
  // movieRepository.getTrending();
  GetTrending getTrending = GetTrending(movieRepository);
  final Either<AppError, List<MovieEntity>> eitherResponse = await getTrending(NoParams());
  eitherResponse.fold(
    (l) {
      print('error');
      print(l);
    },
    (r) {
      print('list of movies');
      print(r);
    },
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Container(

      ),
    );
  }
}

