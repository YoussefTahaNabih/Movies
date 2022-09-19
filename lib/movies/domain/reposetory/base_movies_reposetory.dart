import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/entities/movie_detail.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/entities/see_more_details.dart';
import 'package:movies/movies/domain/usecase/get_movies_details_usecase.dart';
import 'package:movies/movies/domain/usecase/get_recommendation_usecase.dart';

import '../../../core/error/failure.dart';

abstract class BaseMoviesReposetory {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getTopRatedMovies();
  Future<Either<Failure, List<SeeMore>>> getSeeMorePopularMovies();
  Future<Either<Failure, List<SeeMore>>> getSeeMoreTopRatedMovies();

  Future<Either<Failure, List<Recommendation>>> getRecommedation(
      RecommendationParameter parameter);

  Future<Either<Failure, MovieDetail>> getMovieDetails(
      MovieDetailsParameter parameter);
}
