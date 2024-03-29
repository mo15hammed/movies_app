import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/data/core/api_constants.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieBackdropWidget extends StatelessWidget {
  const MovieBackdropWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.75,
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.vertical(
                bottom: Radius.circular(Sizes.dimen_48.r),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: FractionallySizedBox(
              heightFactor: 1.0,
              widthFactor: 1.0,
              child: BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
                builder: (context, state) {
                  if (state is MovieBackdropChanged) {
                    return CachedNetworkImage(
                      imageUrl:
                          '${ApiConstants.BASE_IMAGE_URL + (state.movie.backdropPath ?? state.movie.posterPath)}',
                      fit: BoxFit.fill,
                    );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 5.0,
              sigmaY: 5.0,
            ),
            child: Container(
              width: ScreenUtil().screenWidth,
              height: 1,
              color: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
