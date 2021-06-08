import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/entities/movie_detail_entity.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/blocs/favorite/favorite_bloc.dart';

class MovieDetailAppBar extends StatelessWidget {
  final MovieDetailEntity movie;
  const MovieDetailAppBar({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: Sizes.dimen_32.h,
          ),
        ),
        BlocBuilder<FavoriteBloc, FavoriteState>(
          builder: (context, state) {
            if (state is IsFavoriteMovie) {
              return GestureDetector(
                onTap: () => BlocProvider.of<FavoriteBloc>(context).add(
                  ToggleFavMovieEvent(
                    movieEntity: MovieEntity.fromMovieDetailEntity(movie),
                    isFav: state.isFav,
                  ),
                ),
                child: Icon(
                  state.isFav ? Icons.favorite : Icons.favorite_border,
                  color: Colors.white,
                  size: Sizes.dimen_32.h,
                ),
              );
            }

            return Icon(
              Icons.favorite_border,
              color: Colors.white,
              size: Sizes.dimen_32.h,
            );
          },
        ),
      ],
    );
  }
}
