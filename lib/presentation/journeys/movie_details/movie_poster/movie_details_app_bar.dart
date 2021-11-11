import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/blocs/movie_favorite/movie_favorite_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieEntity movie;
  const MovieDetailAppBar({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Sizes.dimen_28,
          ),
        ),
        BlocBuilder<MovieFavoriteBloc, MovieFavoriteState>(
          builder: (context, state) {
            if (state is MovieFavoriteToggle) {
              return IconButton(
                onPressed: () {
                  context.read<MovieFavoriteBloc>().add(
                        ToggleFavoriteMoviesEvent(
                          movie,
                          state.isMovieFavorite,
                        ),
                      );
                },
                icon: Icon(
                  state.isMovieFavorite
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.white,
                  size: Sizes.dimen_28,
                ),
              );
            }

            return IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_border,
                color: Colors.white,
                size: Sizes.dimen_28,
              ),
            );
          },
        ),
      ],
    );
  }
}
