import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';

import 'data/core/dio_helper.dart';

Future<void> main() async {
  DioHelper dioHelper = DioHelper(Dio());
  MovieRemoteDataSource dataSource = MovieRemoteDataSourceImpl(dioHelper);

  dataSource.getTrending();
  dataSource.getPopular();
  dataSource.getPlayingNow();
  dataSource.getComingSoon();

  runApp(MovieApp());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

