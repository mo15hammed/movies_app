import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/route_constants.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/presentation/journeys/movie_detail/movie_detail_arguments.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String posterPath;

  const MovieCardWidget({
    Key key,
    this.movieId,
    this.posterPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          RouteList.movieDetail,
          arguments: MovieDetailArgument(movieId),
        );
      },
      child: Material(
        elevation: 32.0,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(Sizes.dimen_6.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(Sizes.dimen_6.w),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL + posterPath}',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
