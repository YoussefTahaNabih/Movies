import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/reposetory/base_movies_reposetory.dart';

import '../../../core/error/failure.dart';

class GetRecommendationUsecase
    extends BaseUseCase<List<Recommendation>, RecommendationParameter> {
  final BaseMoviesReposetory baseMoviesReposetory;

  GetRecommendationUsecase(this.baseMoviesReposetory);

  @override
  Future<Either<Failure, List<Recommendation>>> call(
      RecommendationParameter parameter) async {
    return await baseMoviesReposetory.getRecommedation(parameter);
  }
}

class RecommendationParameter extends Equatable {
  final int id;

  const RecommendationParameter({required this.id});

  @override
  List<Object?> get props => [id];
}
