import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/core/utils/enums.dart';

import '../../../domain/entities/recommendation.dart';
import '../../../domain/entities/tv_detail.dart';
import '../../../domain/usecase/get_movies_details_usecase.dart';
import '../../../domain/usecase/get_recommendation_usecase.dart';

part 'tv_details_event.dart';
part 'tv_details_state.dart';

class TvDetailsBloc extends Bloc<TvDetailsEvent, TvDetailsState> {
  TvDetailsBloc(this.getTvDetailsUseCase, this.getRecommendationTvUsecase)
      : super(const TvDetailsState()) {
    on<GetTvDetailsEvent>(_getTvDetails);
    on<GetTvRecommendationEvent>(_getRecommendation);
  }

  final GetTvDetailsUseCase getTvDetailsUseCase;
  final GetRecommendationTvUsecase getRecommendationTvUsecase;

  FutureOr<void> _getTvDetails(
      GetTvDetailsEvent event, Emitter<TvDetailsState> emit) async {
    final result =
        await getTvDetailsUseCase(TvDetailsParameter(tvId: event.id));

    result.fold(
        (l) => emit(
              state.copyWith(
                tvDetailsState: RequestState.error,
                tvDetailsMessage: l.message,
              ),
            ),
        (r) => emit(
              state.copyWith(tvDetail: r, tvDetailsState: RequestState.loaded),
            ));
  }

  FutureOr<void> _getRecommendation(
      GetTvRecommendationEvent event, Emitter<TvDetailsState> emit) async {
    final result = await getRecommendationTvUsecase(
        RecommendationTvParameter(tvId: event.id));

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
