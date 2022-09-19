import 'package:dartz/dartz.dart';

import '../../../core/error/failure.dart';
import '../../../core/usecase/base_usecase.dart';
import '../entities/movie.dart';
import '../reposetory/base_movies_reposetory.dart';

class GetTopRatedrMoviesUseCase extends BaseUseCase<List<Movie>, NoParameter> {
  final BaseMoviesReposetory baseMoviesReposetory;

  GetTopRatedrMoviesUseCase(this.baseMoviesReposetory);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async {
    return await baseMoviesReposetory.getTopRatedMovies();
  }
}
