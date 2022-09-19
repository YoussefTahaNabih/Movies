import '../../domain/entities/see_more_details.dart';

class SeeMoreTvModel extends TvSeeMore {
  const SeeMoreTvModel({
    required super.id,
    required super.title,
    required super.backdropPath,
    required super.overview,
    required super.voteAverage,
    required super.releaseDate,
  });

  factory SeeMoreTvModel.fromJson(Map<String, dynamic> json) => SeeMoreTvModel(
        id: json['id'],
        title: json['name'],
        backdropPath: json['poster_path'],
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['first_air_date'],
      );
}
