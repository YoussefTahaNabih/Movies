part of 'tv_details_bloc.dart';

class TvDetailsState extends Equatable {
  const TvDetailsState({
    this.tvDetail,
    this.tvDetailsState = RequestState.loading,
    this.tvDetailsMessage = '',
    this.recommendation = const [],
    this.recommendationState = RequestState.loading,
    this.recommendationMessage = '',
  });

  final TvDetail? tvDetail;
  final RequestState tvDetailsState;
  final String tvDetailsMessage;

  final List<TvRecommendation> recommendation;
  final RequestState recommendationState;
  final String recommendationMessage;

  TvDetailsState copyWith({
    TvDetail? tvDetail,
    RequestState? tvDetailsState,
    String? tvDetailsMessage,
    List<TvRecommendation>? recommendation,
    RequestState? recommendationState,
    String? recommendationMessage,
  }) {
    return TvDetailsState(
      tvDetail: tvDetail ?? this.tvDetail,
      tvDetailsState: tvDetailsState ?? this.tvDetailsState,
      tvDetailsMessage: tvDetailsMessage ?? this.tvDetailsMessage,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage:
          recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        tvDetail,
        tvDetailsState,
        tvDetailsMessage,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];
}
