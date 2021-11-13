import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/locale_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/movie_favorite/movie_favorite_bloc.dart';

import 'favorite_movies_grid_view.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocaleKeys.favMovies.tr()),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: BlocProvider<MovieFavoriteBloc>(
        create: (_) =>
            getItInstance<MovieFavoriteBloc>()..add(LoadFavoriteMoviesEvent()),
        child: BlocBuilder<MovieFavoriteBloc, MovieFavoriteState>(
          builder: (BuildContext context, state) {
            if (state is MovieFavoriteLoadSuccess) {
              final movies = state.movies;
              if (movies.isEmpty) {
                return Center(
                  child: Text(
                    LocaleKeys.noFavMovies,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ).tr(),
                );
              } else {
                return FavoriteMoviesGridView(
                  movies: movies,
                );
              }
            }
            if (state is MovieFavoriteLoadError) {}
            return Container();
          },
        ),
      ),
    );
  }
}
