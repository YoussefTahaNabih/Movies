import 'package:dartz/dartz.dart';
import 'package:movies/movies/domain/entities/see_more_details.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../reposetory/base_movies_reposetory.dart';

class GetSeeMoreTopRatedMoviesUseCase
    extends BaseUseCase<List<SeeMore>, NoParameter> {
  final BaseMoviesReposetory baseMoviesReposetory;

  GetSeeMoreTopRatedMoviesUseCase(this.baseMoviesReposetory);

  @override
  Future<Either<Failure, List<SeeMore>>> call(NoParameter parameter) async {
    return await baseMoviesReposetory.getSeeMoreTopRatedMovies();
  }
}
