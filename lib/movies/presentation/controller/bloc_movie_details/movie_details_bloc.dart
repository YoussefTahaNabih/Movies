import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/entities/movie_detail.dart';
import 'package:movies/movies/domain/entities/recommendation.dart';
import 'package:movies/movies/domain/usecase/get_movies_details_usecase.dart';
import 'package:movies/movies/domain/usecase/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc(this.getMoviesDetailsUseCase, this.getRecommendationUsecase)
      : super(const MovieDetailsState()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMoviesDetailsUseCase getMoviesDetailsUseCase;
  final GetRecommendationUsecase getRecommendationUsecase;

  FutureOr<void> _getMovieDetails(
      GetMovieDetailsEvent event, Emitter<MovieDetailsState> emit) async {
    final result =
        await getMoviesDetailsUseCase(MovieDetailsParameter(movieId: event.id));

    result.fold(
        (l) => emit(
              state.copyWith(
                movieDetailsState: RequestState.error,
                movieDetailsMessage: l.message,
              ),
            ),
        (r) => emit(
              state.copyWith(
                  movieDetail: r, movieDetailsState: RequestState.loaded),
            ));
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event,
      Emitter<MovieDetailsState> emit) async {
    final result =
        await getRecommendationUsecase(RecommendationParameter(id: event.id));

    result.fold(
        (l) => emit(
              state.copyWith(
                recommendationState: RequestState.error,
                recommendationMessage: l.message,
              ),
            ),
        (r) => emit(
              state.copyWith(
                  recommendation: r, recommendationState: RequestState.loaded),
            ));
  }
}
