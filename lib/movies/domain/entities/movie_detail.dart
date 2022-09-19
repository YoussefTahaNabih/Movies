import 'package:equatable/equatable.dart';
import 'package:movies/movies/domain/entities/genres.dart';

class MovieDetail extends Equatable {
  final int id;
  final int runTime;
  final String title;
  final String backdropPath;
  final List<Genres> genres;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  const MovieDetail({
    required this.id,
    required this.runTime,
    required this.title,
    required this.backdropPath,
    required this.genres,
    required this.overview,
    required this.voteAverage,
    required this.releaseDate,
  });

  @override
  List<Object?> get props => [
        id,
        runTime,
        title,
        backdropPath,
        genres,
        overview,
        voteAverage,
        releaseDate,
      ];
}
