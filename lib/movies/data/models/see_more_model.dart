import 'package:movies/movies/domain/entities/see_more_details.dart';

class SeeMoreModel extends SeeMore {
  const SeeMoreModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory SeeMoreModel.fromJson(Map<String, dynamic> json) => SeeMoreModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
      );
}
