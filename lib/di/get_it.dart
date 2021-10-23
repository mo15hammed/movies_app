import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/data/core/dio_helper.dart';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/data/repositories/movie_repository_impl.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/get_coming_soon.dart';
import 'package:movies_app/domain/usecases/get_playing_now.dart';
import 'package:movies_app/domain/usecases/get_popular.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';

final getItInstance = GetIt.I;

void init() {
  /// All dependencies goes here!

  getItInstance.registerLazySingleton<Dio>(() => Dio());
  getItInstance.registerLazySingleton<DioHelper>(
    () => DioHelper(getItInstance()),
  );
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(
    () => MovieRemoteDataSourceImpl(getItInstance()),
  );
  getItInstance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(getItInstance()),
  );

  // use cases
  getItInstance.registerLazySingleton<GetTrending>(
    () => GetTrending(getItInstance()),
  );
  getItInstance.registerLazySingleton<GetPopular>(
    () => GetPopular(getItInstance()),
  );
  getItInstance.registerLazySingleton<GetPlayingNow>(
    () => GetPlayingNow(getItInstance()),
  );
  getItInstance.registerLazySingleton<GetComingSoon>(
    () => GetComingSoon(getItInstance()),
  );

  // blocs
  getItInstance.registerFactory<MovieCarouselBloc>(
        () => MovieCarouselBloc(getItInstance()),
  );

  getItInstance.registerFactory<MovieBackdropBloc>(
        () => MovieBackdropBloc(),
  );
}
