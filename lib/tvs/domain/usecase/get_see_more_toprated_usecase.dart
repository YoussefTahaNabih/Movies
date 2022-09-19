import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/see_more_details.dart';
import '../reposetory/base_movies_reposetory.dart';

class GetSeeMoreTopRatedTvUseCase
    extends BaseUseCase<List<TvSeeMore>, NoParameter> {
  final BaseTvReposetory baseTvReposetory;

  GetSeeMoreTopRatedTvUseCase(this.baseTvReposetory);

  @override
  Future<Either<Failure, List<TvSeeMore>>> call(NoParameter parameter) async {
    return await baseTvReposetory.getSeeMoreTopRatedTv();
  }
}
