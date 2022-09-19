import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/tv.dart';
import '../reposetory/base_movies_reposetory.dart';

class GetPopularTvUseCase extends BaseUseCase<List<Tv>, NoParameter> {
  final BaseTvReposetory baseTvReposetory;

  GetPopularTvUseCase(this.baseTvReposetory);

  @override
  Future<Either<Failure, List<Tv>>> call(NoParameter parameter) async {
    return await baseTvReposetory.getPopularTv();
  }
}
