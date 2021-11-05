import 'package:movies_app/domain/entities/video_entity.dart';

class VideosResultModel {
  int? id;
  List<VideoModel>? videos;

  VideosResultModel({
    this.id,
    this.videos,
  });

  VideosResultModel.fromJson(dynamic json) {
    id = json['id'];
    if (json['results'] != null) {
      videos = [];
      json['results'].forEach((v) {
        videos?.add(VideoModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    if (videos != null) {
      map['results'] = videos?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class VideoModel extends VideoEntity {
  final String? iso6391;
  final String? iso31661;
  final String? site;
  final int? size;
  final bool? official;
  final String? id;

  const VideoModel({
    this.iso6391,
    this.iso31661,
    this.site,
    this.size,
    this.official,
    publishedAt,
    this.id,
    name,
    key,
    type,
  }) : super(
          name: name,
          key: key,
          type: type,
          publishedAt: publishedAt,
        );

  factory VideoModel.fromJson(dynamic json) {
    return VideoModel(
      iso6391: json['iso_639_1'],
      iso31661: json['iso_3166_1'],
      name: json['name'],
      key: json['key'],
      site: json['site'],
      size: json['size'],
      type: json['type'],
      official: json['official'],
      publishedAt: json['published_at'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_639_1'] = iso6391;
    map['iso_3166_1'] = iso31661;
    map['name'] = name;
    map['key'] = key;
    map['site'] = site;
    map['size'] = size;
    map['type'] = type;
    map['official'] = official;
    map['published_at'] = publishedAt;
    map['id'] = id;
    return map;
  }
}
