import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_carousel/movie_carousel_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_tabs/movie_tabs_bloc.dart';
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
        BlocProvider<MovieCarouselBloc>(
          create: (_) => getItInstance<MovieCarouselBloc>()
            ..add(const MovieCarouselLoadEvent()),
        ),
        BlocProvider<MovieBackdropBloc>(
          create: (_) => getItInstance<MovieBackdropBloc>(),
        ),
        BlocProvider<MovieTabsBloc>(
          create: (_) =>
              getItInstance<MovieTabsBloc>()..add(const MovieTabChangedEvent()),
        ),
      ],
      child: Scaffold(
        drawer: const NavigationDrawer(),
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.6,
                    child: MovieCarouselWidget(
                      movies: state.movies,
                      index: state.defaultIndex,
                    ),
                  ),
                  const FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: MovieTabBarWidget(),
                  ),
                ],
              );
            }
            else if (state is MovieCarouselError) {
              return AppErrorWidget(
                message: state.message,
                errorType: state.errorType,
                onRetryPressed: () => context
                    .read<MovieCarouselBloc>()
                    .add(const MovieCarouselLoadEvent()),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
