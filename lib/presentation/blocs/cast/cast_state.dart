part of 'cast_bloc.dart';

abstract class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

class CastInitial extends CastState {}

class CastLoadSuccess extends CastState {
  final List<CastEntity> cast;

  const CastLoadSuccess({
    @required this.cast,
  });

  @override
  List<Object> get props => [cast];
}

class CastLoadError extends CastState {}