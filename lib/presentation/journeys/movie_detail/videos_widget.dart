import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/constants/translation_constants.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/presentation/blocs/videos/videos_bloc.dart';
import 'package:movies_app/presentation/journeys/movie_detail/watch_video/watch_video_arguments.dart';
import 'package:movies_app/presentation/journeys/movie_detail/watch_video/watch_video_screen.dart';
import 'package:movies_app/presentation/widgets/button.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideosWidget extends StatelessWidget {
  const VideosWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideosBloc, VideosState>(
      builder: (context, state) {
        if (state is VideosLoadSuccess && state.videos.isNotEmpty) {
          return Padding(
            padding: EdgeInsetsDirectional.only(
              top: Sizes.dimen_6.h,
              bottom: Sizes.dimen_16.h,
              start: Sizes.dimen_16.w,
              end: Sizes.dimen_16.w,
            ),
            child: Button(
              text: TranslationConsts.watchTrailers.t(context),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => WatchVideoScreen(
                    watchVideoArguments: WatchVideoArguments(state.videos),
                  ),
                ));
              },
            ),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
