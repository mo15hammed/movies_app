import 'package:movies_app/domain/entities/video_entity.dart';

class WatchVideoArguments {
  final List<VideoEntity> videos;

  const WatchVideoArguments(this.videos);
}