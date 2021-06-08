import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/translation_constants.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/presentation/blocs/favorite/favorite_bloc.dart';

import 'fav_movies_widget.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(TranslationConsts.favMovies.t(context)),
      ),
      body: BlocProvider<FavoriteBloc>.value(
        value: getItInstance<FavoriteBloc>()..add(LoadFavMoviesEvent()),
        child: BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is FavMoviesLoaded) {
              if (state.movies.isEmpty) {
                return Center(
                  child: Text(
                    TranslationConsts.noFavMovies.t(context),
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                );
              } else {
                return FavMoviesWidget(movies: state.movies);
              }
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
