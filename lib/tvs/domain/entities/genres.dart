import 'package:equatable/equatable.dart';

class TvGenres extends Equatable {
  final String name;
  final int id;

  const TvGenres({required this.name, required this.id});

  @override
  List<Object?> get props => [name, id];
}
