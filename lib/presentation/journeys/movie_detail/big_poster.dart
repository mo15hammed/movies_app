import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:movies_app/common/extensions/num_extensions.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/domain/entities/movie_detail_entity.dart';
import 'movie_detail_app_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BigPoster extends StatelessWidget {
  final MovieDetailEntity movie;
  const BigPoster({
    Key key,
    @required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                Theme.of(context).primaryColor,
              ],
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL}${movie.posterPath}',
            placeholder: (context, str) => Container(height: Sizes.dimen_400.h),
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: Sizes.dimen_16.w),
            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Padding(
              padding: EdgeInsets.only(bottom: Sizes.dimen_10.h),
              child: Text(
                movie.releaseDate,
                style: Theme.of(context).textTheme.greySubtitle2.copyWith(),
              ),
            ),
            trailing: Text(
              movie.voteAverage.perc,
              style: Theme.of(context).textTheme.violetSubtitle1,
            ),
          ),
        ),
        Positioned(
          left: Sizes.dimen_16.w,
          right: Sizes.dimen_16.w,
          top: ScreenUtil().statusBarHeight + Sizes.dimen_12.h,
          child: MovieDetailAppBar(
            movie: movie,
          ),
        ),
      ],
    );
  }
}
