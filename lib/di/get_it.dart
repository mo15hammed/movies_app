import 'package:get_it/get_it.dart';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/data/repositories/movie_repository_impl.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/get_cast.dart';
import 'package:movies_app/domain/usecases/get_coming_soon.dart';
import 'package:movies_app/domain/usecases/get_movie_detail.dart';
import 'package:movies_app/domain/usecases/get_playing_now.dart';
import 'package:movies_app/domain/usecases/get_popular.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';
import 'package:movies_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movies_app/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  // All dependencies goes here
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl());
  getItInstance.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(getItInstance()));

  getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance.registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(() => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetMovieDetail>(() => GetMovieDetail(getItInstance()));
  getItInstance.registerLazySingleton<GetCast>(() => GetCast(getItInstance()));

  getItInstance.registerFactory<MovieCarouselBloc>(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
      movieBackdropBloc: getItInstance(),
    ),
  );

  getItInstance.registerFactory<MovieBackdropBloc>(
    () => MovieBackdropBloc(),
  );

  getItInstance.registerFactory<MovieTabbedBloc>(
    () => MovieTabbedBloc(
      getPopular: getItInstance(),
      getPlayingNow: getItInstance(),
      getComingSoon: getItInstance(),
    ),
  );

  getItInstance.registerFactory(
    () => MovieDetailBloc(
      getMovieDetail: getItInstance(),
      castBloc: getItInstance(),
    ),
  );

  getItInstance.registerSingleton(
    CastBloc(getCast: getItInstance()),
  );

  getItInstance.registerSingleton<LanguageBloc>(LanguageBloc());
}
