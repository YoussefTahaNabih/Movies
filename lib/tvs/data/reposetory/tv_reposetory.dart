import 'package:dartz/dartz.dart';
import 'package:movies/core/error/exception.dart';
import 'package:movies/core/error/failure.dart';

import 'package:movies/tvs/domain/entities/tv.dart';

import '../../domain/entities/recommendation.dart';
import '../../domain/entities/see_more_details.dart';
import '../../domain/entities/tv_detail.dart';
import '../../domain/reposetory/base_movies_reposetory.dart';
import '../../domain/usecase/get_movies_details_usecase.dart';
import '../../domain/usecase/get_recommendation_usecase.dart';
import '../database/movie_remote_data_source.dart';

class TvReposetory extends BaseTvReposetory {
  final BaseTvRemoteDataSource baseTvRemoteDataSource;

  TvReposetory(this.baseTvRemoteDataSource);
  @override
  Future<Either<Failure, List<Tv>>> onTheAirTv() async {
    final result = await baseTvRemoteDataSource.onTheAirTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getPopularTv() async {
    final result = await baseTvRemoteDataSource.getPopularTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Tv>>> getTopRatedTv() async {
    final result = await baseTvRemoteDataSource.getTopRatedTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, TvDetail>> getTvDetails(
      TvDetailsParameter parameter) async {
    final result = await baseTvRemoteDataSource.getTvDetails(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvRecommendation>>> getRecommedationTv(
      RecommendationTvParameter parameter) async {
    final result = await baseTvRemoteDataSource.getRecommendationTv(parameter);
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvSeeMore>>> getSeeMorePopularTv() async {
    final result = await baseTvRemoteDataSource.getSeeMorePopularTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<TvSeeMore>>> getSeeMoreTopRatedTv() async {
    final result = await baseTvRemoteDataSource.getSeeMoreTopRatedTv();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
