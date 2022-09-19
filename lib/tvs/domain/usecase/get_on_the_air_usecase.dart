import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/tvs/domain/entities/tv.dart';

import '../../../core/error/failure.dart';
import '../reposetory/base_movies_reposetory.dart';

class OnTheAirTvUseCase extends BaseUseCase<List<Tv>, NoParameter> {
  final BaseTvReposetory baseTvReposetory;

  OnTheAirTvUseCase(this.baseTvReposetory);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameter parameter) async {
    return await baseTvReposetory.onTheAirTv();
  }
}
