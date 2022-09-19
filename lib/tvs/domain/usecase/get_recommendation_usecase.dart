import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/usecase/base_usecase.dart';

import '../../../core/error/failure.dart';
import '../entities/recommendation.dart';
import '../reposetory/base_movies_reposetory.dart';

class GetRecommendationTvUsecase
    extends BaseUseCase<List<TvRecommendation>, RecommendationTvParameter> {
  final BaseTvReposetory baseTvReposetory;

  GetRecommendationTvUsecase(this.baseTvReposetory);

  @override
  Future<Either<Failure, List<TvRecommendation>>> call(
      RecommendationTvParameter parameter) async {
    return await baseTvReposetory.getRecommedationTv(parameter);
  }
}

class RecommendationTvParameter extends Equatable {
  final int tvId;

  const RecommendationTvParameter({required this.tvId});

  @override
  List<Object?> get props => [tvId];
}
