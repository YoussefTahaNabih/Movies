import 'package:dartz/dartz.dart';
import 'package:movies/tvs/domain/entities/see_more_details.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../reposetory/base_movies_reposetory.dart';

class GetSeeMorePopularTvUseCase
    extends BaseUseCase<List<TvSeeMore>, NoParameter> {
  final BaseTvReposetory baseTvReposetory;

  GetSeeMorePopularTvUseCase(this.baseTvReposetory);

  @override
  Future<Either<Failure, List<TvSeeMore>>> call(NoParameter parameter) async {
    return await baseTvReposetory.getSeeMorePopularTv();
  }
}
