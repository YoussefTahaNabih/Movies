import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/movie_detail.dart';

import '../reposetory/base_movies_reposetory.dart';

class GetMoviesDetailsUseCase
    extends BaseUseCase<MovieDetail, MovieDetailsParameter> {
  final BaseMoviesReposetory baseMoviesReposetory;

  GetMoviesDetailsUseCase(this.baseMoviesReposetory);

  @override
  Future<Either<Failure, MovieDetail>> call(
      MovieDetailsParameter parameter) async {
    return await baseMoviesReposetory.getMovieDetails(parameter);
  }
}

class MovieDetailsParameter extends Equatable {
  final int movieId;

  const MovieDetailsParameter({required this.movieId});

  @override
  List<Object?> get props => [movieId];
}
