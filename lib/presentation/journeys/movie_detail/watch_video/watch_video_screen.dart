import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/common/constants/size_constraints.dart';
import 'package:movies_app/common/constants/translation_constants.dart';
import 'package:movies_app/common/extensions/string_extensions.dart';
import 'package:movies_app/domain/entities/video_entity.dart';
import 'package:movies_app/presentation/journeys/movie_detail/watch_video/watch_video_arguments.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchVideoScreen extends StatefulWidget {
  final WatchVideoArguments watchVideoArguments;
  const WatchVideoScreen({
    Key key,
    @required this.watchVideoArguments,
  }) : super(key: key);

  @override
  _WatchVideoScreenState createState() => _WatchVideoScreenState();
}

class _WatchVideoScreenState extends State<WatchVideoScreen> {
  List<VideoEntity> _videos;
  YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _videos = widget.watchVideoArguments.videos;
    _controller = YoutubePlayerController(
      initialVideoId: _videos[0].key,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          TranslationConsts.watchTrailers.t(context),
        ),
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
        ),
        builder: (context, player) {
          return Column(
            children: [
              player,
              SizedBox(height: Sizes.dimen_4.h),
              Expanded(
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Column(
                    children: _videos.map((v) {
                      return GestureDetector(
                        onTap: () {
                          _controller.load(v.key);
                          _controller.play();
                        },
                        child: Container(
                          height: Sizes.dimen_120.h,
                          padding: EdgeInsets.symmetric(vertical: Sizes.dimen_4.h),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CachedNetworkImage(
                                  imageUrl: YoutubePlayer.getThumbnail(
                                    videoId: v.key,
                                    quality: ThumbnailQuality.high,
                                  ),
                                  placeholder: (_, __) => Container(
                                    child: Center(child: CircularProgressIndicator()),
                                  ),
                                  // width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: Sizes.dimen_8.w),
                                  child: Text(
                                    v.title,
                                    style: Theme.of(context).textTheme.subtitle1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
