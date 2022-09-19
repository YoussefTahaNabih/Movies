import '../../domain/entities/genres.dart';

class GenresTvModel extends TvGenres {
  const GenresTvModel({
    required super.name,
    required super.id,
  });

  factory GenresTvModel.fromJson(Map<String, dynamic> json) => GenresTvModel(
        name: json['name'],
        id: json['id'],
      );
}
