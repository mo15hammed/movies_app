import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/screenutils/screenutils.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:movies_app/common/extensions/size_extensions.dart';
import 'package:movies_app/common/extensions/num_extensions.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/domain/entities/movie_detail_entity.dart';
import 'package:movies_app/presentation/themes/theme_color.dart';

import 'movie_detail_app_bar.dart';

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
              gradient:
                  LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [
            Colors.transparent,
            Theme.of(context).primaryColor,
          ])),
          child: CachedNetworkImage(
            imageUrl: '${ApiConstants.BASE_IMAGE_URL + movie.posterPath}',
            // width: ScreenUtil.defaultSize.width,
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: ListTile(
            title: Text(
              movie.title,
              style: Theme.of(context).textTheme.headline6,
            ),
            subtitle: Text(
              movie.releaseDate,
              style: Theme.of(context).textTheme.greySubtitle2,
            ),
            trailing: Text(
              movie.voteAverage.perc,
              style: Theme.of(context).textTheme.violetSubtitle1,
            ),
          ),
        ),
        Positioned(
          left: Sizes.dimen_10.w,
          right: Sizes.dimen_10.w,
          top: ScreenUtil().statusBarHeight + Sizes.dimen_4.h,
          child: MovieDetailAppBar(),
        ),
      ],
    );
  }
}
