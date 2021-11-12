import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/presentation/blocs/movie_favorite/movie_favorite_bloc.dart';
import 'package:movies_app/presentation/routing/app_router.dart';

class FavoriteMovieCard extends StatelessWidget {
  final MovieEntity movie;

  const FavoriteMovieCard({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          AppRouter.details,
          arguments: movie.id,
        );
      },
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(Sizes.dimen_12.r),
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl: movie.posterPath,
              placeholder: (_, __) => const SizedBox.shrink(),
              errorWidget: (_, __, ___) => const SizedBox.shrink(),
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black.withOpacity(0.2),
              width: double.infinity,
              height: double.infinity,
            ),
            PositionedDirectional(
              end: 0,
              child: IconButton(
                onPressed: () {
                  context
                      .read<MovieFavoriteBloc>()
                      .add(DeleteFavoriteMovieEvent(movie.id));
                },
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                icon: Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: Sizes.dimen_28.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
