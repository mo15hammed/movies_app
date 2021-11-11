import 'package:equatable/equatable.dart';

class SearchParams extends Equatable {
  final String query;

  const SearchParams({
    required this.query,
  });

  @override
  List<Object?> get props => [query];
}
