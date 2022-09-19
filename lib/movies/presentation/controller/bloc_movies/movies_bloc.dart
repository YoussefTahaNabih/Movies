import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movies/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies/movies/domain/usecase/get_see_more_popular_usecase.dart';
import 'package:movies/movies/domain/usecase/get_see_more_toprated_usecase.dart';
import 'package:movies/movies/domain/usecase/get_top_rated_usecase.dart';

import 'movies_event.dart';
import 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUseCase getNowPlayingUseCase;
  final GetPopularMoviesUseCase getPopularMoviesUseCase;
  final GetTopRatedrMoviesUseCase getTopRatedrMoviesUseCase;
  final GetSeeMorePopularMovisUseCase getSeeMorePopularUseCase;
  final GetSeeMoreTopRatedMoviesUseCase getSeeMoreTopRatedUseCase;

  MoviesBloc(
      this.getNowPlayingUseCase,
      this.getPopularMoviesUseCase,
      this.getTopRatedrMoviesUseCase,
      this.getSeeMorePopularUseCase,
      this.getSeeMoreTopRatedUseCase)
      : super(const MoviesState()) {
    on<GetNowPlayingEvent>(_getNewPlayingMovies);
    on<GetPopularEvent>(_getPopularMovies);
    on<GetTopRatedEvent>(_getTopRatedMovies);
    on<GetSeeMorePopularEvent>(_getSeeMorePopularMovies);
    on<GetSeeMoreTopRatedEvent>(_getSeeMoreTopRatedMovies);
  }

  FutureOr<void> _getNewPlayingMovies(
      GetNowPlayingEvent event, Emitter<MoviesState> emit) async {
    final result = await getNowPlayingUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            nowPlayingMovies: r, nowPlayingState: RequestState.loaded)));
  }

  FutureOr<void> _getPopularMovies(
      GetPopularEvent event, Emitter<MoviesState> emit) async {
    final result = await getPopularMoviesUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            popularMovies: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedEvent event, Emitter<MoviesState> emit) async {
    final result = await getTopRatedrMoviesUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            topRatedMovies: r, topRatedState: RequestState.loaded)));
  }

  FutureOr<void> _getSeeMorePopularMovies(
      GetSeeMorePopularEvent event, Emitter<MoviesState> emit) async {
    final result = await getSeeMorePopularUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
              seeMorePularState: RequestState.error,
              seeMorePopularMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            seeMorePopularMovies: r, seeMorePularState: RequestState.loaded)));
  }

  FutureOr<void> _getSeeMoreTopRatedMovies(
      GetSeeMoreTopRatedEvent event, Emitter<MoviesState> emit) async {
    final result = await getSeeMoreTopRatedUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
              seeMoreTopRatedState: RequestState.error,
              seeMoreTopRatedMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            seeMoreTopRatedMovies: r,
            seeMoreTopRatedState: RequestState.loaded)));
  }
}
