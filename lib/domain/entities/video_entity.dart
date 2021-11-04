import 'package:equatable/equatable.dart';

class VideoEntity extends Equatable {
  final String? name, key, type;

  const VideoEntity({
    required this.name,
    required this.key,
    required this.type,
  });

  @override
  List<Object?> get props => [key, name];
}
