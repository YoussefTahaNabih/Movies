import 'package:dartz/dartz.dart';

import 'package:movies/tvs/domain/entities/tv.dart';

import '../../../core/error/failure.dart';
import '../entities/recommendation.dart';
import '../entities/see_more_details.dart';
import '../entities/tv_detail.dart';
import '../usecase/get_movies_details_usecase.dart';
import '../usecase/get_recommendation_usecase.dart';

abstract class BaseTvReposetory {
  Future<Either<Failure, List<Tv>>> onTheAirTv();
  Future<Either<Failure, List<Tv>>> getPopularTv();
  Future<Either<Failure, List<Tv>>> getTopRatedTv();
  Future<Either<Failure, List<TvSeeMore>>> getSeeMorePopularTv();
  Future<Either<Failure, List<TvSeeMore>>> getSeeMoreTopRatedTv();

  Future<Either<Failure, List<TvRecommendation>>> getRecommedationTv(
      RecommendationTvParameter parameter);

  Future<Either<Failure, TvDetail>> getTvDetails(TvDetailsParameter parameter);
}
