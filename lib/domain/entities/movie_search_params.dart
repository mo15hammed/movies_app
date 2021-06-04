import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class MovieSearchParams extends Equatable {
  final String query;

  const MovieSearchParams({
    @required this.query,
  });

  @override
  List<Object> get props => [query];
}
