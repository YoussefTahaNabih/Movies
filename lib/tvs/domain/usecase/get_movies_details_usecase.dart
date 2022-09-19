import 'package:equatable/equatable.dart';
import 'package:movies/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import '../entities/tv_detail.dart';
import '../reposetory/base_movies_reposetory.dart';

class GetTvDetailsUseCase extends BaseUseCase<TvDetail, TvDetailsParameter> {
  final BaseTvReposetory baseTvReposetory;

  GetTvDetailsUseCase(this.baseTvReposetory);

  @override
  Future<Either<Failure, TvDetail>> call(TvDetailsParameter parameter) async {
    return await baseTvReposetory.getTvDetails(parameter);
  }
}

class TvDetailsParameter extends Equatable {
  final int tvId;

  const TvDetailsParameter({required this.tvId});

  @override
  List<Object?> get props => [tvId];
}
