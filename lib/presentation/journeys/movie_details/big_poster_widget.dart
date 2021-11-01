import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';
import 'package:movies_app/common/extensions/num_extension.dart';

import 'movie_details_app_bar.dart';

class BigPosterWidget extends StatelessWidget {
  final MovieEntity movie;

  const BigPosterWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {



    return Stack(
      alignment: AlignmentDirectional.bottomStart,
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
          )),
          child: CachedNetworkImage(
            imageUrl: movie.posterPath ?? '',
            width: 1.sw,
          ),
        ),
        Positioned(
          top: ScreenUtil().statusBarHeight + Sizes.dimen_4.h,
          left: Sizes.dimen_16,
          right: Sizes.dimen_16,
          child: const MovieDetailAppBar(),
        ),
        ListTile(
          title: Text(
            movie.title ?? '',
            style: Theme.of(context).textTheme.headline5,
          ),
          subtitle: Text(
            movie.releaseDate ?? '',
            style: Theme.of(context).textTheme.greySubtitle1,
          ),
          trailing: Text(
            movie.voteAverage?.percentage ?? '',
            style: Theme.of(context).textTheme.violetHeadline6,
          ),
        ),
      ],
    );
  }
}
