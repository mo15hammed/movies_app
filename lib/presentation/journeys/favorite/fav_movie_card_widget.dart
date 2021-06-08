import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/route_constants.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/blocs/favorite/favorite_bloc.dart';
import 'package:movies_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavMovieCardWidget extends StatelessWidget {
  final MovieEntity movie;

  const FavMovieCardWidget({Key key, @required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {

        Navigator.of(context).pushNamed(
          RouteList.movieDetail,
          arguments: MovieDetailArgument(movie.id),
        ).then(
              (value) {
            getItInstance<FavoriteBloc>().add(LoadFavMoviesEvent());
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.dimen_16.w),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: AlignmentDirectional.topEnd,
              child: IconButton(
                onPressed: () {
                  BlocProvider.of<FavoriteBloc>(context).add(DeleteFavMovieEvent(movie.id));
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: Sizes.dimen_32.w,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
