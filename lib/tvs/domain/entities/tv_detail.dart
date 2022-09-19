import 'package:equatable/equatable.dart';
import 'package:movies/tvs/domain/entities/genres.dart';

class TvDetail extends Equatable {
  final int id;
  final int seasonNamber;
  final String title;
  final String backdropPath;
  final List<TvGenres> genres;
  final String overview;
  final double voteAverage;
  final String releaseDate;
  const TvDetail({
    required this.id,
    required this.seasonNamber,
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
        seasonNamber,
        title,
        backdropPath,
        genres,
        overview,
        voteAverage,
        releaseDate,
      ];
}
