import '../../domain/entities/tv_detail.dart';
import 'genres_model.dart';

class TvDetailsModel extends TvDetail {
  const TvDetailsModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genres,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate,
      required super.seasonNamber});

  factory TvDetailsModel.fromJson(Map<String, dynamic> json) => TvDetailsModel(
        id: json['id'],
        title: json['name'],
        backdropPath: json['backdrop_path'],
        genres: List<GenresTvModel>.from(
            json['genres'].map((x) => GenresTvModel.fromJson(x))),
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['first_air_date'],
        seasonNamber: json['number_of_seasons'],
      );
}
