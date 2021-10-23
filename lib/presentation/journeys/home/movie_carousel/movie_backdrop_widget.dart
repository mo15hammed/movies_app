import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
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
            child: BlocBuilder<MovieBackdropBloc, MovieBackdropState>(
              builder: (context, state) {
                if (state is MovieBackdropChanged) {
                  return ClipRRect(
                    borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(Sizes.dimen_40.r)
                    ),
                    child: CachedNetworkImage(
                      imageUrl: state.movie.backdropPath ?? '',
                      fit: BoxFit.fitHeight,
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
