import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/data/core/dio_helper.dart';
import 'package:movies_app/data/data_sources/local/movie_local_data_source.dart';
import 'package:movies_app/data/data_sources/remote/movie_remote_data_source.dart';
import 'package:movies_app/data/repositories/movie_repository_impl.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/check_if_movie_is_favorite.dart';
import 'package:movies_app/domain/usecases/delete_favorite_movie.dart';
import 'package:movies_app/domain/usecases/get_coming_soon.dart';
import 'package:movies_app/domain/usecases/get_favorite_movies.dart';
import 'package:movies_app/domain/usecases/get_movie_cast.dart';
import 'package:movies_app/domain/usecases/get_movie_details.dart';
import 'package:movies_app/domain/usecases/get_movie_videos.dart';
import 'package:movies_app/domain/usecases/get_playing_now.dart';
import 'package:movies_app/domain/usecases/get_popular.dart';
import 'package:movies_app/domain/usecases/get_searched_movies.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';
import 'package:movies_app/domain/usecases/save_favorite_movie.dart';
import 'package:movies_app/presentation/blocs/loading/loading_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_details/movie_details_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_favorite/movie_favorite_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_search/movie_search_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_tabs/movie_tabs_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_videos/movie_videos_bloc.dart';

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
  getItInstance.registerLazySingleton<MovieLocalDataSource>(
    () => MovieLocalDataSourceImpl(),
  );
  getItInstance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      remoteDataSource: getItInstance(),
      localDataSource: getItInstance(),
    ),
  );

  // use cases
  getItInstance.registerSingleton<LoadingBloc>(LoadingBloc());

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
  getItInstance.registerLazySingleton<GetMovieDetails>(
    () => GetMovieDetails(getItInstance()),
  );
  getItInstance.registerLazySingleton<GetMovieCast>(
    () => GetMovieCast(getItInstance()),
  );
  getItInstance.registerLazySingleton<GetMovieVideos>(
    () => GetMovieVideos(getItInstance()),
  );
  getItInstance.registerLazySingleton<GetSearchedMovies>(
    () => GetSearchedMovies(getItInstance()),
  );
  getItInstance.registerLazySingleton<GetFavoriteMovies>(
    () => GetFavoriteMovies(getItInstance()),
  );
  getItInstance.registerLazySingleton<SaveFavoriteMovie>(
    () => SaveFavoriteMovie(getItInstance()),
  );
  getItInstance.registerLazySingleton<DeleteFavoriteMovie>(
    () => DeleteFavoriteMovie(getItInstance()),
  );
  getItInstance.registerLazySingleton<CheckIfMovieIsFavorite>(
    () => CheckIfMovieIsFavorite(getItInstance()),
  );

  // blocs
  getItInstance.registerLazySingleton<MovieCarouselBloc>(
    () => MovieCarouselBloc(
      getTrending: getItInstance(),
      loadingBloc: getItInstance(),
    ),
  );
  getItInstance.registerLazySingleton<MovieBackdropBloc>(
    () => MovieBackdropBloc(),
  );
  getItInstance.registerLazySingleton<MovieTabsBloc>(
    () => MovieTabsBloc(
      getPopular: getItInstance(),
      getPlayingNow: getItInstance(),
      getComingSoon: getItInstance(),
    ),
  );
  getItInstance.registerFactory<MovieDetailsBloc>(
    () => MovieDetailsBloc(
      getMovieDetails: getItInstance(),
      loadingBloc: getItInstance(),
    ),
  );
  getItInstance.registerFactory<MovieCastBloc>(
    () => MovieCastBloc(getItInstance()),
  );
  getItInstance.registerFactory<MovieVideosBloc>(
    () => MovieVideosBloc(getItInstance()),
  );
  getItInstance.registerFactory<MovieSearchBloc>(
    () => MovieSearchBloc(
      loadingBloc: getItInstance(),
      getSearchedMovies: getItInstance(),
    ),
  );

  getItInstance.registerFactory<MovieFavoriteBloc>(
    () => MovieFavoriteBloc(
      getFavoriteMovies: getItInstance(),
      saveFavoriteMovie: getItInstance(),
      deleteFavoriteMovie: getItInstance(),
      checkIfMovieIsFavorite: getItInstance(),
    ),
  );
}
