import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/common/constants/locale_keys.dart';
import 'package:movies_app/common/constants/size_constants.dart';
import 'package:movies_app/di/get_it.dart';
import 'package:movies_app/domain/entities/video_entity.dart';
import 'package:movies_app/presentation/journeys/loading/loading_widget.dart';
import 'package:movies_app/presentation/journeys/movie_videos/movie_video_item.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:movies_app/presentation/blocs/movie_videos/movie_videos_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MovieVideosScreen extends StatefulWidget {
  final int movieId;

  const MovieVideosScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  State<MovieVideosScreen> createState() => _MovieVideosScreenState();
}

class _MovieVideosScreenState extends State<MovieVideosScreen> {
  late YoutubePlayerController _playerController;
  late List<VideoEntity> _videos;

  @override
  void initState() {
    _playerController = YoutubePlayerController(
      initialVideoId: '',
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        hideThumbnail: true,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _playerController.dispose();
    super.dispose();
  }

  void _playNextVideo(String currentKey) {
    final currentIndex =
        _videos.indexWhere((element) => element.key == currentKey);

    late String nextKey;
    if (currentIndex == _videos.length - 1) {
      nextKey = _videos[0].key ?? '';
    } else {
      nextKey = _videos[currentIndex + 1].key ?? '';
    }
    _playerController.load(nextKey);
    _playerController.play();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getItInstance<MovieVideosBloc>()
        ..add(LoadMovieVideosEvent(widget.movieId)),
      child: BlocConsumer<MovieVideosBloc, MovieVideosState>(
        listener: (context, state) {
          if (state is MovieVideosLoadSuccess) {
            _videos = state.videos;
            _playerController = YoutubePlayerController(
              initialVideoId: _videos[0].key ?? '',
              flags: const YoutubePlayerFlags(
                autoPlay: true,
                mute: false,
                hideThumbnail: true,
              ),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: _playerController.value.isFullScreen
                ? null
                : AppBar(
                    title: Text(LocaleKeys.watchTrailers.tr()),
                    centerTitle: true,
                    leading: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: const Icon(
                        Icons.arrow_back_ios,
                      ),
                    ),
                  ),
            body: state is MovieVideosLoadSuccess
                ? YoutubePlayerBuilder(
                    player: YoutubePlayer(
                      controller: _playerController,
                      onEnded: (data) {
                        _playNextVideo(data.videoId);
                      },
                      showVideoProgressIndicator: true,
                      progressColors: ProgressBarColors(
                        backgroundColor: Theme.of(context).primaryColor,
                        handleColor: Theme.of(context).colorScheme.primary,
                        playedColor: Theme.of(context).colorScheme.primary,
                        bufferedColor: Colors.white,
                      ),
                      bottomActions: [
                        CurrentPosition(),
                        ProgressBar(
                          isExpanded: true,
                          colors: ProgressBarColors(
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .secondary
                                .withOpacity(0.3),
                            handleColor: Theme.of(context).colorScheme.primary,
                            playedColor: Theme.of(context).colorScheme.primary,
                            bufferedColor: Colors.white,
                          ),
                        ),
                        RemainingDuration(),
                        FullScreenButton(),
                      ],
                    ),
                    builder: (context, player) {
                      return Column(
                        children: [
                          player,
                          Expanded(
                            child: ListView.separated(
                              itemCount: _videos.length,
                              physics: const BouncingScrollPhysics(),
                              padding: EdgeInsets.symmetric(
                                horizontal: Sizes.dimen_8.w,
                                vertical: Sizes.dimen_16.h,
                              ),
                              itemBuilder: (context, index) {
                                final vid = _videos[index];
                                return MovieVideoItem(
                                  videoEntity: vid,
                                  thumbnail: YoutubePlayer.getThumbnail(
                                    videoId: vid.key ?? '',
                                    quality: ThumbnailQuality.high,
                                  ),
                                  onTap: () {
                                    if (_playerController.metadata.videoId !=
                                        vid.key) {
                                      _playerController.load(vid.key ?? '');
                                      _playerController.play();
                                    }
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return SizedBox(height: Sizes.dimen_8.h);
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  )
                : Center(child: LoadingWidget(size: Sizes.dimen_200.w)),
          );
        },
      ),
    );
  }
}
