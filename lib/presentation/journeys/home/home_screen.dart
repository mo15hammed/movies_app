import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_cubit.dart';
import 'package:movies_app/presentation/blocs/movie_search/movie_search_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_tabs/movie_tabs_cubit.dart';
import 'package:movies_app/presentation/journeys/drawer/navigation_drawer.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/movie_carousel_widget.dart';
import 'movie_carousel/app_error_widget.dart';
import 'movie_tabs/movie_tab_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCarouselCubit>(
          create: (_) => getItInstance<MovieCarouselCubit>()..loadCarousel(),
        ),
        BlocProvider<MovieBackdropCubit>(
          create: (_) => getItInstance<MovieBackdropCubit>(),
        ),
        BlocProvider<MovieTabsCubit>(
          create: (_) =>
              getItInstance<MovieTabsCubit>()..changeMovieTab(),
        ),
        BlocProvider<MovieSearchBloc>(
          create: (_) => getItInstance<MovieSearchBloc>(),
        ),
      ],
      child: Scaffold(
        drawer: const NavigationDrawer(),
        body: BlocBuilder<MovieCarouselCubit, MovieCarouselState>(
          builder: (context, state) {
            if (state is MovieCarouselLoadSuccess) {
              return SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.6,
                      child: MovieCarouselWidget(
                        movies: state.movies,
                        index: state.defaultIndex,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: const MovieTabBarWidget(),
                    ),
                  ],
                ),
              );
            } else if (state is MovieCarouselError) {
              return AppErrorWidget(
                message: state.message,
                errorType: state.errorType,
                onRetryPressed: () =>
                    context.read<MovieCarouselCubit>().loadCarousel(),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
