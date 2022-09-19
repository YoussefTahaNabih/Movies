import 'package:equatable/equatable.dart';
import 'package:movies/core/utils/enums.dart';
import 'package:movies/tvs/domain/entities/tv.dart';

import '../../../domain/entities/see_more_details.dart';

class TvState extends Equatable {
  final List<Tv> nowPlayingTv;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;

  final List<Tv> popularTv;
  final RequestState popularState;
  final String popularMessage;

  final List<Tv> topRatedTv;
  final RequestState topRatedState;
  final String topRatedMessage;

  final List<TvSeeMore> seeMorePopularTv;
  final RequestState seeMorePularState;
  final String seeMorePopularMessage;

  final List<TvSeeMore> seeMoreTopRatedTv;
  final RequestState seeMoreTopRatedState;
  final String seeMoreTopRatedMessage;

  const TvState({
    // ! Now Playing
    this.nowPlayingTv = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',

    // ! Popular
    this.popularTv = const [],
    this.popularState = RequestState.loading,
    this.popularMessage = '',

    // ! Top Rated
    this.topRatedTv = const [],
    this.topRatedState = RequestState.loading,
    this.topRatedMessage = '',

    // ! See More Popular
    this.seeMorePopularTv = const [],
    this.seeMorePularState = RequestState.loading,
    this.seeMorePopularMessage = '',

    // ! See More Top Rated
    this.seeMoreTopRatedTv = const [],
    this.seeMoreTopRatedState = RequestState.loading,
    this.seeMoreTopRatedMessage = '',
  });

  TvState copyWith({
    List<Tv>? nowPlayingTv,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Tv>? popularTv,
    RequestState? popularState,
    String? popularMessage,
    List<Tv>? topRatedTv,
    RequestState? topRatedState,
    String? topRatedMessage,
    List<TvSeeMore>? seeMorePopularTv,
    RequestState? seeMorePularState,
    String? seeMorePopularMessage,
    List<TvSeeMore>? seeMoreTopRatedTv,
    RequestState? seeMoreTopRatedState,
    String? seeMoreTopRatedMessage,
  }) {
    return TvState(
      nowPlayingTv: nowPlayingTv ?? this.nowPlayingTv,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularTv: popularTv ?? this.popularTv,
      popularState: popularState ?? this.popularState,
      popularMessage: popularMessage ?? this.popularMessage,
      topRatedTv: topRatedTv ?? this.topRatedTv,
      topRatedState: topRatedState ?? this.topRatedState,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      seeMorePopularTv: seeMorePopularTv ?? this.seeMorePopularTv,
      seeMorePularState: seeMorePularState ?? this.seeMorePularState,
      seeMorePopularMessage:
          seeMorePopularMessage ?? this.seeMorePopularMessage,
      seeMoreTopRatedTv: seeMoreTopRatedTv ?? this.seeMoreTopRatedTv,
      seeMoreTopRatedState: seeMoreTopRatedState ?? this.seeMoreTopRatedState,
      seeMoreTopRatedMessage:
          seeMoreTopRatedMessage ?? this.seeMoreTopRatedMessage,
    );
  }

  @override
  List<Object?> get props => [
        nowPlayingTv,
        nowPlayingState,
        nowPlayingMessage,
        popularTv,
        popularState,
        popularMessage,
        topRatedTv,
        topRatedState,
        topRatedMessage,
        seeMorePopularTv,
        seeMorePularState,
        seeMorePopularMessage,
        seeMoreTopRatedTv,
        seeMoreTopRatedState,
        seeMoreTopRatedMessage
      ];
}
