import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movies/core/usecase/base_usecase.dart';
import 'package:movies/core/utils/enums.dart';

import '../../../domain/usecase/get_on_the_air_usecase.dart';
import '../../../domain/usecase/get_popular_movies_usecase.dart';
import '../../../domain/usecase/get_see_more_popular_usecase.dart';
import '../../../domain/usecase/get_see_more_toprated_usecase.dart';
import '../../../domain/usecase/get_top_rated_usecase.dart';
import 'tv_event.dart';
import 'tv_state.dart';

class TvBloc extends Bloc<TvEvent, TvState> {
  final OnTheAirTvUseCase onTheAirTvUseCase;
  final GetPopularTvUseCase getPopularTvUseCase;
  final GetTopRatedrTvUseCase getTopRatedrTvUseCase;
  final GetSeeMorePopularTvUseCase getSeeMorePopularTvUseCase;
  final GetSeeMoreTopRatedTvUseCase getSeeMoreTopRatedTvUseCase;

  TvBloc(
      this.onTheAirTvUseCase,
      this.getPopularTvUseCase,
      this.getTopRatedrTvUseCase,
      this.getSeeMorePopularTvUseCase,
      this.getSeeMoreTopRatedTvUseCase)
      : super(const TvState()) {
    on<OnTheAirTvEvent>(_getOnTheAirTv);
    on<GetPopularTvEvent>(_getPopularTv);
    on<GetTopRatedTvEvent>(_getTopRatedTv);
    on<GetSeeMorePopularTvEvent>(_getSeeMorePopularTv);
    on<GetSeeMoreTopRatedTvEvent>(_getSeeMoreTopRatedTv);
  }

  FutureOr<void> _getOnTheAirTv(
      OnTheAirTvEvent event, Emitter<TvState> emit) async {
    final result = await onTheAirTvUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
              nowPlayingState: RequestState.error,
              nowPlayingMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            nowPlayingTv: r, nowPlayingState: RequestState.loaded)));
  }

  FutureOr<void> _getPopularTv(
      GetPopularTvEvent event, Emitter<TvState> emit) async {
    final result = await getPopularTvUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
              popularState: RequestState.error,
              popularMessage: l.message,
            )),
        (r) => emit(
            state.copyWith(popularTv: r, popularState: RequestState.loaded)));
  }

  FutureOr<void> _getTopRatedTv(
      GetTopRatedTvEvent event, Emitter<TvState> emit) async {
    final result = await getTopRatedrTvUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
              topRatedState: RequestState.error,
              topRatedMessage: l.message,
            )),
        (r) => emit(
            state.copyWith(topRatedTv: r, topRatedState: RequestState.loaded)));
  }

  FutureOr<void> _getSeeMorePopularTv(
      GetSeeMorePopularTvEvent event, Emitter<TvState> emit) async {
    final result = await getSeeMorePopularTvUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
              seeMorePularState: RequestState.error,
              seeMorePopularMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            seeMorePopularTv: r, seeMorePularState: RequestState.loaded)));
  }

  FutureOr<void> _getSeeMoreTopRatedTv(
      GetSeeMoreTopRatedTvEvent event, Emitter<TvState> emit) async {
    final result = await getSeeMoreTopRatedTvUseCase(const NoParameter());
    result.fold(
        (l) => emit(state.copyWith(
              seeMoreTopRatedState: RequestState.error,
              seeMoreTopRatedMessage: l.message,
            )),
        (r) => emit(state.copyWith(
            seeMoreTopRatedTv: r, seeMoreTopRatedState: RequestState.loaded)));
  }

  @override
  String toString() {
    return 'TvBloc(getNowPlayingTvUseCase: $onTheAirTvUseCase, getPopularTvUseCase: $getPopularTvUseCase, getTopRatedrTvUseCase: $getTopRatedrTvUseCase, getSeeMorePopularTvUseCase: $getSeeMorePopularTvUseCase, getSeeMoreTopRatedTvUseCase: $getSeeMoreTopRatedTvUseCase)';
  }
}
