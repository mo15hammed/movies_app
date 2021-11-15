import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/domain/entities/movie_entity.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieBackdropWidget extends StatelessWidget {
  const MovieBackdropWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      alignment: Alignment.topCenter,
      heightFactor: 0.7,
      child: Stack(
        children: [
          FractionallySizedBox(
            heightFactor: 1,
            widthFactor: 1,
            child: BlocBuilder<MovieBackdropCubit, MovieEntity?>(
              builder: (context, movie) {
                if (movie != null) {
                  return ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(Sizes.dimen_40.r),
                    ),
                    child: CachedNetworkImage(
                      imageUrl: movie.backdropPath ?? '',
                      fit: BoxFit.cover,
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 10.0),
            child: const SizedBox.expand(),
          )
        ],
      ),
    );
  }
}
