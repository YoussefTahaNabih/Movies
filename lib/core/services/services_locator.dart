import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movies/movies/data/database/movie_remote_data_source.dart';
import 'package:movies/movies/domain/reposetory/base_movies_reposetory.dart';
import 'package:movies/movies/domain/usecase/get_movies_details_usecase.dart';
import 'package:movies/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movies/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/get_recommendation_usecase.dart';
import 'package:movies/movies/domain/usecase/get_see_more_popular_usecase.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_usecase.dart';
import 'package:movies/movies/presentation/controller/bloc_movie_details/movie_details_bloc.dart';
import '../../movies/data/reposetory/movies_reposetory.dart';
import '../../movies/domain/usecase/get_see_more_toprated_usecase.dart';
import '../../movies/presentation/controller/bloc_movies/movies_bloc.dart';

import '../../tvs/data/database/movie_remote_data_source.dart';
import '../../tvs/data/reposetory/tv_reposetory.dart';
import '../../tvs/domain/reposetory/base_movies_reposetory.dart';
import '../../tvs/domain/usecase/get_movies_details_usecase.dart';
import '../../tvs/domain/usecase/get_on_the_air_usecase.dart';
import '../../tvs/domain/usecase/get_popular_movies_usecase.dart';
import '../../tvs/domain/usecase/get_recommendation_usecase.dart';
import '../../tvs/domain/usecase/get_see_more_popular_usecase.dart';
import '../../tvs/domain/usecase/get_see_more_toprated_usecase.dart';
import '../../tvs/domain/usecase/get_top_rated_usecase.dart';
import '../../tvs/presentation/controller/bloc_movie_details/tv_details_bloc.dart';
import '../../tvs/presentation/controller/bloc_movies/tv_bloc.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    //! Bloc

    sl.registerFactory(() => MoviesBloc(
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
        ));
    sl.registerFactory(() => MovieDetailsBloc(
          sl(),
          sl(),
        ));
    //! Bloc TVs

    sl.registerFactory(() => TvBloc(
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
        ));
    sl.registerFactory(() => TvDetailsBloc(
          sl(),
          sl(),
        ));

    //! Use Cases Movies
    sl.registerLazySingleton(() => GetNowPlayingUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedrMoviesUseCase(sl()));
    sl.registerLazySingleton(() => GetMoviesDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationUsecase(sl()));
    sl.registerLazySingleton(() => GetSeeMorePopularMovisUseCase(sl()));
    sl.registerLazySingleton(() => GetSeeMoreTopRatedMoviesUseCase(sl()));
    //! Use Cases TVs
    sl.registerLazySingleton(() => OnTheAirTvUseCase(sl()));
    sl.registerLazySingleton(() => GetPopularTvUseCase(sl()));
    sl.registerLazySingleton(() => GetTopRatedrTvUseCase(sl()));
    sl.registerLazySingleton(() => GetTvDetailsUseCase(sl()));
    sl.registerLazySingleton(() => GetRecommendationTvUsecase(sl()));
    sl.registerLazySingleton(() => GetSeeMorePopularTvUseCase(sl()));
    sl.registerLazySingleton(() => GetSeeMoreTopRatedTvUseCase(sl()));

    //! Reposetory
    sl.registerLazySingleton<BaseMoviesReposetory>(
        () => MoviesReposetory(sl()));
    //! Reposetory TVs
    sl.registerLazySingleton<BaseTvReposetory>(() => TvReposetory(sl()));

    //! Remote Data Source
    sl.registerLazySingleton<BaseMovieRemoteDataSource>(
        () => MovieRemoteDataSource());
    //! Remote Data Source TVs
    sl.registerLazySingleton<BaseTvRemoteDataSource>(
        () => TvRemoteDataSource());

    sl.registerFactory<ImagePicker>(() => ImagePicker());
  }
}
