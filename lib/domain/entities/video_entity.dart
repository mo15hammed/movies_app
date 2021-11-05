import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String? name, key, type, publishedAt;

  const VideoEntity({
    required this.name,
    required this.key,
    required this.type,
    required this.publishedAt,
  });

  @override
  List<Object?> get props => [key, name];
}
