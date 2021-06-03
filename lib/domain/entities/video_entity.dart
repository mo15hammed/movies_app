import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class VideoEntity extends Equatable {
  final String title, key, type;

  const VideoEntity({
    @required this.title,
    @required this.key,
    @required this.type,
  });

  @override
  // TODO: implement props
  List<Object> get props => [title];

  @override
  bool get stringify => true;

}