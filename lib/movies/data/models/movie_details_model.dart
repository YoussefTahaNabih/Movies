import 'package:movies/movies/domain/entities/movie_detail.dart';

import 'genres_model.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel(
      {required super.id,
      required super.title,
      required super.backdropPath,
      required super.genres,
      required super.overview,
      required super.voteAverage,
      required super.releaseDate,
      required super.runTime});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        genres: List<GenresModel>.from(
            json['genres'].map((x) => GenresModel.fromJson(x))),
        overview: json['overview'],
        voteAverage: json['vote_average'].toDouble(),
        releaseDate: json['release_date'],
        runTime: json['runtime'],
      );
}
