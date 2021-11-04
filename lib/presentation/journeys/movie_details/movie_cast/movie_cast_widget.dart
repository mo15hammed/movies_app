import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/presentation/blocs/movie_cast/movie_cast_bloc.dart';
import 'package:movies_app/presentation/journeys/home/movie_carousel/app_error_widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/presentation/themes/theme_text.dart';

import '../movie_cast/cast_item_widget.dart';

class MovieCastWidget extends StatelessWidget {
  const MovieCastWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieCastBloc, MovieCastState>(
        builder: (context, state) {
      if (state is MovieCastLoadSuccess) {
        print(state.cast.length);
        return SizedBox(
          height: Sizes.dimen_260.h,
          child: ListView.separated(
            padding: EdgeInsets.symmetric(
              horizontal: Sizes.dimen_16.w,
              vertical: Sizes.dimen_8.h,
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: state.cast.length,
            itemBuilder: (context, index) {
              final castItem = state.cast[index];
              return CastItemWidget(castItem: castItem);
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: Sizes.dimen_8);
            },
          ),
        );
      }
      if (state is MovieCastLoadError) {
        return AppErrorWidget(
          message: state.message,
          errorType: state.errorType,
          onRetryPressed: () {},
        );
      }
      return const SizedBox.shrink();
    });
  }
}
