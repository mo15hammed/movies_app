import 'package:get_it/get_it.dart';
import 'package:movies_app/data/data_sources/language_local_data_source.dart';
import 'package:movies_app/data/data_sources/movie_local_data_source.dart';
import 'package:movies_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movies_app/data/repositories/app_repository_impl.dart';
import 'package:movies_app/data/repositories/movie_repository_impl.dart';
import 'package:movies_app/domain/repositories/app_repository.dart';
import 'package:movies_app/domain/repositories/movie_repository.dart';
import 'package:movies_app/domain/usecases/delete_fav_movie.dart';
import 'package:movies_app/domain/usecases/get_cast.dart';
import 'package:movies_app/domain/usecases/get_coming_soon.dart';
import 'package:movies_app/domain/usecases/get_fav_movies.dart';
import 'package:movies_app/domain/usecases/get_movie_detail.dart';
import 'package:movies_app/domain/usecases/get_playing_now.dart';
import 'package:movies_app/domain/usecases/get_popular.dart';
import 'package:movies_app/domain/usecases/get_preferred_language.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';
import 'package:movies_app/domain/usecases/get_videos.dart';
import 'package:movies_app/domain/usecases/is_fav_movie.dart';
import 'package:movies_app/domain/usecases/save_fav_movie.dart';
import 'package:movies_app/domain/usecases/search_movies.dart';
import 'package:movies_app/domain/usecases/update_language.dart';
import 'package:movies_app/presentation/blocs/cast/cast_bloc.dart';
import 'package:movies_app/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:movies_app/presentation/blocs/language/language_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_detail/movie_detail_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_tabbed/movie_tabbed_bloc.dart';
import 'package:movies_app/presentation/blocs/search/search_bloc.dart';
import 'package:movies_app/presentation/blocs/videos/videos_bloc.dart';

final getItInstance = GetIt.I;

Future init() async {
  // data sources
  getItInstance.registerLazySingleton<MovieRemoteDataSource>(() => MovieRemoteDataSourceImpl());
  getItInstance.registerLazySingleton<MovieLocalDataSource>(() => MovieLocalDataSourceImpl());
  getItInstance.registerLazySingleton<LanguageLocalDataSource>(() => LanguageLocalDataSourceImpl());

  // repositories
  getItInstance.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(getItInstance(), getItInstance()),
  );

  getItInstance.registerLazySingleton<AppRepository>(
    () => AppRepositoryImpl(getItInstance()),
  );

  // use cases
  getItInstance.registerLazySingleton<GetTrending>(() => GetTrending(getItInstance()));
  getItInstance.registerLazySingleton<GetPopular>(() => GetPopular(getItInstance()));
  getItInstance.registerLazySingleton<GetComingSoon>(() => GetComingSoon(getItInstance()));
  getItInstance.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getItInstance()));
  getItInstance.registerLazySingleton<GetMovieDetail>(() => GetMovieDetail(getItInstance()));
  getItInstance.registerLazySingleton<GetCast>(() => GetCast(getItInstance()));
  getItInstance.registerLazySingleton<GetVideos>(() => GetVideos(getItInstance()));
  getItInstance.registerLazySingleton<SearchMovies>(() => SearchMovies(getItInstance()));
  getItInstance.registerLazySingleton<SaveFavMovie>(() => SaveFavMovie(getItInstance()));
  getItInstance.registerLazySingleton<GetFavMovies>(() => GetFavMovies(getItInstance()));
  getItInstance.registerLazySingleton<DeleteFavMovie>(() => DeleteFavMovie(getItInstance()));
  getItInstance.registerLazySingleton<IsFavMovie>(() => IsFavMovie(getItInstance()));
  getItInstance
      .registerLazySingleton<GetPreferredLanguage>(() => GetPreferredLanguage(getItInstance()));
  getItInstance.registerLazySingleton<UpdateLanguage>(() => UpdateLanguage(getItInstance()));

  // blocs
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
      videosBloc: getItInstance(),
      favoriteBloc: getItInstance(),
    ),
  );

  getItInstance.registerSingleton(
    CastBloc(getCast: getItInstance()),
  );

  getItInstance.registerSingleton(
    VideosBloc(getVideos: getItInstance()),
  );

  getItInstance.registerFactory(
    () => SearchBloc(
      searchMovies: getItInstance(),
    ),
  );

  getItInstance.registerSingleton<LanguageBloc>(
    LanguageBloc(
      getPreferredLanguage: getItInstance(),
      updateLanguage: getItInstance(),
    ),
  );

  getItInstance.registerSingleton(
    FavoriteBloc(
      saveFavMovie: getItInstance(),
      getFavMovies: getItInstance(),
      deleteFavMovie: getItInstance(),
      isFavMovie: getItInstance(),
    ),
  );
}
