import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/domain/entities/app_error.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/domain/entities/no_params.dart';
import 'package:movies_app/domain/usecases/get_trending.dart';
import 'package:movies_app/presentation/blocs/loading/loading_cubit.dart';

part 'movie_carousel_state.dart';

class MovieCarouselCubit extends Cubit<MovieCarouselState> {
  final LoadingCubit loadingCubit;
  final GetTrending getTrending;

  MovieCarouselCubit({
    required this.getTrending,
    required this.loadingCubit,
  }) : super(MovieCarouselInitial());

  void loadCarousel({index = 0}) async {
    loadingCubit.show();
    final movieEither = await getTrending(NoParams());

    movieEither.fold(
      (l) => emit(MovieCarouselError(
        message: l.message,
        errorType: l.errorType,
      )),
      (movies) {
        emit(MovieCarouselLoadSuccess(
          movies: movies,
          defaultIndex: index,
        ));
      },
    );

    loadingCubit.hide();
  }
}
