import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class CastEntity extends Equatable {
  final String creditId, name, posterPath, character;

  CastEntity({
    @required this.creditId,
    @required this.name,
    @required this.posterPath,
    @required this.character,
  });

  @override
  List<Object> get props => [creditId];
}
