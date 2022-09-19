import 'package:dartz/dartz.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/movies/domain/entities/movie.dart';
import 'package:movies/movies/domain/reposetory/base_movies_reposetory.dart';

import '../../../core/error/failure.dart';

class GetNowPlayingUseCase extends BaseUseCase<List<Movie>, NoParameter> {
  final BaseMoviesReposetory baseMoviesReposetory;

  GetNowPlayingUseCase(this.baseMoviesReposetory);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameter parameter) async {
    return await baseMoviesReposetory.getNowPlayingMovies();
  }
}
