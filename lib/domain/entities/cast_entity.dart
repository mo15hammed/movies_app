import 'package:equatable/equatable.dart';

class CastEntity extends Equatable {
  final int? id;
  final String? name, character, profilePath;

  const CastEntity({
    required this.id,
    required this.name,
    required this.character,
    required this.profilePath,
  });

  @override
  List<Object?> get props => [id, name];
}
